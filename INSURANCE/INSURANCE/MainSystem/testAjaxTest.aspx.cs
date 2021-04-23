using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using XYYANG.Web.Utility;
using XYYANG.Web.Utility.DB;
using XYYANG.Web.Utility.Excel;

namespace INSURANCE.MainSystem
{
    public partial class testAjaxTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (DBHelper dbHelper = new DBHelper(Common.GetDBConnection("")))
            {
                DataTable dtCompany =  dbHelper.RetrieveData("exec SP_InsuranceCompany_Select ''", null);
                if (dtCompany != null)
                {
                    foreach (DataRow item in dtCompany.Rows)
                    {
                        ListItem litem = new ListItem(item["ID"].ToString(), item["CompanyName"].ToString());
                        ddlInsuranceCompany.Items.Add(litem);
                    }
                }
            }
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        protected void ddlInsuranceCompany_TextChanged(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        protected void ddlInsuranceCompany_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnImportExcel_Click(object sender, EventArgs e)
        {
            ExcelHelper excelHelper = new ExcelHelper(@"D:\workspace\SourceCode\INSURANCE\INSURANCE\INSURANCE\TempFile\ImportTemplate.xlsx");
            //Dictionary<string,System.Type> dicColumns = new Dictionary<string,System.Type>();
            //dicColumns.Add("姓名",  );
            //dicColumns.Add("身份证","int");
            //excelHelper.dicColumns=dicColumns;
            
            DataTable dt = excelHelper.readWholeExcelToDataTable();

            string strConnection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (DBHelper dbHelper = new DBHelper(strConnection))
            {               
                List<SqlParameter> paraList = new List<SqlParameter>();
                SqlParameter item = new SqlParameter("@BoatOwnerName",SqlDbType.NVarChar,10);
                item.Value="退職者";
                paraList.Add(item);

                item = new SqlParameter("@ID",SqlDbType.Int);
                item.Value = 1;
                paraList.Add(item);

                dbHelper.ExecuteNonQuery("update tbl_BoatOwner set BoatOwnerName = @BoatOwnerName where id = @ID", paraList);
            }
        }
    }
}