using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RKU_PLACEMENT_PORTAL
{
    public partial class About : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
                datalist();
                datalistSuccess();
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
            da = new SqlDataAdapter("select * from Placement_Team", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        void datalistSuccess()
        {
            getcon();
            da = new SqlDataAdapter("select * from Success_Stories", con);
            ds = new DataSet();
            da.Fill(ds);
            DataListSuccess.DataSource = ds;
            DataListSuccess.DataBind();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int index = e.Item.ItemIndex;
                if (index == 0)
                {
                    e.Item.CssClass = "placement-featured";
                }
                else
                {
                    e.Item.CssClass = "placement-member member-" + index;
                }
            }
        }
    }
}