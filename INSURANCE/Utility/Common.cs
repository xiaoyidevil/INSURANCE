using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace XYYANG.Web.Utility
{
    public static class Common
    {
        public static string GetDBConnection(string ConnectionSetting)
        {
            string strResult = "";

            if (ConnectionSetting == "")
            {
                strResult = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            }
            else {
                strResult = System.Configuration.ConfigurationManager.ConnectionStrings[ConnectionSetting].ConnectionString;
            }

            return strResult;
        }
    }
}
