using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class Company : System.Web.UI.MasterPage
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadSidebarCompanyInfo();
            }

            // Highlight active sidebar item based on URL
            string pageName = System.IO.Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath).ToLower();
            string dataPage = "overview";
            if (pageName.Contains("profile")) dataPage = "profile";
            else if (pageName.Contains("directory")) dataPage = "directory";

            bodyTag.Attributes["data-company-page"] = dataPage;
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        public void loadSidebarCompanyInfo()
        {
            getcon();

            string query = "";
            if (Session["company"] != null && !string.IsNullOrEmpty(Session["company"].ToString()))
            {
                string sess = Session["company"].ToString().Replace("'", "''");
                query = "select top 1 * from register_auth_company where compEmail='" + sess + "' or compUsername='" + sess + "'";
            }
            else
            {
                query = "select top 1 * from register_auth_company";
            }

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            // Fallback if session search returns 0 rows
            if (ds.Tables[0].Rows.Count == 0)
            {
                da = new SqlDataAdapter("select top 1 * from register_auth_company", con);
                ds = new DataSet();
                da.Fill(ds);
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                string name = dr["compName"].ToString();
                if (string.IsNullOrEmpty(name))
                {
                    name = dr["compHRName"].ToString();
                }
                if (string.IsNullOrEmpty(name))
                {
                    name = "Company HR";
                }

                lblSidebarTopCompanyName.Text = name;
                lblSidebarBottomCompanyName.Text = name;

                if (ds.Tables[0].Columns.Contains("compLogo"))
                {
                    string logo = dr["compLogo"].ToString();
                    if (!string.IsNullOrEmpty(logo))
                    {
                        if (!logo.StartsWith("~") && !logo.StartsWith("/"))
                        {
                            logo = "~/CompanyUploads/" + logo;
                        }
                        string fullLogoUrl = ResolveUrl(logo);

                        // Top Sidebar Logo
                        imgSidebarTopLogo.ImageUrl = fullLogoUrl;
                        imgSidebarTopLogo.Visible = true;
                        pnlSidebarTopAvatar.Visible = false;

                        // Bottom Logged In Logo
                        imgSidebarBottomLogo.ImageUrl = fullLogoUrl;
                        imgSidebarBottomLogo.Visible = true;
                        pnlSidebarBottomAvatar.Visible = false;

                        // Top Navbar Avatar Logo
                        imgNavHeaderLogo.ImageUrl = fullLogoUrl;
                        imgNavHeaderLogo.Visible = true;
                        lblNavHeaderAvatar.Visible = false;
                    }
                    else
                    {
                        string initials = name.Substring(0, Math.Min(2, name.Length)).ToUpper();

                        imgSidebarTopLogo.Visible = false;
                        pnlSidebarTopAvatar.Visible = true;

                        imgSidebarBottomLogo.Visible = false;
                        pnlSidebarBottomAvatar.Visible = true;

                        imgNavHeaderLogo.Visible = false;
                        lblNavHeaderAvatar.Visible = true;
                        lblNavHeaderAvatar.Text = initials;
                    }
                }
            }
            con.Close();
        }
    }
}