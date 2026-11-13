using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class PlacementStudentSelection : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["page"] = 0;
                datalist();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void datalist()
        {
            getcon();
            string q = "select * from Placed_Students where 1=1";

            string dept = ddlDepartment.SelectedValue;
            if (!string.IsNullOrEmpty(dept) && dept != "all")
            {
                if (dept == "computer")
                {
                    q += " and (Department like '%computer%' or Department like '%bca%' or Department like '%it%' or Department like '%tech%')";
                }
                else if (dept == "management")
                {
                    q += " and (Department like '%management%' or Department like '%bba%' or Department like '%mba%')";
                }
                else if (dept == "others")
                {
                    q += " and (Department not like '%computer%' and Department not like '%bca%' and Department not like '%it%' and Department not like '%management%' and Department not like '%bba%' and Department not like '%mba%')";
                }
                else
                {
                    q += " and (Department = '" + dept + "' or Department like '%" + dept + "%')";
                }
            }

            string yr = ddlYear.SelectedValue;
            if (!string.IsNullOrEmpty(yr) && yr != "all")
            {
                q += " and (PlacementYear = '" + yr + "' or PlacementYear like '%" + yr + "%')";
            }

            da = new SqlDataAdapter(q, con);
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
            else if (page < 0)
            {
                page = 0;
                ViewState["page"] = page;
            }

            DataList1.DataSource = certificate_pagination(dt, page);
            DataList1.DataBind();

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

        // Search Button
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ViewState["page"] = 0;
            datalist();
        }

        // Previous Button
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) - 1;
            datalist();
        }

        // Next Button
        protected void btnNext_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) + 1;
            datalist();
        }
    }
}
