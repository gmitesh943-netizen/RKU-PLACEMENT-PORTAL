using System;
using System.Collections.Generic;
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
            if (Session["company"] == null || string.IsNullOrWhiteSpace(Session["company"].ToString()))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                fillCompanyInfo();
                totalstudents();
                activedrives();
                totalapplications();
                placedstudents();
                fillDashboardCharts();
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

        void totalstudents()
        {
            getcon();
            cmd = new SqlCommand("select isnull(count(*), 0) from register_auth", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            lblStatRegisteredStudents.Text = i.ToString();
        }

        void activedrives()
        {
            getcon();
            string abc = Session["company"] != null ? Session["company"].ToString() : "";
            cmd = new SqlCommand("select isnull(count(*), 0) from Company_Drives where DriveStatus='Open' and (CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "'))", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            lblStatActiveDrives.Text = i.ToString();
        }

        void totalapplications()
        {
            getcon();
            string abc = Session["company"] != null ? Session["company"].ToString() : "";
            cmd = new SqlCommand("select isnull(count(*), 0) from Company_Applications where CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "') or DriveId in (select Id from Company_Drives where CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "'))", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            lblStatTotalApps.Text = i.ToString();
        }

        void placedstudents()
        {
            getcon();
            string abc = Session["company"] != null ? Session["company"].ToString() : "";
            cmd = new SqlCommand("select isnull(count(*), 0) from Company_Applications where (ApplicationStatus='Selected' or ApplicationStatus='Offer Accepted') and (CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "') or DriveId in (select Id from Company_Drives where CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "')))", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            lblStatPlacedStudents.Text = i.ToString();
        }

        void fillCounters()
        {
            totalstudents();
            activedrives();
            totalapplications();
            placedstudents();
        }

        //<------------------  Dashboard Charts ------------->
        void fillDashboardCharts()
        {
            getcon();
            string abc = Session["company"] != null ? Session["company"].ToString() : "";

            // Condition for logged-in company only 
            string compCond = "(CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "') or DriveId in (select Id from Company_Drives where CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "')))";

            // Applications Count
            da = new SqlDataAdapter("select count(*) from Company_Applications where " + compCond, con);
            ds = new DataSet();
            da.Fill(ds);
            int totalApps = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            hfFunnelApps.Value = totalApps.ToString();

            // Under Review / Pending Count
            da = new SqlDataAdapter("select count(*) from Company_Applications where (ApplicationStatus='Under Review' or ApplicationStatus='Pending' or ApplicationStatus is null or ApplicationStatus='') and " + compCond, con);
            ds = new DataSet();
            da.Fill(ds);
            int underReview = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            hfFunnelReview.Value = underReview.ToString();

            // Shortlisted Count
            da = new SqlDataAdapter("select count(*) from Company_Applications where ApplicationStatus='Shortlisted' and " + compCond, con);
            ds = new DataSet();
            da.Fill(ds);
            int shortlisted = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            hfFunnelShortlisted.Value = shortlisted.ToString();

            // Interviews Count
            da = new SqlDataAdapter("select count(*) from Company_Applications where (ApplicationStatus like '%Interview%' or ApplicationStatus='Interview Scheduled') and " + compCond, con);
            ds = new DataSet();
            da.Fill(ds);
            int interviews = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            hfFunnelInterviews.Value = interviews.ToString();

            // Selected / Placed Count
            da = new SqlDataAdapter("select count(*) from Company_Applications where (ApplicationStatus='Selected' or ApplicationStatus='Offer Accepted') and " + compCond, con);
            ds = new DataSet();
            da.Fill(ds);
            int selected = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
            hfFunnelSelected.Value = selected.ToString();

           //<----Department  Branch wise count for this company only--->
            da = new SqlDataAdapter("select ISNULL(NULLIF(LTRIM(RTRIM(StudentBranch)), ''), 'Other') as Department, count(*) as TotalCount from Company_Applications where " + compCond + " group by ISNULL(NULLIF(LTRIM(RTRIM(StudentBranch)), ''), 'Other') order by count(*) desc", con);
            ds = new DataSet();
            da.Fill(ds);

            string labels = "";
            string counts = "";

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (i > 0)
                {
                    labels += ",";
                    counts += ",";
                }
                labels += ds.Tables[0].Rows[i]["Department"].ToString();
                counts += ds.Tables[0].Rows[i]["TotalCount"].ToString();
            }

            hfDeptLabels.Value = labels;
            hfDeptData.Value = counts;
            hfDeptTotal.Value = totalApps.ToString();
        }

        //<------------------ Recent Drives  ------------->
        void fillRecentDrives()
        {
            getcon();
            string abc = Session["company"] != null ? Session["company"].ToString() : "";

            da = new SqlDataAdapter("select top 5 JobRole, PackageOffered, DriveDate, DriveStatus from Company_Drives where CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "') order by Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            gvRecentDrives.DataSource = ds;
            gvRecentDrives.DataBind();
        }

        //<------------------ Recent Applicants  ------------->
        void fillRecentApplicants()
        {
            getcon();
            string abc = Session["company"] != null ? Session["company"].ToString() : "";

            da = new SqlDataAdapter("select top 5 a.StudentName, a.StudentRollNo, a.StudentBranch, a.JobRole, a.ApplicationStatus, (select top 1 r.photoUrl from register_auth r where (r.regEmail = a.StudentEmail and a.StudentEmail <> '') or (r.regUsername = a.StudentUsername and a.StudentUsername <> '') or (r.regRollNo = a.StudentRollNo and a.StudentRollNo <> '') order by case when r.photoUrl is not null and r.photoUrl <> '' then 0 else 1 end, r.Id desc) as photoUrl from Company_Applications a where a.CompanyUsername='" + abc + "' or a.CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "') or a.DriveId in (select Id from Company_Drives where CompanyUsername='" + abc + "' or CompanyUsername in (select compUsername from register_auth_company where compEmail='" + abc + "' or compUsername='" + abc + "')) order by a.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            gvRecentApplicants.DataSource = ds;
            gvRecentApplicants.DataBind();
        }
    }
}
