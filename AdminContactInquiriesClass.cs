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

        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        // search_inquiries
        public DataSet search_inquiries(string search)
        {
            if (string.IsNullOrWhiteSpace(search))
            {
                return select_all_inquiries();
            }
            getcon();
            da = new SqlDataAdapter("SELECT * FROM contact WHERE (Name LIKE '%" + search + "%' OR Email LIKE '%" + search + "%' OR Mobile LIKE '%" + search + "%' OR Department LIKE '%" + search + "%' OR Subject LIKE '%" + search + "%' OR Message LIKE '%" + search + "%' OR CAST(Id AS VARCHAR) LIKE '%" + search + "%') ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_all_inquiries
        public DataSet select_all_inquiries()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM contact ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_inquiries_by_dept
        public DataSet select_inquiries_by_dept(string dept)
        {
            getcon();
            if (string.IsNullOrEmpty(dept) || dept == "all" || dept == "All")
            {
                da = new SqlDataAdapter("SELECT * FROM contact ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM contact WHERE Department LIKE '%" + dept + "%' ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // filter_inquiries (combines search + department)
        public DataSet filter_inquiries(string search, string dept)
        {
            getcon();
            string query = "SELECT * FROM contact WHERE 1=1";

            if (!string.IsNullOrEmpty(dept) && dept != "all" && dept != "All")
            {
                query += " AND Department LIKE '%" + dept + "%'";
            }

            if (!string.IsNullOrWhiteSpace(search))
            {
                query += " AND (Name LIKE '%" + search + "%' OR Email LIKE '%" + search + "%' OR Mobile LIKE '%" + search + "%' OR Department LIKE '%" + search + "%' OR Subject LIKE '%" + search + "%' OR Message LIKE '%" + search + "%' OR CAST(Id AS VARCHAR) LIKE '%" + search + "%')";
            }

            query += " ORDER BY Id DESC";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}
