   M S B A M L   `   `   `  ����M  IThousands from one, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:Thousands_from_oneThousands_from_one  5   	   #    Thousands_from_one.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:Thousands_from_one     5   	     � Title$  Thousands from one��5   	   $	��437��6$   $	��639��61    � Icon$ The Antelope.ico��6=   $	��420��6U   $	��520��6e   .��5	      �  � ColumnDefinitions 5
   
   �� 5      .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ dataGrid��5      $��10,10,265,10q�6%      SelectionMode$ Single=�6h      CanUserSortColumns .     MinColumnWidth$ 30Q�6�   6�   �� 5   
   -   5         ��Name$ textBox_element_value��5      $��Right=�61   $��25��6M   $��
0,134,60,0q�6Y    �� TextWrapping$
 Wrap=�6m   $	��Top=�6�   $	��200��6�   6�   �� 5   
   -   5        $ textBox_element_name��5      $��Right=�60   $��23��6L   $��	0,80,60,0q�6X   $
 Wrap=�6k   $	��Top=�6   $	��200��6�   �� 5   
   -   5        	 ��Name$	 label_element_name��5      $'��!Наименование тега��6,   $��Right=�6H   $��
0,54,143,0q�6d   $	��Top=�6x   
 J� RenderTransformOrigin$
 
0.52,0.524&�6�   $	��117��6�   �� 5   
   -   5        $	 label_element_value��5      $��Значение тега��6-   $��Right=�6E   $��0,108,143,0q�6a   $	��Top=�6v   $
 
0.52,0.524&�6�   $	��117��6�   �� 5   
   -   5         ��Name$ button_load_xml��5      $��Выбрать��6*   $��Right=�6<   $��	0,30,31,0q�6X   $	��Top=�6k   $��75��6�    �� 	IsDefault . 6�   �� 5   
   -   5        $	 label_load_xml��5      $��Выберите файл��6(   $��Right=�6@   $��
0,24,143,0q�6\   $	��Top=�6p   $
 
0.52,0.524&�6�   $	��117��6�   �� 5   
   -   5        $	 label_iterator��5      $!��Увеличивать на��6(   $��Right=�6A   $��0,164,143,0q�6]   $	��Top=�6r   $
 
0.52,0.524&�6�   $	��117��6�   �� 5   
   -	   5        $ textBox_iterator��5      $��Right=�6,   $��25��6H   $��
0,190,60,0q�6T   $
 Wrap=�6h   $	��Top=�6|   $	��200��6�    �� 	UndoLimit$ 10��6�   $��1��6�    �� MaxLines$ 1��6�    �� 	MaxLength$ 7��6�   6�   �� 5   
   -
   5        $	 label_save_xml��5      $��Сохранить в��6(   $��Right=�6>   $��0,276,143,0q�6Z   $	��Top=�6o   $
 
0.52,0.524&�6�   $	��117��6�   �� 5   
   -   5        $ textBox_save_directory��5      $��Right=�62   $��25��6N   $��
0,302,60,0q�6Z   $
 Wrap=�6n   $	��Top=�6�   $	��200��6�   $ 10��6�   �� 5   
   -   5        $ button��5      $	��...��6!   $��Right=�6/   $��
0,302,31,0q�6K   $	��Top=�6_   $��24��6w   $��25��6�   6�   �� 5   
   -   5        $	 label_copies��5      $/��)Количество документов��6&   $��Right=�6F   $��0,220,116,0q�6b   $	��Top=�6w   $
 
0.52,0.524&�6�   $	��144��6�   �� 5   
   -   5        $ textBox_copies��5      $��Right=�6*   $��25��6F   $��
0,246,60,0q�6R   $
 Wrap=�6f   $	��Top=�6z   $	��200��6�   $	��100��6�   $ 6��6�   $ 1��6�   6�   �� 5   
   -   5        $ button_start��5      $��Начать��6'   $��Right=�68   $��
0,345,31,0q�6T   $	��Top=�6h   $��75��6�   {�.  6�   �� 5   
   -   5         ��Name$ checkBox_just_files��5      $,��&Сделать просто дубли��60   $��Right=�6O   $��0,348,119,0q�6k   $	��Top=�6�   5      5      