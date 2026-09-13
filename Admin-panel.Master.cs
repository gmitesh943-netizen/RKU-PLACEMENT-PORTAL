using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class Admin_panel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Admin session check — redirect to login if not authenticated as admin
            if (Session["admin"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            // Highlight active sidebar item based on current page URL
            string pageName = System.IO.Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath).ToLower();

            string dataPage = "overview";
            if (pageName.Contains("drives")) dataPage = "drives";
            else if (pageName.Contains("student")) dataPage = "students";
            else if (pageName.Contains("track")) dataPage = "applications";
            else if (pageName.Contains("notification")) dataPage = "notifications";
            else if (pageName.Contains("content")) dataPage = "content";
            else if (pageName.Contains("report")) dataPage = "reports";

            bodyTag.Attributes["data-admin-page"] = dataPage;
        }
    }
}