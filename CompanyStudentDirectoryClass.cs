using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RKU_PLACEMENT_PORTAL
{
    public class CompanyStudentDirectoryClass
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["rku"].ConnectionString;

        public SqlConnection getcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        // fill grid method
        public DataSet select_students()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM register_auth ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  search filter
        public DataSet search_students(string nm)
        {
            getcon();
            if (string.IsNullOrWhiteSpace(nm))
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth WHERE (regFullName LIKE '%" + nm + "%' OR regRollNo LIKE '%" + nm + "%' OR regEmail LIKE '%" + nm + "%' OR regMobile LIKE '%" + nm + "%' OR degree LIKE '%" + nm + "%' OR branch LIKE '%" + nm + "%' OR skills LIKE '%" + nm + "%' OR regUsername LIKE '%" + nm + "%') ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //  branch filter
        public DataSet select_students_by_branch(string branch)
        {
            getcon();
            if (string.IsNullOrEmpty(branch) || branch == "all" || branch == "All")
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth WHERE (branch = '" + branch + "' OR branch LIKE '%" + branch + "%' OR degree LIKE '%" + branch + "%') ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //student details 
        public DataSet select_student_by_id(int id)
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM register_auth WHERE Id = " + id, con);
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
    }
}
