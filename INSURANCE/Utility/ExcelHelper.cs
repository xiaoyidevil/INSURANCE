using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XYYANG.Web.Utility
{
    public class ExcelHelper
    {
        private string _ConnectionString = "";

        private string _FilePath= "";
        public string FilePath { 
            get{
                return _FilePath;
            }
            set{
                _FilePath = value;
                _ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0; Data Source=""" + _FilePath + @"""; Extended Properties=Excel 8.0;";
            }
        }


        Dictionary<string, string> _dicColumns = new Dictionary<string,string>();
        public Dictionary<string,string> dicColumns{
            get {
                return _dicColumns;
            }
            set {
                if (value != null)
                {
                    foreach (var item in value)
                    {
                        _dicColumns.Add(item.Key.ToString(), item.Value.ToString());
                    }
                }
            }
        }


        public ExcelHelper()
        { 
            
        }

        public ExcelHelper(string strFilePath)
        {
            this.FilePath = strFilePath;
        }

        public DataTable readExcelToDataTable()
        {
            DataTable dtResult = new DataTable();
            try
            {
                if (_dicColumns.Count > 0)
                {
                    foreach (var item in _dicColumns)
                    {
                        dtResult.Columns.Add(item.Key, item.Value.GetType());
                    }
                }
            }
            catch (Exception e)
            {

            }

            OleDbConnection excelConnection = new OleDbConnection(_ConnectionString);
            OleDbCommand excelCommand = new OleDbCommand("SELECT * FROM [Sheet1$]", excelConnection);
            OleDbDataReader excelReader =null ;
            
            try
            {
                excelConnection.Open();
                excelReader = excelCommand.ExecuteReader();

                while (excelReader.Read())
                {
                    DataRow excelDataRow = dtResult.NewRow();

                    foreach (DataColumn item in dtResult.Columns)
                    {
                        excelDataRow[item.ColumnName] = excelReader[item.ColumnName];
                    }

                    dtResult.Rows.Add(excelDataRow);
                }

                if (excelReader != null)
                {
                    excelReader.Close();
                    excelReader.Dispose();
                }
            }
            catch (Exception e)
            {

                //throw;
            }
            finally {
                if (excelReader != null)
                {
                    excelReader.Close();
                    excelReader.Dispose();
                }

                if (excelCommand != null)
                {
                    excelCommand.Dispose();
                }

                if (excelConnection != null) {
                    if (excelConnection.State != ConnectionState.Closed)
                    {
                        excelConnection.Close();
                    }
                    excelConnection.Dispose();
                }
            }

            return dtResult;
        }
    }
}
