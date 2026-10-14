using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class StudentNotifications : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ViewState["Filter"] = "All";
                fillGrid();
            }
        }

        void fillGrid()
        {
            getcon();

            string abc = Session["student"] != null ? Session["student"].ToString() : "";

            // Get all notifications: Applications + Drives + TPO Broadcasts
            da = new SqlDataAdapter("select 'Application' as NotificationType, ca.Id, rac.compName, rac.compLogo, ca.JobRole, ca.ApplicationStatus, ca.InterviewDate, ca.InterviewVenue, ca.AppliedDate as NotificationDate from Company_Applications ca left join register_auth_company rac on (ca.CompanyUsername=rac.compUsername or ca.CompanyUsername=rac.compEmail or ca.CompanyUsername=rac.compName) where ca.StudentEmail='" + abc + "' or ca.StudentUsername='" + abc + "' or ca.StudentRollNo='" + abc + "' union all select 'Drive' as NotificationType, cd.Id, rac.compName, rac.compLogo, cd.JobRole, cd.DriveStatus as ApplicationStatus, null as InterviewDate, '' as InterviewVenue, cd.DriveDate as NotificationDate from Company_Drives cd left join register_auth_company rac on (cd.CompanyUsername=rac.compUsername or cd.CompanyUsername=rac.compEmail or cd.CompanyUsername=rac.compName) union all select 'Notice' as NotificationType, b.Id, b.Title as compName, b.Category as compLogo, b.MessageBody as JobRole, b.Priority as ApplicationStatus, null as InterviewDate, b.AttachmentLink as InterviewVenue, b.CreatedDate as NotificationDate from TPO_Broadcasts b where b.IsActive = 1 order by NotificationDate desc", con);
            ds = new DataSet();
            da.Fill(ds);

            int interviewCount = 0;
            int driveCount = 0;

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string type = ds.Tables[0].Rows[i]["NotificationType"].ToString();
                string status = ds.Tables[0].Rows[i]["ApplicationStatus"].ToString();

                if (type == "Application" && (status == "Interview Scheduled" || ds.Tables[0].Rows[i]["InterviewDate"] != DBNull.Value))
                {
                    interviewCount++;
                }
                if (type == "Drive")
                {
                    driveCount++;
                }
            }
            lblTotalAlerts.Text = ds.Tables[0].Rows.Count.ToString();
            lblInterviewCalls.Text = interviewCount.ToString();
            lblActiveDrivesCount.Text = driveCount.ToString();

            string filter = ViewState["Filter"] != null ? ViewState["Filter"].ToString() : "All";

            // ALL
            if (filter == "All")
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            // NOTICES / BROADCASTS
            else if (filter == "Notices")
            {
                da = new SqlDataAdapter("select 'Notice' as NotificationType, b.Id, b.Title as compName, b.Category as compLogo, b.MessageBody as JobRole, b.Priority as ApplicationStatus, null as InterviewDate, b.AttachmentLink as InterviewVenue, b.CreatedDate as NotificationDate from TPO_Broadcasts b where b.IsActive = 1 order by NotificationDate desc", con);
                DataSet filterDs = new DataSet();
                da.Fill(filterDs);
                GridView1.DataSource = filterDs;
                GridView1.DataBind();
            }
            // INTERVIEWS
            else if (filter == "Interviews")
            {
                da = new SqlDataAdapter("select 'Application' as NotificationType, ca.Id, rac.compName, rac.compLogo, ca.JobRole, ca.ApplicationStatus, ca.InterviewDate, ca.InterviewVenue, ca.AppliedDate as NotificationDate from Company_Applications ca left join register_auth_company rac on (ca.CompanyUsername=rac.compUsername or ca.CompanyUsername=rac.compEmail or ca.CompanyUsername=rac.compName) where (ca.StudentEmail='" + abc + "' or ca.StudentUsername='" + abc + "' or ca.StudentRollNo='" + abc + "') and (ca.InterviewDate is not null or ca.ApplicationStatus='Interview Scheduled') order by NotificationDate desc", con);
                DataSet filterDs = new DataSet();
                da.Fill(filterDs);
                GridView1.DataSource = filterDs;
                GridView1.DataBind();
            }
            // DRIVES
            else if (filter == "Drives")
            {
                da = new SqlDataAdapter("select 'Drive' as NotificationType, cd.Id, rac.compName, rac.compLogo, cd.JobRole, cd.DriveStatus as ApplicationStatus, null as InterviewDate, '' as InterviewVenue, cd.DriveDate as NotificationDate from Company_Drives cd left join register_auth_company rac on (cd.CompanyUsername=rac.compUsername or cd.CompanyUsername=rac.compEmail or cd.CompanyUsername=rac.compName) order by NotificationDate desc", con);
                DataSet filterDs = new DataSet();
                da.Fill(filterDs);
                GridView1.DataSource = filterDs;
                GridView1.DataBind();
            }
            // SELECTIONS
            else if (filter == "Selections")
            {
                da = new SqlDataAdapter("select 'Application' as NotificationType, ca.Id, rac.compName, rac.compLogo, ca.JobRole, ca.ApplicationStatus, ca.InterviewDate, ca.InterviewVenue, ca.AppliedDate as NotificationDate from Company_Applications ca left join register_auth_company rac on (ca.CompanyUsername=rac.compUsername or ca.CompanyUsername=rac.compEmail or ca.CompanyUsername=rac.compName) where (ca.StudentEmail='" + abc + "' or ca.StudentUsername='" + abc + "' or ca.StudentRollNo='" + abc + "') and (ca.ApplicationStatus='Selected' or ca.ApplicationStatus='Offer Accepted') order by NotificationDate desc", con);
                DataSet filterDs = new DataSet();
                da.Fill(filterDs);
                GridView1.DataSource = filterDs;
                GridView1.DataBind();
            }
        }

        protected void Filter_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            ViewState["Filter"] = btn.CommandArgument;

            fillGrid();
        }
    }
}