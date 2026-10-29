using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillCounters();
                fillRecentDrives();
                fillRecentApplications();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillCounters()
        {
            getcon();

            // Total Students
            da = new SqlDataAdapter("select count(*) from register_auth where regRole='student' or regRole is null", con);
            ds = new DataSet();
            da.Fill(ds);
            int studentCount = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            lblTotalStudents.Text = studentCount.ToString();

            // Total Companies
            da = new SqlDataAdapter("select count(*) from register_auth_company", con);
            ds = new DataSet();
            da.Fill(ds);
            int companyCount = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            lblTotalCompanies.Text = companyCount.ToString();

            // Total Drives
            da = new SqlDataAdapter("select count(*) from Company_Drives", con);
            ds = new DataSet();
            da.Fill(ds);
            int driveCount = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            lblTotalDrives.Text = driveCount.ToString();

            // Placed Students
            da = new SqlDataAdapter("select count(*) from Company_Applications where ApplicationStatus='Selected' or ApplicationStatus='Offer Accepted'", con);
            ds = new DataSet();
            da.Fill(ds);
            int placedCount = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            lblPlacedStudents.Text = placedCount.ToString();

            if (studentCount > 0)
            {
                double rate = ((double)placedCount / studentCount) * 100.0;
                lblPlacementRate.Text = rate.ToString("0.0") + "%";
            }
            else
            {
                lblPlacementRate.Text = "0%";
            }
        }

        void fillRecentDrives()
        {
            getcon();
            da = new SqlDataAdapter("select TOP 5 cd.*, rac.compName, rac.compLogo from Company_Drives cd LEFT JOIN register_auth_company rac ON cd.CompanyUsername = rac.compUsername or cd.CompanyUsername = rac.compEmail order by cd.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            gvRecentDrives.DataSource = ds;
            gvRecentDrives.DataBind();
        }

        void fillRecentApplications()
        {
            getcon();
            da = new SqlDataAdapter("select TOP 5 ca.*, rac.compName, (select top 1 r.photoUrl from register_auth r where (r.regEmail = ca.StudentEmail and ca.StudentEmail <> '') or (r.regUsername = ca.StudentUsername and ca.StudentUsername <> '') or (r.regRollNo = ca.StudentRollNo and ca.StudentRollNo <> '') order by case when r.photoUrl is not null and r.photoUrl <> '' then 0 else 1 end, r.Id desc) as photoUrl from Company_Applications ca LEFT JOIN register_auth_company rac ON ca.CompanyUsername = rac.compUsername or ca.CompanyUsername = rac.compEmail order by ca.Id desc",con);
            ds = new DataSet();
            da.Fill(ds);
            gvRecentApplications.DataSource = ds;
            gvRecentApplications.DataBind();
            
        }
    }
}