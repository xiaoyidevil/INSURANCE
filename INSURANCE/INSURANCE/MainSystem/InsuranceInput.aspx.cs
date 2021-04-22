using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace INSURANCE.MainSystem
{
    public partial class InsuranceInput : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListItem litem = new ListItem("01","01");

            ddlInsuranceCompany.Items.Add(litem);
            litem = new ListItem("02", "02");
            ddlInsuranceCompany.Items.Add(litem);
        }

        private void getBoatOwner()
        {
            exec SP_BoatOwner_Select
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