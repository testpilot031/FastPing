   M S B A M L   `   `   `  ����C  ?FastPing, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:FastPingFastPing  5   	   H DShowMeTheXAML, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullD2clr-namespace:ShowMeTheXAML;assembly=ShowMeTheXAMLShowMeTheXAML 5   	   V RMaterialDesignThemes.Wpf, Version=2.3.2.1033, Culture=neutral, PublicKeyToken=nulleHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.WpfMaterialDesignThemes.Wpf 5   	       FastPing.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   (localclr-namespace:FastPing     5   	   FmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   =smtx2clr-namespace:ShowMeTheXAML;assembly=ShowMeTheXAML  5   	   RwpfHclr-namespace:MaterialDesignThemes.Wpf;assembly=MaterialDesignThemes.Wpf  5   	   -   5          �Name$  FastPing��5   	    � Title$ FastPing��5	   	   $��380.4��6   $��859.2��6)   $��Center=�5
   	   $��Center=�5   	   $
��Left=�6$    � WindowStyle$ ThreeDBorderWindow=�5   	      MaterialDesignBody#���   5   	     MaterialDesignPaper#���  5   	   $X��Rpack://application:,,,/MaterialDesignThemes.Wpf;component/Resources/Roboto/#Roboto)�5   	   $��13(�5   	    � 
ResizeMode$ NoResize=�5   	    � 	Resources 5      �� 5   
     KeyPingTimeout  �� Type   FastPing.PingTimeout"  6&   .s�5           Value$ 10��6      5      $ 20��6      5      $ 30��6      5      $ 40��6      5      $ 50��6    5      �� 5   
   PingInterval    FastPing.PingInterval"  6'   .s�5           Interval$ 1��6!     5       $ 10��6!     5!      $ 20��6!     5"      $ 30��6!     5#      $ 40��6!     5$      $ 50��6!   5%      .��5'      � $
��Left=�6   $	��834��6&   $��	0,0,0,0.8q�62    � ColumnDefinitions 5(   
   �� 5)      $��* �6   	 � RowDefinitions	 5+   
   �� 5,      $
��Auto �6   .+�57   
   �� -   5        
 ��Name$
 StartButton��57      {�.  � ToolTip$ Start��58   #   $
��Left=�59      $��26��6,   $��	21,50,0,0q�5:      $	��Top=�6$   $��50��5;      .��5<      '  !MaterialDesignThemes.Wpf.PackIcon  �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.3.2.1033, Culture=neutral, PublicKeyToken=null]]   Kind$
 Play=�6&   5=      �� 5>   
   -   5        $
 
StopButton��5>      {�.  $
 Stop��5?   #   $
��Left=�5@      $��27��6,   $��	91,49,0,0q�5A      $	��Top=�6$   $��50��5B      .��5C        $
 Stop=�6&   5D      �� 5E   
   -   5        $
 
SaveButton��5E      $
 Save��5F      $
��Left=�5G      $��27��5H      $��
163,50,0,0q�6   $	��Top=�5I      $��50��6)   {�.  .��5K        $ ContentSave=�6&   5L      �� 5N   
   -   5         ��Name$ Urllbl��5N      $	��URL��6    $
��Left=�6.   $��25��6I   $��	24,84,0,0q�6U   $	��Top=�6h   $��88��6�   �� 5P   
   -   5         ��Name$ InputAddress��5P      $
��Left=�5R      $	��128��6/   $��
24,111,0,0q�6<    �� TextWrapping$
 Wrap=�5S      $C��=//comment
192.168.20.1
2001:a450:3c05:a800:2a0:deff:fe53:2470��5T      $	��Top=�5U      $	��205��6,   $	 url��5V       �� 
IsReadOnly .   �� AcceptsReturn . $��11(�5X   )   $
��Left=�67   $	��Top=�6Y   �� 5Z   
   -   5         ��Name$ PingTimeout��5Z       �� DisplayMemberPath$ Value��5\       �� SelectedItem$ Value��5]      $��163,260,610.6,42.8q�5^      $��60��5_      $��Center=�5`      $��Center=�5a      $��Center=�5b      $��Center=�5c      ��5[      ��   PingTimeout �� Source# [ 5c      �� 5d   
   -   5        $ PingInterval��5d      $ Interval��5f      $ Interval��5g      $��163,290,610.6,12.8q�5h      $��60��5i      $��Center=�5j      $��Center=�61   $��Center=�6S   $��Center=�6n   ��5e      ��   PingInterval# [ 5j   n   &   System.Windows.Controls.DataGrid  5l   
   -	   5          Name$ ResultDisply��5l      $	��299��6*   $��257,20,21.6,0q�5m      $	��Top=�6+      CanUserResizeRows .  "   VerticalScrollBarVisibility$
 Auto=�5p      $   HorizontalScrollBarVisibility$ Hidden=�5q      }�. $��11(�5r   (   ��5n      �� 5r   (   �� 5t   
   -
   5        $ 
Timeoutlbl��5t      $��Timeout(ms)��6%   $
��Left=�6;   $��24��6V   $��
23,258,0,0q�6b   $	��Top=�6v   $��89��6�    J� RenderTransformOrigin$ 0.512,0.508&�6�   �� 5u   
   -   5        $ Intervallbl��5u      $��Interval(ms)��6%   $
��Left=�6<   $��29��6W   $��
24,287,0,0q�6c   $	��Top=�6w   $��88��6�   5w      5x      