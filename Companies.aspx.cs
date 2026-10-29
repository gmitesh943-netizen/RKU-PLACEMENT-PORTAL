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
    public partial class Companies : System.Web.UI.Page
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
                ViewState["page"] = 0;
                fillGrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        public DataTable certificate_pagination(DataTable dt, int page)
        {
            DataTable dt2 = dt.Clone();
            int start = page * 9;
            for (int i = start; i < start + 9 && i < dt.Rows.Count; i++)
            {
                dt2.ImportRow(dt.Rows[i]);
            }
            return dt2;
        }

        void fillGrid()
        {
            filterData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ViewState["page"] = 0;
            filterData();
        }

        protected void ddlIndustry_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["page"] = 0;
            filterData();
        }

        void filterData()
        {
            getcon();

            if (txtSearch.Text != "" && ddlIndustry.SelectedValue != "")
            {
                da = new SqlDataAdapter("select * from register_auth_company where (compName like '%" + txtSearch.Text + "%' or compDescription like '%" + txtSearch.Text + "%' or compTags like '%" + txtSearch.Text + "%') and compIndustry like '%" + ddlIndustry.SelectedValue + "%' order by id desc", con);
            }
            else if (txtSearch.Text != "")
            {
                da = new SqlDataAdapter("select * from register_auth_company where compName like '%" + txtSearch.Text + "%' or compDescription like '%" + txtSearch.Text + "%' or compTags like '%" + txtSearch.Text + "%' or compIndustry like '%" + txtSearch.Text + "%' order by id desc", con);
            }
            else if (ddlIndustry.SelectedValue != "")
            {
                da = new SqlDataAdapter("select * from register_auth_company where compIndustry like '%" + ddlIndustry.SelectedValue + "%' order by id desc", con);
            }
            else
            {
                da = new SqlDataAdapter("select * from register_auth_company order by id desc", con);
            }

            ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];

            int page = Convert.ToInt32(ViewState["page"]);
            int totalPages = (int)Math.Ceiling(dt.Rows.Count / 9.0);

            if (totalPages > 0 && page >= totalPages)
            {
                page = totalPages - 1;
                ViewState["page"] = page;
            }

            DataList1.DataSource = certificate_pagination(dt, page);
            DataList1.DataBind();

            lblPages.Text = "Page " + (page + 1) + " of " + (totalPages > 0 ? totalPages : 1);

            btnPrevious.Enabled = page > 0;
            btnNext.Enabled = (page + 1) * 9 < dt.Rows.Count;
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) - 1;
            filterData();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            ViewState["page"] = Convert.ToInt32(ViewState["page"]) + 1;
            filterData();
        }
    }
}
