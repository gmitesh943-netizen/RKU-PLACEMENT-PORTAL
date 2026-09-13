using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Student session check — redirect to login if not authenticated
            if (Session["student"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            // Automatically set data-student-page on <body> based on current page filename
            // This highlights the correct sidebar item via student-panel.js
            string pageName = System.IO.Path.GetFileNameWithoutExtension(
                Request.Url.AbsolutePath).ToLower();

            string dataPage = "overview";
            if (pageName.Contains("profile"))      dataPage = "profile";
            else if (pageName.Contains("drives"))  dataPage = "drives";
            else if (pageName.Contains("applications")) dataPage = "applications";
            else if (pageName.Contains("training")) dataPage = "training";

            bodyTag.Attributes["data-student-page"] = dataPage;
        }
    }
}