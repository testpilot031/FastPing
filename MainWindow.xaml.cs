using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Net.NetworkInformation;
using System.Threading;
using System.Data;
using System.Text.RegularExpressions;
using System.Windows.Threading;
using Microsoft.Win32;
using System.IO;
namespace FastPing
{

    /// <summary>
    /// MainWindow.xaml の相互作用ロジック
    /// </summary>
    public partial class MainWindow : Window
    {
        // データテーブル
        private DataTable ResultTable;
        private bool isCanceled = false;
        public MainWindow()
        {
            InitializeComponent();

            // テーブルの初期化
            try
            {
                InitTables();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, Title, MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

        }
        // メンバ関数
        /// <summary>
        /// テーブルの初期化
        /// </summary>
        private void InitTables()
        {
            // 
            ResultTable = new DataTable("DataGridTest");
            ResultTable.Columns.Add(new DataColumn("Time", typeof(string)));// 文字列
            ResultTable.Columns.Add(new DataColumn("Result", typeof(string)));// 文字列
            ResultTable.Columns.Add(new DataColumn("Address", typeof(string)));// 文字列
            ResultTable.Columns.Add(new DataColumn("RT(ms)", typeof(string)));// 文字列
            ResultTable.Columns.Add(new DataColumn("Status", typeof(string)));// 文字列
            // グリッドにバインド
            ResultDisply.DataContext = ResultTable;

            PingTimeout.SelectedIndex = 2;
            PingInterval.SelectedIndex = 2;
        }

        private void StartButtonClick(object sender, RoutedEventArgs e)
        {
            int UIUpdateTimeng = 20;
            isCanceled = false;
            StartButton.IsEnabled = false;
            StopButton.IsEnabled = true;
            
            string Address = Regex.Replace(InputAddress.Text, "//.+", "");
            
            char[] separator = new char[] { '\r', '\n' };
            string[] AddressList = Address.Split(separator, StringSplitOptions.RemoveEmptyEntries);//RemoveEmptyEntries→空行は含めない

            Int16 pt = Int16.Parse(((PingTimeout)PingTimeout.SelectedItem).Value);

            Int16 interval = Int16.Parse(((PingInterval)PingInterval.SelectedItem).Interval);
            int i = 0;
            for (; ; i++)
            {
                SendWithArray(AddressList, pt);
                if (i % UIUpdateTimeng == 0)
                {
                    Task.Factory.StartNew(() =>
                    {
                        this.Dispatcher.BeginInvoke(new
                            Action(() =>

                            {
                                ScrollToBottom(ResultDisply);
                            }));
                    });
                    DoEvents();
                    i = 0;
                }
                Thread.Sleep(interval);
                if(isCanceled)
                {
                    Debug.WriteLine("Finish!");
                    break;
                }

            }
            SaveButton.IsEnabled= true;
            StartButton.IsEnabled = true;
            StopButton.IsEnabled = false;
            isCanceled = false;
        }

        private void ScrollToBottom(DataGrid dg)
        {
            if (0 < dg.Items.Count)
            {
                //==== ScrollViewerオブジェクト取得 ====//
                var child = VisualTreeHelper.GetChild(dg, 0) as Decorator;
                if (child != null)
                {
                    var scroll = child.Child as ScrollViewer;
                    if (scroll != null)
                    {
                        //==== 移動 ====//
                        scroll.ScrollToBottom();
                    }
                }
            }
        }
        private void DoEvents()
        {
            DispatcherFrame frame = new DispatcherFrame();
            var callback = new DispatcherOperationCallback(ExitFrames);
            Dispatcher.CurrentDispatcher.BeginInvoke(DispatcherPriority.Background, callback, frame);
            Dispatcher.PushFrame(frame);
        }
        private object ExitFrames(object obj)
        {
            // 参考http://posaune.hatenablog.com/entry/2013/05/31/003648           
            ((DispatcherFrame)obj).Continue = false;
            
            
            return null;
        }
        //Button2のClickイベントハンドラ
        private void CancelButtonClick(object sender, RoutedEventArgs e)
        {
            StopButton.IsEnabled = false;
            //Pingをキャンセル
            isCanceled = true;

        }
        public void SendWithArray(String[] urls, Int16 timeout)
        {
            int failed = 0;
            var tasks = new List<Task>();
            // Create a buffer of 32 bytes of data to be transmitted.
            string data = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
            byte[] buffer = Encoding.ASCII.GetBytes(data);

            PingOptions options = new PingOptions(64, true);
            foreach (var url in urls)
            {
                //Debug.WriteLine("arr {0}",url);
                //各pingをタスクにしてListに格納
                // Task.Factory.StartNew   を Task.RunだとTasにRunの定義がないいうとエラーになる
                tasks.Add(Task.Factory.StartNew(() =>
                {
                    Ping ping = new Ping();
                    try
                    {
                        var reply = ping.Send(url, timeout, buffer, options);
                        // status includes Timeout. Timeout will not be Error, in this app.
                        //Debug.WriteLine("Address: {0},RoundTrip time: {1},ping status: {2}", url + " " + reply.Address.ToString(), reply.RoundtripTime, reply.Status);
                        string d = DateTime.Now.ToString("HH:mm:ss.fff");
                        // DateTime.Now.ToString("yyyyMMdd HH:mm:ss.fff");
                        if (reply.Status == IPStatus.TimedOut)
                        {
                            throw new TimeoutException(url );
                        }
                        
                        this.Dispatcher.BeginInvoke(new
                        Action(() =>

                        {//UIスレッドで実行すべき処理
                            DataRow newRowItem;
                            newRowItem = ResultTable.NewRow();
                            if (reply.Status == IPStatus.Success)
                            {
                                newRowItem["Result"] = "OK";
                            }
                            else
                            {
                                newRowItem["Result"] = "NG";
                            }
                            newRowItem["Address"] = reply.Address.ToString();
                            newRowItem["RT(ms)"] = reply.RoundtripTime;
                            newRowItem["Status"] = reply.Status;
                            newRowItem["Time"] = d;
                            ResultTable.Rows.Add(newRowItem);
                            // グリッドにバインド
                            ResultDisply.DataContext = ResultTable;
                            
                            
                        }));

                    }
                    catch (PingException e)
                    {
                        Interlocked.Increment(ref failed);
                        Debug.WriteLine("Error" + e.Message);
                        //url
                        //throw;
                        this.Dispatcher.BeginInvoke(new
                        Action(() =>

                        {//UIスレッドで実行すべき処理
                            DataRow newRowItem;
                            string d = DateTime.Now.ToString("HH:mm:ss.fff");
                            newRowItem = ResultTable.NewRow();
                            newRowItem["Result"] = "NG";
                            newRowItem["Address"] = url;
                            newRowItem["RT(ms)"] = "";
                            newRowItem["Status"] = "ERROR";
                            newRowItem["Time"] = d;
                            ResultTable.Rows.Add(newRowItem);
                            // グリッドにバインド
                            ResultDisply.DataContext = ResultTable;
                            ScrollToBottom(ResultDisply);
                        }));

                        
                    }
                    catch (TimeoutException e)
                    {
                        Interlocked.Increment(ref failed);
                        Debug.WriteLine("Timeout:" + e.Message);
                        this.Dispatcher.BeginInvoke(new
                        Action(() =>

                        {//UIスレッドで実行すべき処理
                            DataRow newRowItem;
                            string d = DateTime.Now.ToString("HH:mm:ss.fff");
                            newRowItem = ResultTable.NewRow();
                            newRowItem["Time"] = d;
                            newRowItem["Result"] = "NG";
                            newRowItem["Address"] = url;
                            newRowItem["RT(ms)"] = "";
                            newRowItem["Status"] = "TimeOut";

                            ResultTable.Rows.Add(newRowItem);
                            // グリッドにバインド
                            ResultDisply.DataContext = ResultTable;

                            ScrollToBottom(ResultDisply);

                        }));


                    }
                }));
            }

            //List内のタスクが終了するのを待つ

            //Task t = Task.WhenAll(tasks.ToArray());
            try
            {
                //List内のタスクが終了するのを待つ
                Task.WaitAll(tasks.ToArray());


            }
            catch { }

        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            SaveButton.IsEnabled = false;
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.FilterIndex = 1;
            saveFileDialog.Filter = "*.csv|*.txt||*.*";
            bool? result = saveFileDialog.ShowDialog();

            int clmcnt = ResultTable.Columns.Count;
            string s = "";
            if (result == true)
            {
                using (Stream fileStream = saveFileDialog.OpenFile())
                using (StreamWriter sr = new StreamWriter(fileStream))
                {
                    sr.WriteLine("Time, URL, RT(ms), Status");
                    foreach ( DataRow row in ResultTable.Rows)
                    {
                        for (int i = 0; i < clmcnt; i++)
                        {
                            if (!(i == clmcnt - 1))
                            {
                                s += row[i] + ", ";
                            }
                            else
                            {
                                s += row[i] ;
                            }
                        }
                        sr.WriteLine(s);
                        s = "";
                    }
                }
            }
            SaveButton.IsEnabled = true;
        }

        private void FastPing_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {// Window閉じるときにLoopも止めまるようにセット
            isCanceled = true;
        }
    }



    public class PingTimeout
    {
        private string _value;
        public string Value
        {
            get { return _value; }
            set { _value = value; }
        }
    }
    public class PingInterval
    {
        private string _Interval;
        public string Interval
        {
            get { return _Interval; }
            set { _Interval = value; }
        }
    }
    public enum OK_NG
    {
        OK,
        NG
    }

    // DataGridに表示するデータ
    public class PingResult
    {
        public string OK_NG { get; set; }
        public string Address { get; set; }
        public string ResponseTime { get; set; }
        public string Statuscode { get; set; }
        public string Time { get; set; }
    }

}
