using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace XYYANG.Web.Utility.DB
{
    public class DBHelpercs:IDisposable
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

        public DBHelpercs()
        { 
        
        }

        public DBHelpercs(string sqlConnection)
        {
            this.ConnectionString = sqlConnection;
        }

        ~DBHelpercs()
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
                }
                // clean up unmanaged resources
            }
            IsDisposed = true;
        }

        public bool ExecuteNonQuery(string sql, SqlParameter[] sqlPara)
        {
            bool blnResult = false;

            if(_sqlConnection

            return blnResult;
        }
    
    }
}
