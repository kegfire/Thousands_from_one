   M S B A M L   `   `   `  ���� M  IThousands from one, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:Thousands_from_oneThousands_from_one  #    Thousands_from_one.MainWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     2local clr-namespace:Thousands_from_one       � Title$  Thousands from one��$	��437��$	��639�� � Icon$ The Antelope.ico��$	��420��$	��520��.���  � ColumnDefinitions �� .+�&   System.Windows.Controls.DataGrid  -     Name$ dataGrid��$��10,10,265,10q�   SelectionMode$ Single=�   CanUserSortColumns .     MinColumnWidth$ 30Q��� -    ��Name$ textBox_element_value��$��Right=�$��25��$��
0,134,60,0q� �� TextWrapping$
 Wrap=�$	��Top=�$	��200���� -   $ textBox_element_name��$��Right=�$��23��$��	0,80,60,0q�$
 Wrap=�$	��Top=�$	��200���� -   	 ��Name$	 label_element_name��$'��!Наименование тега��$��Right=�$��
0,54,143,0q�$	��Top=�
 J� RenderTransformOrigin$
 
0.52,0.524&�$	��117���� -   $	 label_element_value��$��Значение тега��$��Right=�$��0,108,143,0q�$	��Top=�$
 
0.52,0.524&�$	��117���� -    ��Name$ button_load_xml��$��Выбрать��$��Right=�$��	0,30,31,0q�$	��Top=�$��75�� �� 	IsDefault . �� -   $	 label_load_xml��$��Выберите файл��$��Right=�$��
0,24,143,0q�$	��Top=�$
 
0.52,0.524&�$	��117���� -   $	 label_iterator��$!��Увеличивать на��$��Right=�$��0,164,143,0q�$	��Top=�$
 
0.52,0.524&�$	��117���� -	   $ textBox_iterator��$��Right=�$��25��$��
0,190,60,0q�$
 Wrap=�$	��Top=�$	��200�� �� 	UndoLimit$ 10��$��1�� �� MaxLines$ 1�� �� 	MaxLength$ 7���� -
   $	 label_save_xml��$��Сохранить в��$��Right=�$��0,276,143,0q�$	��Top=�$
 
0.52,0.524&�$	��117���� -   $ textBox_save_directory��$��Right=�$��25��$��
0,302,60,0q�$
 Wrap=�$	��Top=�$	��200��$ 10���� -   $ button��$	��...��$��Right=�$��
0,302,31,0q�$	��Top=�$��24��$��25���� -   $	 label_copies��$/��)Количество документов��$��Right=�$��0,220,116,0q�$	��Top=�$
 
0.52,0.524&�$	��144���� -   $ textBox_copies��$��Right=�$��25��$��
0,246,60,0q�$
 Wrap=�$	��Top=�$	��200��$	��100��$ 6��$ 1���� -   $ button_start��$��Начать��$��Right=�$��
0,345,31,0q�$	��Top=�$��75��{�.  �� -    ��Name$ checkBox_just_files��$,��&Сделать просто дубли��$��Right=�$��0,348,119,0q�$	��Top=�