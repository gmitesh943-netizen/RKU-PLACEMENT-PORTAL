using System;
using System.Web;

namespace RKU_PLACEMENT_PORTAL
{
    public static class AuthHelper
    {
        /// <summary>
        /// Initialise session after successful login.
        /// Stores a unified "role" key and also retains the email for display.
        /// </summary>
        public static void InitializeSession(string role, string email)
        {
            HttpContext.Current.Session["role"] = role;
            HttpContext.Current.Session["userEmail"] = email;
            // Backward compatibility keys used in existing master pages
            if (role == "admin") HttpContext.Current.Session["admin"] = email;
            if (role == "student") HttpContext.Current.Session["student"] = email;
            if (role == "company") HttpContext.Current.Session["company"] = email;
        }

        /// <summary>
        /// Returns true if a user is authenticated (role set).
        /// </summary>
        public static bool IsAuthenticated()
        {
            return HttpContext.Current.Session["role"] != null;
        }

        /// <summary>
        /// Redirects to Login.aspx if not authenticated.
        /// </summary>
        public static void RedirectIfUnauthenticated(System.Web.UI.Page page)
        {
            if (!IsAuthenticated())
            {
                page.Response.Redirect("Login.aspx");
            }
        }
    }
}
