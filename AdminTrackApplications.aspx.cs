using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class AdminTrackApplications : System.Web.UI.Page
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
                loadCompanies();
                fillgrid();
                fillStats();
            }
        }
        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        // ==================== Grid View fill data ====================
        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select ca.*, rac.compName, rac.compLogo, (select top 1 r.photoUrl from register_auth r where (r.regEmail = ca.StudentEmail and ca.StudentEmail <> '') or (r.regUsername = ca.StudentUsername and ca.StudentUsername <> '') or (r.regRollNo = ca.StudentRollNo and ca.StudentRollNo <> '') order by case when r.photoUrl is not null and r.photoUrl <> '' then 0 else 1 end, r.Id desc) as photoUrl from Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername or ca.CompanyUsername = rac.compEmail) order by ca.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            gvMasterApplications.DataSource = ds;
            gvMasterApplications.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblRecordsCount.Text = ds.Tables[0].Rows.Count + " Applications";
            }
            else
            {
                lblRecordsCount.Text = "0 Applications";
            }
        }
        // ==================== Search mate ====================
        void filter()
        {
            getcon();
            string query = "select ca.*, rac.compName, rac.compLogo, (select top 1 r.photoUrl from register_auth r where (r.regEmail = ca.StudentEmail and ca.StudentEmail <> '') or (r.regUsername = ca.StudentUsername and ca.StudentUsername <> '') or (r.regRollNo = ca.StudentRollNo and ca.StudentRollNo <> '') order by case when r.photoUrl is not null and r.photoUrl <> '' then 0 else 1 end, r.Id desc) as photoUrl from Company_Applications ca LEFT JOIN register_auth_company rac ON (ca.CompanyUsername = rac.compUsername or ca.CompanyUsername = rac.compEmail) where 1=1";


            if (ddlCompanyFilter.SelectedValue != "All" && ddlCompanyFilter.SelectedValue != "0" && ddlCompanyFilter.SelectedValue != "")
            {
                string comp = ddlCompanyFilter.SelectedValue.Trim();
                query = query + " and (ca.CompanyUsername = '" + comp + "' or rac.compUsername = '" + comp + "' or rac.compEmail = '" + comp + "' or rac.compName = (select top 1 c.compName from register_auth_company c where c.compUsername = '" + comp + "' or c.compEmail = '" + comp + "'))";
            }


            if (ddlStatusFilter.SelectedValue == "Selected")
            {
                query = query + " and (ca.ApplicationStatus = 'Selected' or ca.ApplicationStatus = 'Offer Accepted')";
            }
            else if (ddlStatusFilter.SelectedValue != "All" && ddlStatusFilter.SelectedValue != "")
            {
                query = query + " and ca.ApplicationStatus = '" + ddlStatusFilter.SelectedValue + "'";
            }


            string kw = txtSearch.Text.Trim();
            if (kw != "")
            {
                query = query + " and (ca.StudentName like '%" + kw + "%' or ca.StudentRollNo like '%" + kw + "%' or ca.StudentBranch like '%" + kw + "%' or ca.JobRole like '%" + kw + "%' or rac.compName like '%" + kw + "%')";
            }

            query = query + " order by ca.Id desc";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            gvMasterApplications.DataSource = ds;
            gvMasterApplications.DataBind();

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblRecordsCount.Text = ds.Tables[0].Rows.Count + " Applications";
            }
            else
            {
                lblRecordsCount.Text = "0 Applications";
            }
        }

        // ==================== drop down ma comoany na name mate  ====================
        void loadCompanies()
        {
            getcon();
            da = new SqlDataAdapter("select compUsername, compName from register_auth_company order by compName asc", con);
            ds = new DataSet();
            da.Fill(ds);
            ddlCompanyFilter.DataSource = ds;
            ddlCompanyFilter.DataTextField = "compName";
            ddlCompanyFilter.DataValueField = "compUsername";
            ddlCompanyFilter.DataBind();

            ddlCompanyFilter.Items.Insert(0, new ListItem("All Companies / Recruiters (" + ds.Tables[0].Rows.Count + ")", "All"));
        }
        void fillStats()
        {
            getcon();
            da = new SqlDataAdapter("select * from Company_Applications", con);
            ds = new DataSet();
            da.Fill(ds);

            int total = ds.Tables[0].Rows.Count;
            int shortlisted = 0;
            int interviews = 0;
            int selected = 0;

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string st = ds.Tables[0].Rows[i]["ApplicationStatus"].ToString();
                if (st == "Shortlisted")
                {
                    shortlisted++;
                }
                else if (st == "Interview Scheduled")
                {
                    interviews++;
                }
                else if (st == "Selected" || st == "Offer Accepted")
                {
                    selected++;
                }
            }
            lblKpiTotal.Text = total.ToString();
            lblKpiShortlisted.Text = shortlisted.ToString();
            lblKpiInterviews.Text = interviews.ToString();
            lblKpiSelected.Text = selected.ToString();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            filter();
        }
        protected void ddlCompanyFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            filter();
        }
        protected void ddlStatusFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            filter();
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            ddlCompanyFilter.SelectedIndex = 0;
            ddlStatusFilter.SelectedIndex = 0;
            fillgrid();
        }

        // ==================== remove karva mate stuent  ====================
        protected void gvMasterApplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("delete from Company_Applications where Id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                fillgrid();
                fillStats();
            }
        }
    }
}