using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class Company : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Company session check — redirect to login if not authenticated as company
            if (Session["company"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            // Highlight active sidebar item based on URL
            string pageName = System.IO.Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath).ToLower();

            string dataPage = "overview";
            if (pageName.Contains("profile")) dataPage = "profile";
            else if (pageName.Contains("directory")) dataPage = "directory";

            bodyTag.Attributes["data-company-page"] = dataPage;
        }
    }
}