using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class CompanyOverview : System.Web.UI.Page
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
                fillCompanyInfo();
                fillCounters();
                fillRecentDrives();
                fillRecentApplicants();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fillCompanyInfo()
        {
            getcon();
            string abc = Session["company"] != null ? Session["company"].ToString() : "";

            da = new SqlDataAdapter("select top 1 * from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                string name = ds.Tables[0].Rows[0]["compName"].ToString();
                if (string.IsNullOrEmpty(name))
                {
                    name = ds.Tables[0].Rows[0]["compHRName"].ToString();
                }
                if (!string.IsNullOrEmpty(name))
                {
                    lblHeroCompanyName.Text = name;
                }
            }
        }

        void fillCounters()
        {
            getcon();
            string abc = Session["company"] != null ? Session["company"].ToString() : "";

            // Total Registered Students
            da = new SqlDataAdapter("select count(*) from register_auth", con);
            ds = new DataSet();
            da.Fill(ds);
            int studentCount = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            lblStatRegisteredStudents.Text = studentCount.ToString();

            // Active Drives posted by this company
            da = new SqlDataAdapter("select count(*) from Company_Drives where DriveStatus='Open' and (CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "'))", con);
            ds = new DataSet();
            da.Fill(ds);
            int activeDrives = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            lblStatActiveDrives.Text = activeDrives.ToString();

            // Applications Received
            da = new SqlDataAdapter("select count(*) from Company_Applications where CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "')", con);
            ds = new DataSet();
            da.Fill(ds);
            int appsCount = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            lblStatTotalApps.Text = appsCount.ToString();

            // Placed / Selected Students
            da = new SqlDataAdapter("select count(*) from Company_Applications where (ApplicationStatus='Selected' or ApplicationStatus='Offer Accepted') and (CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "'))", con);
            ds = new DataSet();
            da.Fill(ds);
            int placedCount = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            lblStatPlacedStudents.Text = placedCount.ToString();
        }

        //<------------------ Recent Applicants------------->
        void fillRecentDrives()
        {
            getcon();
            string sess = Session["company"] != null ? Session["company"].ToString() : "";

            da = new SqlDataAdapter("select top 5 JobRole, PackageOffered, DriveDate, DriveStatus from Company_Drives where CompanyUsername='" + sess + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + sess + "' or compUsername='" + sess + "') order by Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            gvRecentDrives.DataSource = ds;
            gvRecentDrives.DataBind();
        }

        //<------------------ Recent Applicants------------->
        void fillRecentApplicants()
        {
            getcon();
            string sess = Session["company"] != null ? Session["company"].ToString() : "";

            da = new SqlDataAdapter("select top 5 a.StudentName, a.StudentRollNo, a.StudentBranch, a.JobRole, a.ApplicationStatus, (select top 1 r.photoUrl from register_auth r where (r.regEmail = a.StudentEmail and a.StudentEmail <> '') or (r.regUsername = a.StudentUsername and a.StudentUsername <> '') or (r.regRollNo = a.StudentRollNo and a.StudentRollNo <> '') order by case when r.photoUrl is not null and r.photoUrl <> '' then 0 else 1 end, r.Id desc) as photoUrl from Company_Applications a where a.CompanyUsername='" + sess + "' or a.CompanyUsername in (select compUsername from register_auth_company where compEmail='" + sess + "' or compUsername='" + sess + "') order by a.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            gvRecentApplicants.DataSource = ds;
            gvRecentApplicants.DataBind();
        }
    }
}