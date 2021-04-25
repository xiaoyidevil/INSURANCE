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
        private DataTable dtInsurancePersionList {
            get {
                if (ViewState["dtInsurancePersionList"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("InsurancePolicyName", Type.GetType("System.String"));
                    dt.Columns.Add("InsurancePolicyIdentity", Type.GetType("System.String"));
                    dt.Columns.Add("Age", Type.GetType("System.Int32"));
                    dt.Columns.Add("Occupation", Type.GetType("System.String"));
                    return dt;
                }
                else
                {
                    DataTable dt = (DataTable)ViewState["dtInsurancePersionList"];
                    if (dt.Columns.Count == 0)
                    {
                        dt = new DataTable();
                        dt.Columns.Add("InsurancePolicyName", Type.GetType("System.String"));
                        dt.Columns.Add("InsurancePolicyIdentity", Type.GetType("System.String"));
                        dt.Columns.Add("Age", Type.GetType("System.Int32"));
                        dt.Columns.Add("Occupation", Type.GetType("System.String"));
                    }
                    return dt;
                }
            }
            set {
                ViewState["dtInsurancePersionList"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                lblStartDate.Text = DateTime.Now.ToShortDateString();
                lblEndDate.Text = DateTime.Now.ToShortDateString();
            }
        }

        protected void ddlInsuranceCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlInsuranceCompany.SelectedValue != "0")
            {
                txtInsuranceCompany.Text = ddlInsuranceCompany.SelectedItem.Text;
            }
        }

        protected void txtInsuranceCompany_TextChanged(object sender, EventArgs e)
        {
            getCompanyData();
        }
        
        protected void txtBoatOwner_TextChanged(object sender, EventArgs e)
        {
            getBoatOwnerData();
        }

        protected void txtBoatNum_TextChanged(object sender, EventArgs e)
        {
            getBoatNumData();
        }

        protected void ddlBoatNum_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBoatNum.SelectedValue != "0") {
                txtBoatNum.Text = ddlBoatNum.SelectedItem.Text;
            }
        }

        protected void ddlBoatOwner_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBoatOwner.SelectedValue != "0")
            {
                txtBoatOwner.Text = ddlBoatOwner.SelectedItem.Text;
                getBoatNumData();
            }
        }

        private void getCompanyData()
        {
            ddlInsuranceCompany.Items.Clear();
            ListItem lstItem = new ListItem("请选择", "0");
            ddlInsuranceCompany.Items.Add(lstItem);
            using (DBHelper dbHelper = new DBHelper(Common.GetDBConnection("")))
            {
                SqlParameter sqlCompanyName = new SqlParameter();
                sqlCompanyName.ParameterName = "@varCompanyName";
                sqlCompanyName.SqlDbType = SqlDbType.NVarChar;
                sqlCompanyName.Size = 40;
                sqlCompanyName.Value = txtInsuranceCompany.Text;

                List<SqlParameter> sqlPara = new List<SqlParameter>();
                sqlPara.Add(sqlCompanyName);

                DataTable dtCompany = dbHelper.RetrieveData("dbo.SP_InsuranceCompany_Select", sqlPara, true);
                if (dtCompany != null)
                {
                    foreach (DataRow item in dtCompany.Rows)
                    {
                        ListItem litem = new ListItem(item["CompanyName"].ToString(), item["ID"].ToString());
                        ddlInsuranceCompany.Items.Add(litem);
                    }
                }
            }
        }

        private void getBoatOwnerData()
        {
            ddlBoatOwner.Items.Clear();
            ListItem lstItem = new ListItem("请选择", "0");
            ddlBoatOwner.Items.Add(lstItem);
            using (DBHelper dbHelper = new DBHelper(Common.GetDBConnection("")))
            {
                SqlParameter sqlCompanyName = new SqlParameter();
                sqlCompanyName.ParameterName = "@varBoatOwner";
                sqlCompanyName.SqlDbType = SqlDbType.NVarChar;
                sqlCompanyName.Size = 40;
                sqlCompanyName.Value = txtBoatOwner.Text;

                List<SqlParameter> sqlPara = new List<SqlParameter>();
                sqlPara.Add(sqlCompanyName);

                DataTable dtCompany = dbHelper.RetrieveData("dbo.SP_tbl_BoatOwner_Select", sqlPara, true);
                if (dtCompany != null)
                {
                    foreach (DataRow item in dtCompany.Rows)
                    {
                        ListItem litem = new ListItem(item["BoatOwnerName"].ToString(), item["ID"].ToString());
                        ddlBoatOwner.Items.Add(litem);
                    }
                }
            }
        }


        private void getBoatNumData()
        {
            ddlBoatNum.Items.Clear();
            ListItem lstItem = new ListItem("请选择", "0");
            ddlBoatNum.Items.Add(lstItem);
            using (DBHelper dbHelper = new DBHelper(Common.GetDBConnection("")))
            {
                SqlParameter sqlBoatOwnerName = new SqlParameter();
                sqlBoatOwnerName.ParameterName = "@varBoatOwnerName";
                sqlBoatOwnerName.SqlDbType = SqlDbType.NVarChar;
                sqlBoatOwnerName.Size = 100;
                sqlBoatOwnerName.Value = txtBoatOwner.Text;

                SqlParameter sqlBoatNum = new SqlParameter();
                sqlBoatNum.ParameterName = "@varBoatNum";
                sqlBoatNum.SqlDbType = SqlDbType.NVarChar;
                sqlBoatNum.Size = 80;
                sqlBoatNum.Value = txtBoatNum.Text;

                List<SqlParameter> sqlPara = new List<SqlParameter>();
                sqlPara.Add(sqlBoatOwnerName);
                sqlPara.Add(sqlBoatNum);

                DataTable dtBoatNum = dbHelper.RetrieveData("dbo.SP_tbl_BoatOwner_BoatNum_Select", sqlPara, true);
                if (dtBoatNum != null)
                {
                    foreach (DataRow item in dtBoatNum.Rows)
                    {
                        ListItem litem = new ListItem(item["BoatNum"].ToString());
                        ddlBoatNum.Items.Add(litem);
                    }
                }
            }
        }

        protected void calStartDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime dateStart = DateTime.Now;
            DateTime.TryParse(calStartDate.SelectedDate.ToShortDateString(), out dateStart);
            DateTime dateEnd = DateTime.Now;
            DateTime.TryParse(lblEndDate.Text, out dateEnd);
            if (DateTime.Compare(dateStart, dateEnd) > 0)
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "DateAlertScript", "javascript:window:alert('结束日期要大于开始日期！')", true);
                return;
            }
            lblStartDate.Text = calStartDate.SelectedDate.Date.ToShortDateString();
        }

        protected void calEndDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime dateStart = DateTime.Now;
            DateTime.TryParse(lblStartDate.Text, out dateStart);
            DateTime dateEnd = DateTime.Now;
            DateTime.TryParse(calEndDate.SelectedDate.Date.ToShortDateString(), out dateEnd);
            if (DateTime.Compare(dateStart, dateEnd) > 0)
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "DateAlertScript", "javascript:window:alert('结束日期要大于开始日期！')", true);
                return;
            }
            lblEndDate.Text = calEndDate.SelectedDate.Date.ToShortDateString();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            dtInsurancePersionList = new DataTable();
            if (FUupload.HasFile == true)
            {
                foreach (HttpPostedFile item in FUupload.PostedFiles)
                {
                    string strFilePath = Server.MapPath(@"..\UploadFiles\") + item.FileName + Guid.NewGuid().ToString();
                    item.SaveAs(strFilePath);
                    ReadUploadFile(strFilePath);
                }
            }
        }


        private void ReadUploadFile(string strFilePath)
        {
            ExcelHelper excelHelper = new ExcelHelper(strFilePath);

            DataTable dt = new DataTable();
            dt = excelHelper.readWholeExcelToDataTable();

            dtInsurancePersionList = ConvertUploadFileToDataTable(dt);

            //gvPersonList.DataSource = dsInsurancePersionList.Tables["Sheet1$"];
            gvPersonList.DataSource = dtInsurancePersionList;
            gvPersonList.DataBind();
        }

        private DataTable ConvertUploadFileToDataTable(DataTable dt) {

            DataTable dtResult = new DataTable();
            dtResult.Columns.Add("InsurancePolicyName", Type.GetType("System.String"));
            dtResult.Columns.Add("InsurancePolicyIdentity", Type.GetType("System.String"));
            dtResult.Columns.Add("Age", Type.GetType("System.Int32"));
            dtResult.Columns.Add("Occupation", Type.GetType("System.String"));

            foreach (DataRow item in dt.Rows)
            {
                DataRow dr = dtResult.NewRow();
                dr["InsurancePolicyName"] = item["姓名"];
                dr["InsurancePolicyIdentity"] = item["身份证"];
                dr["Occupation"] = "渔业";
                int intBirtyYear = 0;
                int.TryParse(item["身份证"].ToString().Substring(6, 4),out intBirtyYear);
                dr["Age"] = DateTime.Now.Year - intBirtyYear;
                dtResult.Rows.Add(dr);
                
            }

            return dtResult;
        }
    }
}