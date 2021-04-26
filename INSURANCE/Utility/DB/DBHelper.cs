using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XYYANG.Web.Utility.DB
{
    public class DBHelper:IDisposable
    {
        private bool IsDisposed = false;

        private SqlConnection _sqlConnection = null;
        public SqlConnection sqlConnection
        {
            get { return _sqlConnection; }
            set { _sqlConnection = value; }
        }
 

        private SqlCommand _sqlCommand = null;
        public SqlCommand sqlCommand
        {
            get { return _sqlCommand; }
            set { _sqlCommand = value; }
        }
        

        private SqlTransaction _sqlTransaction = null;
        public SqlTransaction sqlTransaction
        {
            get { return _sqlTransaction; }
            set { _sqlTransaction = value; }
        }
        
        public string ConnectionString {
            get {
                if (_sqlConnection != null)
                {
                    return _sqlConnection.ConnectionString;
                }
                else
                {
                    return "";
                }
            }

            set {
                if (_sqlConnection != null)
                {
                    if (_sqlConnection.State == System.Data.ConnectionState.Open)
                    {
                        _sqlConnection.Close();
                    }
                    _sqlConnection.Dispose();
                }
                _sqlConnection = new SqlConnection(value);

            }
        }

        public DBHelper()
        { 
        
        }

        public DBHelper(string sqlConnection)
        {
            this.ConnectionString = sqlConnection;
        }

        ~DBHelper()
        {
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected void Dispose(bool Disposing)
        {
            if (!IsDisposed)
            {
                if (Disposing)
                {
                    //clean up managed resources
                    if (_sqlCommand != null)
                    {
                        _sqlCommand.Dispose();
                    }

                    if (_sqlConnection != null)
                    {
                        if (_sqlConnection.State == System.Data.ConnectionState.Open)
                        {
                            _sqlConnection.Close();
                        }
                        _sqlConnection.Dispose();
                    }
                }
                // clean up unmanaged resources
            }
            IsDisposed = true;
        }

        public bool ExecuteNonQuery(string sql, List<SqlParameter> sqlPara)
        {
            bool blnResult = false;

            if (_sqlCommand == null)
            {
                _sqlCommand = new SqlCommand();
            }
            _sqlCommand.Parameters.Clear();

            _sqlCommand.CommandText = sql;

            if (sqlPara != null) {
                foreach (SqlParameter item in sqlPara)
                {
                    _sqlCommand.Parameters.Add(item);
                }
            }
            
            try
            {
                if (_sqlConnection != null)
                {
                    if (_sqlConnection.State != System.Data.ConnectionState.Open)
                    {
                        _sqlConnection.Open();
                    }

                    _sqlCommand.Connection = _sqlConnection;

                    _sqlTransaction = _sqlConnection.BeginTransaction();
                    _sqlCommand.Transaction = _sqlTransaction;

                    _sqlCommand.ExecuteNonQuery();

                    _sqlTransaction.Commit();
                }
            }
            catch (Exception)
            {
                _sqlConnection.Close();
                _sqlConnection.Dispose();
                _sqlCommand.Dispose();
                _sqlTransaction.Dispose();
                return blnResult;
            }
            finally
            {
                _sqlConnection.Close();
                _sqlConnection.Dispose();
                _sqlCommand.Dispose();
                _sqlTransaction.Dispose();
            }

            return blnResult;
        }

        public DataTable RetrieveData(string sql, List<SqlParameter> sqlPara, bool blnSP = false)
        {
            DataTable dtResult = new DataTable();
            
            
            try
            {
                if (_sqlConnection != null)
                {
                    if (_sqlConnection.State != System.Data.ConnectionState.Open)
                    {
                        _sqlConnection.Open();
                    }

                    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sql,_sqlConnection);

                    if (sqlPara != null)
                    {
                        foreach (SqlParameter item in sqlPara)
                        {
                            sqlAdapter.SelectCommand.Parameters.Add(item);
                        }
                    }
                    if (blnSP) {
                        sqlAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    }
                    sqlAdapter.Fill(dtResult);

                    sqlAdapter.Dispose();
                }
            }
            catch (Exception e)
            {
                _sqlConnection.Close();
                _sqlConnection.Dispose();
                return dtResult;
            }
            finally{
                _sqlConnection.Close();
                _sqlConnection.Dispose();
            }
           
            return dtResult;
        }


    }
}
