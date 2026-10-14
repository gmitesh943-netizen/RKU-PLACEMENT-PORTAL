using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.IO;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminReports : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadKPIs();
                LoadRosterGrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void LoadKPIs()
        {
            int students = 0;
            int placed = 0;
            int drives = 0;

            getcon();

            try
            {
                cmd = new SqlCommand("select count(*) from register_auth where regRole='student'", con);
                students = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch { }

            try
            {
                cmd = new SqlCommand("select count(*) from Company_Applications where ApplicationStatus='Selected'", con);
                placed = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch { }

            try
            {
                cmd = new SqlCommand("select count(*) from Company_Drives", con);
                drives = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch { }

            con.Close();

            lblRptStudents.Text = students.ToString();
            lblRptPlaced.Text = placed.ToString();
            lblRptDrives.Text = drives.ToString();

            if (students > 0)
            {
                double rate = ((double)placed / students) * 100.0;
                lblRptRate.Text = rate.ToString("0.0") + "%";
            }
            else
            {
                lblRptRate.Text = "0%";
            }
        }

        void LoadRosterGrid()
        {
            getcon();

            string qry = "select ca.*, rac.compName from Company_Applications ca LEFT JOIN register_auth_company rac ON ca.CompanyUsername = rac.compUsername where 1=1";

            if (ddlReportStatus.SelectedValue != "All")
            {
                qry += " and ca.ApplicationStatus='" + ddlReportStatus.SelectedValue + "'";
            }

            if (!string.IsNullOrEmpty(txtReportSearch.Text.Trim()))
            {
                string search = txtReportSearch.Text.Trim();
                qry += " and (ca.StudentName like '%" + search + "%' or ca.StudentRollNo like '%" + search + "%' or ca.StudentBranch like '%" + search + "%')";
            }

            qry += " order by ca.Id desc";

            da = new SqlDataAdapter(qry, con);
            ds = new DataSet();
            da.Fill(ds);
            con.Close();

            gvReportRoster.DataSource = ds;
            gvReportRoster.DataBind();
        }

        protected void ReportFilter_Changed(object sender, EventArgs e)
        {
            LoadRosterGrid();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LoadRosterGrid();
        }

        protected void btnFilterReset_Click(object sender, EventArgs e)
        {
            ddlReportStatus.SelectedValue = "All";
            txtReportSearch.Text = "";
            LoadRosterGrid();
        }

        public string GetReportStatusBadge(object statusObj)
        {
            string status = statusObj != null ? statusObj.ToString() : "Applied";
            if (status == "Selected")
            {
                return "<span class='badge bg-success-subtle text-success border border-success-subtle px-2 py-1'><i class='fa-solid fa-trophy me-1'></i>Selected / Placed</span>";
            }
            else if (status == "Shortlisted")
            {
                return "<span class='badge bg-info-subtle text-info border border-info-subtle px-2 py-1'><i class='fa-solid fa-star me-1'></i>Shortlisted</span>";
            }
            else if (status == "Interview Scheduled")
            {
                return "<span class='badge bg-primary-subtle text-primary border border-primary-subtle px-2 py-1'><i class='fa-solid fa-calendar me-1'></i>Interview</span>";
            }
            else if (status == "Rejected")
            {
                return "<span class='badge bg-danger-subtle text-danger border border-danger-subtle px-2 py-1'><i class='fa-solid fa-xmark me-1'></i>Rejected</span>";
            }
            else
            {
                return "<span class='badge bg-secondary-subtle text-secondary border px-2 py-1'>Applied</span>";
            }
        }

        protected void btnExportCsv_Click(object sender, EventArgs e)
        {
            getcon();
            string qry = "select ca.StudentRollNo, ca.StudentName, ca.StudentBranch, ca.StudentCgpa, ca.JobRole, ISNULL(rac.compName, ca.CompanyUsername) as Company, ca.ApplicationStatus, ca.AppliedDate from Company_Applications ca LEFT JOIN register_auth_company rac ON ca.CompanyUsername = rac.compUsername order by ca.Id desc";
            da = new SqlDataAdapter(qry, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Roll No,Student Name,Branch,CGPA,Job Role,Company,Status,Applied Date");

            foreach (DataRow row in dt.Rows)
            {
                sb.AppendLine(string.Format("\"{0}\",\"{1}\",\"{2}\",\"{3}\",\"{4}\",\"{5}\",\"{6}\",\"{7:yyyy-MM-dd}\"",
                    row["StudentRollNo"],
                    row["StudentName"],
                    row["StudentBranch"],
                    row["StudentCgpa"],
                    row["JobRole"],
                    row["Company"],
                    row["ApplicationStatus"],
                    row["AppliedDate"]));
            }

            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=RKU_Placement_Roster_" + DateTime.Now.ToString("yyyyMMdd") + ".csv");
            Response.Charset = "";
            Response.ContentType = "text/csv";
            Response.Output.Write(sb.ToString());
            Response.Flush();
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for controls rendered to string or exports
        }
    }
}