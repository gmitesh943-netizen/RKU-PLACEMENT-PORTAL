using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class CompanyProfile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ensureSchema();
                loadCompanyProfile();
                filldata();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void ensureSchema()
        {
            getcon();
            cmd = new SqlCommand("IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'register_auth_company') AND name = 'compTagline') BEGIN ALTER TABLE register_auth_company ADD compTagline NVARCHAR(MAX) NULL, compDescription NVARCHAR(MAX) NULL, compIndustry NVARCHAR(100) NULL, compLocation NVARCHAR(200) NULL, compPackageRange NVARCHAR(100) NULL, compWebsite NVARCHAR(200) NULL, compTags NVARCHAR(MAX) NULL; END IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'register_auth_company') AND name = 'compLogo') BEGIN ALTER TABLE register_auth_company ADD compLogo NVARCHAR(MAX) NULL; END", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        void loadCompanyProfile()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth_company where compEmail='" + Session["company"] + "' or compUsername='" + Session["company"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                da = new SqlDataAdapter("select top 1 * from register_auth_company", con);
                ds = new DataSet();
                da.Fill(ds);
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                profileDisplayName.Text = ds.Tables[0].Rows[0]["compName"].ToString();
                profileDisplayIndustry.Text = ds.Tables[0].Rows[0]["compIndustry"].ToString();
                profileDisplayLocation.Text = ds.Tables[0].Rows[0]["compLocation"].ToString();
                profileDisplayPackage.Text = ds.Tables[0].Rows[0]["compPackageRange"].ToString();

                string photo = ds.Tables[0].Rows[0]["compLogo"].ToString();
                if (!string.IsNullOrEmpty(photo))
                {
                    if (!photo.StartsWith("~") && !photo.StartsWith("/"))
                    {
                        photo = "~/CompanyUploads/" + photo;
                    }
                    imgCompanyLogo.ImageUrl = ResolveUrl(photo);
                    imgCompanyLogo.Visible = true;
                    pnlLogoPlaceholder.Visible = false;
                }
            }
            con.Close();
        }

        void filldata()
        {
            getcon();
            da = new SqlDataAdapter("select * from register_auth_company where compEmail='" + Session["company"] + "' or compUsername='" + Session["company"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                da = new SqlDataAdapter("select top 1 * from register_auth_company", con);
                ds = new DataSet();
                da.Fill(ds);
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                cpName.Text = ds.Tables[0].Rows[0]["compName"].ToString();
                cpTagline.Text = ds.Tables[0].Rows[0]["compTagline"].ToString();
                cpDescription.Text = ds.Tables[0].Rows[0]["compDescription"].ToString();

                string ind = ds.Tables[0].Rows[0]["compIndustry"].ToString();
                if (cpIndustry.Items.FindByValue(ind) != null)
                {
                    cpIndustry.SelectedValue = ind;
                }

                cpLocation.Text = ds.Tables[0].Rows[0]["compLocation"].ToString();
                cpPackageRange.Text = ds.Tables[0].Rows[0]["compPackageRange"].ToString();
                cpWebsite.Text = ds.Tables[0].Rows[0]["compWebsite"].ToString();
                cpTags.Text = ds.Tables[0].Rows[0]["compTags"].ToString();
            }
            con.Close();
        }

        protected void btnSaveCompanyProfile_Click(object sender, EventArgs e)
        {
            getcon();

            if (fuCompanyLogo.HasFile)
            {
                fuCompanyLogo.SaveAs(Server.MapPath("~/CompanyUploads/" + fuCompanyLogo.FileName));

                cmd = new SqlCommand("update register_auth_company set compName='" + cpName.Text + "',compTagline='" + cpTagline.Text + "',compDescription='" + cpDescription.Text + "',compIndustry='" + cpIndustry.SelectedValue + "',compLocation='" + cpLocation.Text + "',compPackageRange='" + cpPackageRange.Text + "',compWebsite='" + cpWebsite.Text + "',compTags='" + cpTags.Text + "',compLogo='" + fuCompanyLogo.FileName + "' where compEmail='" + Session["company"] + "' or compUsername='" + Session["company"] + "'", con);
            }
            else
            {
                cmd = new SqlCommand("update register_auth_company set compName='" + cpName.Text + "',compTagline='" + cpTagline.Text + "',compDescription='" + cpDescription.Text + "',compIndustry='" + cpIndustry.SelectedValue + "',compLocation='" + cpLocation.Text + "',compPackageRange='" + cpPackageRange.Text + "',compWebsite='" + cpWebsite.Text + "',compTags='" + cpTags.Text + "' where compEmail='" + Session["company"] + "' or compUsername='" + Session["company"] + "'", con);
            }

            cmd.ExecuteNonQuery();
            con.Close();

            loadCompanyProfile();
            filldata();

            if (Master != null)
            {
                ((Company)Master).loadSidebarCompanyInfo();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            filldata();
        }
    }
}