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
    public partial class InsuranceInput : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (DBHelper dbHelper = new DBHelper(Common.GetDBConnection("")))
            {
                SqlParameter sqlCompanyName = new SqlParameter();
                sqlCompanyName.ParameterName = "@varCompanyName";
                sqlCompanyName.SqlDbType = SqlDbType.NVarChar;
                sqlCompanyName.Size = 40;
                sqlCompanyName.Value = "";

                List<SqlParameter> sqlPara = new List<SqlParameter>();
                sqlPara.Add(sqlCompanyName);

                DataTable dtCompany = dbHelper.RetrieveData("dbo.SP_InsuranceCompany_Select", sqlPara);
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

        private void getBoatOwner()
        {
                
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        protected void ddlInsuranceCompany_TextChanged(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        protected void ddlInsuranceCompany_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}