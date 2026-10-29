using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class StudentApplications : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string nm;
        string rollno;
        string email;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select a.*, c.compName, c.compLogo from Company_Applications a left join register_auth_company c on (a.CompanyUsername = c.compUsername or a.CompanyUsername = c.compEmail) where a.StudentRollNo='" + ViewState["rollno"] + "' or a.StudentEmail='" + ViewState["email"] + "' or a.StudentUsername='" + ViewState["email"] + "' order by a.Id desc", con);
            ds = new DataSet();
            da.Fill(ds);

            DataTable dt = ds.Tables[0];

            int page = Convert.ToInt32(ViewState["page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 6.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["page"] = page;
            }

            GridView1.DataSource = certificate_pagination(dt, page);
            GridView1.DataBind();

            //--------------display kare  total number of applications------------
            if (dt.Rows.Count > 0)
            {
                lblApplicationCount.Text = dt.Rows.Count + " Applications";
            }
            else
            {
                lblApplicationCount.Text = "0 Applications";
            }

            lblPages.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = page > 0;
            btnNext.Enabled = (page + 1) * 6 < dt.Rows.Count;
        }

        // Pagination method (6 records per page)
        public DataTable certificate_pagination(DataTable dt, int page)
        {
            DataTable dt2 = dt.Clone();
            int start = page * 6;
            for (int i = start; i < start + 6 && i < dt.Rows.Count; i++)
            {
                dt2.ImportRow(dt.Rows[i]);
            }
            return dt2;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student"] != null)
            {
                getcon();
                da = new SqlDataAdapter("select * from register_auth where regEmail='" + Session["student"] + "' or regUsername='" + Session["student"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    nm = ds.Tables[0].Rows[0]["regFullname"].ToString();
                    rollno = ds.Tables[0].Rows[0]["regRollNo"].ToString();
                    email = ds.Tables[0].Rows[0]["regEmail"].ToString();

                    ViewState["nm"] = nm;
                    ViewState["rollno"] = rollno;
                    ViewState["email"] = email;
                }
                else
                {
                    ViewState["rollno"] = Session["student"].ToString();
                    ViewState["email"] = Session["student"].ToString();
                }

                if (!IsPostBack)
                {
                    ViewState["page"] = 0;
                    fillgrid();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}
