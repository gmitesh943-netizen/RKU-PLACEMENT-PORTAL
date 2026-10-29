using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RKU_PLACEMENT_PORTAL
{
    public class AdminContactInquiriesClass
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        // fillgrid 
        public DataSet select_inquiries()
        {
            getcon();
            da = new SqlDataAdapter("select * from contact order by Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Pagination
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

        //  search filter
        public DataSet search_inquiries(string nm)
        {
            getcon();
            if (string.IsNullOrWhiteSpace(nm))
            {
                da = new SqlDataAdapter("select * from contact order by Id desc", con);
            }
            else
            {
                da = new SqlDataAdapter("select * from contact where (Name like '%" + nm + "%' or Email like '%" + nm + "%' or Mobile like '%" + nm + "%' or Department like '%" + nm + "%' or Subject like '%" + nm + "%' or Message like '%" + nm + "%' or CAST(Id AS VARCHAR) like '%" + nm + "%') order by Id desc", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  department filter
        public DataSet select_inquiries_by_dept(string dept)
        {
            getcon();
            if (dept == "all" || dept == "All")
            {
                da = new SqlDataAdapter("select * from contact order by Id desc", con);
            }
            else
            {
                da = new SqlDataAdapter("select * from contact where Department = '" + dept + "' or Department like '%" + dept + "%' order by Id desc", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // Delete inquiry 
        public void delete_inquiry(int id)
        {
            getcon();
            cmd = new SqlCommand("delete from contact where Id = " + id, con);
            cmd.ExecuteNonQuery();
        }
    }
}
