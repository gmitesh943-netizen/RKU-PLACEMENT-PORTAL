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

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        // search_students
        public DataSet search_students(string nm)
        {
            if (string.IsNullOrWhiteSpace(nm))
            {
                return select_all_students();
            }
            getcon();
            da = new SqlDataAdapter("SELECT * FROM register_auth WHERE (regFullName LIKE '%" + nm + "%' OR regRollNo LIKE '%" + nm + "%' OR regEmail LIKE '%" + nm + "%' OR regMobile LIKE '%" + nm + "%' OR degree LIKE '%" + nm + "%' OR branch LIKE '%" + nm + "%' OR skills LIKE '%" + nm + "%' OR regUsername LIKE '%" + nm + "%') ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_all_students
        public DataSet select_all_students()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM register_auth ORDER BY Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        // select_students_by_branch
        public DataSet select_students_by_branch(string branch)
        {
            getcon();
            if (branch == "all" || branch == "All" || string.IsNullOrEmpty(branch))
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth ORDER BY Id DESC", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM register_auth WHERE (branch LIKE '%" + branch + "%' OR degree LIKE '%" + branch + "%') ORDER BY Id DESC", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}
