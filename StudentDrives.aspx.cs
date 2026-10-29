using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
        StudentDrivesClass driveClass = new StudentDrivesClass();

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        string getStudentUser()
        {
            return Session["student"] != null ? Session["student"].ToString() : "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            if (!IsPostBack)
            {
                ViewState["page"] = 0;
                fillgrid();
                updateStats();
            }
        }

        void startcon()
        {
            driveClass = new StudentDrivesClass();
            driveClass.getcon();
        }

        //without filter all show 
        void fillgrid()
        {
            driveClass = new StudentDrivesClass();
            DataTable dt = driveClass.select_drives(getStudentUser()).Tables[0];

            driveCountLabel.Text = dt.Rows.Count.ToString() + " Drives";
            noResultMessage.Visible = (dt.Rows.Count == 0);

            int page = Convert.ToInt32(ViewState["page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["page"] = page;
            }

            DataList1.DataSource = driveClass.certificate_pagination(dt, page);
            DataList1.DataBind();

            lblPages.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = page > 0;
            btnNext.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        // With filter show data
        void filtergrid(DataTable dt)
        {
            driveCountLabel.Text = (dt != null ? dt.Rows.Count.ToString() : "0") + " Drives";
            noResultMessage.Visible = (dt == null || dt.Rows.Count == 0);

            ViewState["page"] = 0;

            DataList1.DataSource = driveClass.certificate_pagination(dt, 0);
            DataList1.DataBind();

            int totalPages = dt != null ? (int)Math.Ceiling(dt.Rows.Count / 6.0) : 0;

            lblPages.Text = "Page 1 of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = false;
            btnNext.Enabled = dt != null && dt.Rows.Count > 6;
        }

        // Previous Button
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) - 1;
            fillgrid();
        }

        // Next Button
        protected void btnNext_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) + 1;
            fillgrid();
        }

        // SearchButton 
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            driveClass = new StudentDrivesClass();
            filtergrid(driveClass.search_drives(txtSearch.Text, getStudentUser()).Tables[0]);
        }

        // Status
        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            driveClass = new StudentDrivesClass();
            filtergrid(driveClass.select_drives_by_status(ddlStatus.SelectedValue, getStudentUser()).Tables[0]);
        }

        // ResetButton
        protected void btnResetFilter_Click(object sender, EventArgs e)
        {
            ViewState["page"] = 0;
            txtSearch.Text = "";
            ddlStatus.SelectedIndex = 0;
            fillgrid();
        }

        // Backward compatibility
        void datalist()
        {
            fillgrid();
        }

        void filterdata(DataTable dt)
        {
            filtergrid(dt);
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
            string sess = getStudentUser();
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
                string sess = getStudentUser();

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
                                // check if already applied
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
                    fillgrid();
                    updateStats();
                }
            }
        }
    }
}
