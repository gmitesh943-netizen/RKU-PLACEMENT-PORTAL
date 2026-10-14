using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class StudentDrives : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                datalist();
                updateStats();
            }
        }
        void datalist()
        {
            getcon();
            string sess = Session["student"] != null ? Session["student"].ToString() : "";
            da = new SqlDataAdapter("select d.*, c.compName, c.compLogo, c.compIndustry, case when d.DriveStatus <> 'Open' then 'Closed' when exists (select 1 from Company_Applications a where a.DriveId = d.Id and (a.StudentEmail = '" + sess + "' or a.StudentUsername = '" + sess + "' or a.StudentRollNo = '" + sess + "')) then 'Applied' else 'Apply Now' end as ApplyButton from Company_Drives d left join register_auth_company c on (d.CompanyUsername = c.compUsername or d.CompanyUsername = c.compEmail) order by d.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        void updateStats()
        {
            getcon();

            // Total Drives Count 
            da = new SqlDataAdapter("select count(*) from Company_Drives", con);
            ds = new DataSet();
            da.Fill(ds);
            driveCountLabel.Text = ds.Tables[0].Rows[0][0].ToString() + " Drives";

            //  Open / Eligible Drives Count 
            da = new SqlDataAdapter("select count(*) from Company_Drives where DriveStatus='Open'", con);
            ds = new DataSet();
            da.Fill(ds);
            statOpenCount.Text = ds.Tables[0].Rows[0][0].ToString();
            statEligibleCount.Text = ds.Tables[0].Rows[0][0].ToString();

            // Applied Drives Count 
            string sess = Session["student"] != null ? Session["student"].ToString() : "";
            da = new SqlDataAdapter("select count(*) from Company_Applications where StudentEmail='" + sess + "' or StudentUsername='" + sess + "' or StudentRollNo='" + sess + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            statAppliedCount.Text = ds.Tables[0].Rows[0][0].ToString();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Apply")
            {
                string driveId = e.CommandArgument.ToString();
                string sess = Session["student"] != null ? Session["student"].ToString() : "";

                if (sess != "")
                {
                    getcon();
                    da = new SqlDataAdapter("select * from register_auth where regEmail='" + sess + "' or regUsername='" + sess + "'", con);
                    ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string sUser = ds.Tables[0].Rows[0]["regUsername"].ToString();
                        string sName = ds.Tables[0].Rows[0]["regFullName"].ToString();
                        string sEmail = ds.Tables[0].Rows[0]["regEmail"].ToString();
                        string sRoll = ds.Tables[0].Rows[0]["regRollNo"].ToString();
                        string sMobile = ds.Tables[0].Rows[0]["regMobile"].ToString();
                        string sBranch = ds.Tables[0].Rows[0]["branch"].ToString();
                        string sCgpa = ds.Tables[0].Rows[0]["cgpa"].ToString();
                        string sResume = ds.Tables[0].Rows[0]["resumeUrl"].ToString();


                        da = new SqlDataAdapter("select * from Company_Drives where Id='" + driveId + "'", con);
                        ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            string jobRole = ds.Tables[0].Rows[0]["JobRole"].ToString();
                            string compUser = ds.Tables[0].Rows[0]["CompanyUsername"].ToString();
                            string driveStatus = ds.Tables[0].Rows[0]["DriveStatus"].ToString();

                            if (driveStatus == "Open")
                            {
                                // check a aaply  
                                da = new SqlDataAdapter("select count(*) from Company_Applications where DriveId='" + driveId + "' and (StudentEmail='" + sEmail + "' or StudentUsername='" + sUser + "' or StudentRollNo='" + sRoll + "')", con);
                                ds = new DataSet();
                                da.Fill(ds);

                                if (Convert.ToInt32(ds.Tables[0].Rows[0][0]) == 0)
                                {
                                    // Apply
                                    cmd = new SqlCommand("insert into Company_Applications(DriveId, JobRole, CompanyUsername, StudentUsername, StudentRollNo, StudentName, StudentEmail, StudentMobile, StudentBranch, StudentCgpa, StudentResume, ApplicationStatus, AppliedDate) values('" + driveId + "', '" + jobRole + "', '" + compUser + "', '" + sUser + "', '" + sRoll + "', '" + sName + "', '" + sEmail + "', '" + sMobile + "', '" + sBranch + "', '" + sCgpa + "', '" + sResume + "', 'Pending', GETDATE())", con);
                                    cmd.ExecuteNonQuery();
                                }
                            }
                        }
                    }
                    datalist();
                    updateStats();
                }
            }
        }
    }
}