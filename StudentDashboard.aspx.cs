using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                filldata();
                fillGrid();
                fillInterviews();
                fillCounters();
                fillDrives();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void filldata()
        {
            getcon();

            da = new SqlDataAdapter("select * from register_auth where regEmail='" + Session["student"] + "' or regUsername='" + Session["student"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblHelloName.Text = ds.Tables[0].Rows[0]["regFullName"].ToString();
                lblCgpaOverview.Text = ds.Tables[0].Rows[0]["cgpa"].ToString();
                lblDegreeBranch.Text = ds.Tables[0].Rows[0]["degree"].ToString() + " (" + ds.Tables[0].Rows[0]["branch"].ToString() + ")";
                lblEnrollmentNo.Text = ds.Tables[0].Rows[0]["regRollNo"].ToString();

                int score = 20;

                bool academic = ds.Tables[0].Rows[0]["degree"].ToString() != "" && ds.Tables[0].Rows[0]["branch"].ToString() != "";
                bool cgpa = ds.Tables[0].Rows[0]["cgpa"].ToString() != "";
                bool skills = ds.Tables[0].Rows[0]["skills"].ToString() != "";
                bool resume = ds.Tables[0].Rows[0]["resumeUrl"].ToString() != "";
                bool photo = ds.Tables[0].Rows[0]["photoUrl"].ToString() != "";

                if (academic) score += 20;
                if (cgpa) score += 15;
                if (skills) score += 15;
                if (resume) score += 20;
                if (photo) score += 10;

                if (score > 100) score = 100;

                lblCompletionPercent.Text = score + "%";
                profileProgressBar.Style["width"] = score + "%";
            }
        }
        void fillGrid()
        {
            getcon();
            da = new SqlDataAdapter("select top 4 a.*, c.compName, c.compLogo from Company_Applications a left join register_auth_company c on (a.CompanyUsername=c.compUsername or a.CompanyUsername=c.compEmail) where a.StudentEmail='" + Session["student"] + "' or a.StudentUsername='" + Session["student"] + "' or a.StudentRollNo='" + Session["student"] + "' order by a.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void fillInterviews()
        {
            getcon();
            da = new SqlDataAdapter("select top 3 a.*, c.compName, c.compLogo from Company_Applications a left join register_auth_company c on (a.CompanyUsername=c.compUsername or a.CompanyUsername=c.compEmail) where a.InterviewDate is not null and (a.StudentEmail='" + Session["student"] + "' or a.StudentUsername='" + Session["student"] + "' or a.StudentRollNo='" + Session["student"] + "') order by a.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);

            divInterviewAlert.Visible = ds.Tables[0].Rows.Count > 0;

            if (ds.Tables[0].Rows.Count > 0)
            {
                GridViewInterviews.DataSource = ds;
                GridViewInterviews.DataBind();
            }
        }

        //    ---->Total Applied   Shortlisted / In Process   Offers / Selected   Eligible Open Drives  ------->
        void fillCounters()
        {
            getcon();

            // Total Applied
            da = new SqlDataAdapter("select count(*) from Company_Applications where StudentEmail='" + Session["student"] + "' or StudentUsername='" + Session["student"] + "' or StudentRollNo='" + Session["student"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            lblStatApplied.Text = ds.Tables[0].Rows[0][0].ToString();

            //Shortlisted / In Process
            da = new SqlDataAdapter("select count(*) from Company_Applications where (StudentEmail='" + Session["student"] + "' or StudentUsername='" + Session["student"] + "' or StudentRollNo='" + Session["student"] + "') and (ApplicationStatus='Shortlisted' or ApplicationStatus='In Process' or ApplicationStatus like '%round%' or ApplicationStatus like '%interview%')", con);
            ds = new DataSet();
            da.Fill(ds);
            lblStatShortlisted.Text = ds.Tables[0].Rows[0][0].ToString();

            //Offers / Selected
            da = new SqlDataAdapter("select count(*) from Company_Applications where (StudentEmail='" + Session["student"] + "' or StudentUsername='" + Session["student"] + "' or StudentRollNo='" + Session["student"] + "') and (ApplicationStatus='Selected' or ApplicationStatus='Placed' or ApplicationStatus='Offer Accepted' or ApplicationStatus='Offer Issued' or ApplicationStatus like '%offer%')", con);
            ds = new DataSet();
            da.Fill(ds);
            lblStatOffers.Text = ds.Tables[0].Rows[0][0].ToString();

            // Eligible Open Drives
            da = new SqlDataAdapter("select count(*) from Company_Drives where DriveStatus='Open'", con);
            ds = new DataSet();
            da.Fill(ds);
            lblStatEligible.Text = ds.Tables[0].Rows[0][0].ToString();
        }
        void fillDrives()
        {
            getcon();

            da = new SqlDataAdapter("select top 4 d.*, c.compName, c.compLogo, c.compIndustry from Company_Drives d left join register_auth_company c on (d.CompanyUsername=c.compUsername or d.CompanyUsername=c.compEmail) order by d.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            GridViewDrives.DataSource = ds;
            GridViewDrives.DataBind();
        }
    }
}