using System;
using System.Data;
using System.IO;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Xml;
using Microsoft.Win32;
using WinForms = System.Windows.Forms;

namespace Thousands_from_one
{
    /// <summary>
    ///     Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public XmlDocument XmlDocument;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void button_load_xml_Click(object sender, RoutedEventArgs e)
        {
            var myDialog = new OpenFileDialog();
            myDialog.Filter = "XML-файл(*.xml)|*.xml";
            myDialog.CheckFileExists = true;
            if (myDialog.ShowDialog() == true)
            {
                FillGride(myDialog.FileName);
                button_start.IsEnabled = true;
            }
        }
        /// <summary>
        /// Чтение файла и заполнение DataGrid
        /// </summary>
        /// <param name="fileName">путь к файлу</param>
        public void FillGride(string fileName)
        {
            try
            {
                var stream = new FileStream(fileName, FileMode.Open);
                XmlTextReader xmlTextReader = new XmlTextReader(stream);
                var dt = new DataTable();
                dt.Columns.Add("Element");
                dt.Columns.Add("Value");

                while (xmlTextReader.Read())
                {
                    var row = dt.NewRow();
                    if (xmlTextReader.Value == "")
                    {
                        row[0] = xmlTextReader.Name;
                    }
                    else
                    {
                        row[1] = xmlTextReader.Value;
                    }
                    dt.Rows.Add(row);
                }
                xmlTextReader.Close();
                dataGrid.ItemsSource = dt.DefaultView;
                XmlDocument = new XmlDocument();
                XmlDocument.Load(fileName);
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }

        private void dataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dataGrid.SelectedItem != null)
            {
                var selectedColumn = dataGrid.CurrentCell.Column.DisplayIndex;
                var selectedCell = dataGrid.SelectedCells[selectedColumn];
                var cellContent = selectedCell.Column.GetCellContent(selectedCell.Item);
                if (cellContent is TextBox)
                {
                    if (selectedColumn == 0)
                    {
                        textBox_element_name.Text = (cellContent as TextBox).Text;
                    }
                    else
                    {
                        textBox_element_value.Text = (cellContent as TextBox).Text;
                    }
                }
            }
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            var folderBrowserDialog = new WinForms.FolderBrowserDialog();
            folderBrowserDialog.ShowDialog();
            if (folderBrowserDialog.SelectedPath != null)
            {
                textBox_save_directory.Text = folderBrowserDialog.SelectedPath;
            }
        }

        private void button_start_Click(object sender, RoutedEventArgs e)
        {
            if (!VerifyFields(XmlDocument))
                return;
            var iterator = textBox_iterator.Text;
            CreateFiles(iterator);
        }
        /// <summary>
        /// Создание файлов
        /// </summary>
        /// <param name="iterator"></param>
        private void CreateFiles(string iterator)
        {
            var saveDirectory = textBox_save_directory.Text;
            var i = int.Parse(textBox_copies.Text);
            var element = textBox_element_name.Text;
            var value = textBox_element_value.Text;
            XmlNodeList tag = null;
            try
            {
                for (var j = 0; j < i; j++)
                {
                    if ((bool)checkBox_just_files.IsChecked)  //Если делаем просто дубли
                    {
                        try
                        {
                            var fileName = saveDirectory + "\\" + j + ".xml";
                            XmlDocument.Save(fileName);
                            continue;
                        }
                        catch (Exception e)
                        {
                            MessageBox.Show(e.Message);
                            return;
                        }
                    }
                    if (tag == null)
                    {
                        tag = XmlDocument.GetElementsByTagName(element);
                        if (tag[0].ChildNodes.Item(0).Value == null)
                        {
                            string message = "Тег " + element +
                                          " не имеет значения для итерации. Выполнение операции невозможно.";
                            MessageBox.Show(message, "Ошибка");
                            return;
                        }
                    }
                    ParseAndIterate(iterator, ref value);
                    if (value == "")
                        break;
                    tag[0].ChildNodes.Item(0).Value = value;
                    try
                    {
                        var fileName = saveDirectory + "\\" + j + ".xml";
                        XmlDocument.Save(fileName);
                    }
                    catch (Exception e)
                    {
                        MessageBox.Show(e.Message);
                        return;
                    }
                }
                MessageBox.Show("Готово!", "Операция завершена");
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }

        }
        /// <summary>
        /// Определение типа данных итератора и итерация
        /// </summary>
        /// <param name="value">итерируемое значение</param>
        /// <param name="iterator">итератор</param>
        /// <returns></returns>
        private void ParseAndIterate(string iterator, ref string value)
        {
            try
            {
                if (value.Contains("."))
                {
                    var val = double.Parse(value.Replace(".", ",")) + double.Parse(iterator);
                    value = val.ToString().Replace(",", ".");
                    return;
                }
                if (value.Contains("-"))
                {
                    var val = DateTime.Parse(value).AddDays(double.Parse(iterator));
                    var month = val.Month.ToString().Length < 2 ? "0" + val.Month : val.Month.ToString();
                    var day = val.Day.ToString().Length < 2 ? "0" + val.Day : val.Day.ToString();

                    value = val.Year + "-" + month + "-" + day;
                    return;
                }
                var r = new Regex(@"[^\d]");
                if (!r.IsMatch(value))
                {
                    value = (long.Parse(value) + long.Parse(iterator)).ToString();
                    return;
                }
                value = value + iterator;
            }
            catch (Exception e)
            {
                value = "";
                MessageBox.Show(e.Message, "Ошибка парсинга");
            }
        }

        /// <summary>
        ///     Проверка корректности заполнения полей
        /// </summary>
        /// <returns></returns>
        private bool VerifyFields(XmlDocument XmlDocument)
        {
            if (!(bool)checkBox_just_files.IsChecked)
            {
                if (textBox_element_name.Text == "")
                {
                    MessageBox.Show("Не указано наименование тега", "Ошибка");
                    return false;
                }
                var elemList = XmlDocument.GetElementsByTagName(textBox_element_name.Text);
                if (elemList.Count == 0)
                {
                    MessageBox.Show("Такого тега нет в xml файле", "Ошибка");
                    return false;
                }
                if (textBox_element_value.Text == "")
                {
                    MessageBox.Show("Не указано начальное значение тега", "Ошибка");
                    return false;
                }

                if (textBox_iterator.Text == "")
                {
                    MessageBox.Show("не задан итератор", "Ошибка");
                    return false;
                }
            }
            if (textBox_copies.Text == "")
            {
                MessageBox.Show("не задано количество документов", "Ошибка");
                return false;
            }
            if (textBox_save_directory.Text == "")
            {
                MessageBox.Show("не задан каталог сохранения файлов", "Ошибка");
                return false;
            }

            return true;
        }

        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            var regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void NumberValidationelement_value(object sender, TextCompositionEventArgs e)
        {
            var regex = new Regex("[\\r\\n<>]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void dataGrid_AutoGeneratedColumns(object sender, EventArgs e)
        {
            dataGrid.Columns[1].Width = new DataGridLength(1, DataGridLengthUnitType.Star);
        }
    }
}