   M S B A M L   `   `   `  ���� C  ?FastPing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:FastPingFastPing  H DShowMeTheXAML, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullD2clr-namespace:ShowMeTheXAML;assembly=ShowMeTheXAMLShowMeTheXAML V RMaterialDesignThemes.Wpf, Version=2.3.2.1033, Culture=neutral, PublicKeyToken=nulleHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.WpfMaterialDesignThemes.Wpf     FastPing.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     (localclr-namespace:FastPing     FmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  =smtx2clr-namespace:ShowMeTheXAML;assembly=ShowMeTheXAML  RwpfHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.Wpf  -     �Name$  FastPing�� � Title$ FastPing��$��380.4��$��859.2��$��Center=�$��Center=�$
��Left=� � WindowStyle$ ThreeDBorderWindow=�   MaterialDesignBody#���     MaterialDesignPaper#���  $X��Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�$��13(� � 
ResizeMode$ NoResize=� � 	Resources ��   KeyPingTimeout  �� Type   FastPing.PingTimeout"  .s�     Value$ 10��  $ 20��  $ 30��  $ 40��  $ 50���� PingInterval    FastPing.PingInterval"  .s�     Interval$ 1��  $ 10��  $ 20��  $ 30��  $ 40��  $ 50��.��� $
��Left=�$	��834��$��	0,0,0,0.8q� � ColumnDefinitions �� $��* �	 � RowDefinitions	 �� $
��Auto �.+��� -   
 ��Name$
 StartButton��{�.  � ToolTip$ Start��$
��Left=�$��26��$��	21,50,0,0q�$	��Top=�$��50��.��'  !MaterialDesignThemes.Wpf.PackIcon  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.3.2.1033, Culture=neutral, PublicKeyToken=null]]   Kind$
 Play=��� -   $
 
StopButton��{�.  $
 Stop��$
��Left=�$��27��$��	91,49,0,0q�$	��Top=�$��50��.��  $
 Stop=��� -   $
 
SaveButton��$
 Save��$
��Left=�$��27��$��
163,50,0,0q�$	��Top=�$��50��{�.  .��  $ ContentSave=��� -    ��Name$ Urllbl��$	��URL��$
��Left=�$��25��$��	24,84,0,0q�$	��Top=�$��88���� -    ��Name$ InputAddress��$
��Left=�$	��128��$��
24,111,0,0q� �� TextWrapping$
 Wrap=�$C��=//comment
192.168.20.1
2001:a450:3c05:a800:2a0:deff:fe53:2470��$	��Top=�$	��205��$	 url�� �� 
IsReadOnly .   �� AcceptsReturn . $��11(�$
��Left=�$	��Top=��� -    ��Name$ PingTimeout�� �� DisplayMemberPath$ Value�� �� SelectedItem$ Value��$��163,260,610.6,42.8q�$��60��$��Center=�$��Center=�$��Center=�$��Center=�����   PingTimeout �� Source# [ �� -   $ PingInterval��$ Interval��$ Interval��$��163,290,610.6,12.8q�$��60��$��Center=�$��Center=�$��Center=�$��Center=�����   PingInterval# [ &   System.Windows.Controls.DataGrid  -	     Name$ ResultDisply��$	��299��$��257,20,21.6,0q�$	��Top=�   CanUserResizeRows .  "   VerticalScrollBarVisibility$
 Auto=�$   HorizontalScrollBarVisibility$ Hidden=�}�. $��11(����� �� -
   $ 
Timeoutlbl��$��Timeout(ms)��$
��Left=�$��24��$��
23,258,0,0q�$	��Top=�$��89�� J� RenderTransformOrigin$ 0.512,0.508&��� -   $ Intervallbl��$��Interval(ms)��$
��Left=�$��29��$��
24,287,0,0q�$	��Top=�$��88��