using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class Index : System.Web.UI.Page
    {
        DBC obj = new DBC();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Error"] != null)
            {
                if (Session["Error"].ToString() == "unauthorised")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You do not have permission to access this page. ')", true);
                    Session["Error"] = null;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            obj.ExcecuteQuery("select * from LoginTable where Username='" + txtUsername.Text.ToString().Trim() + "' and Password='" + txtpassword.Text.ToString().Trim() + "'");
            if (obj.DT.Rows.Count > 0)
            {
                Session["User"] = txtUsername.Text.ToString().Trim();
                Session["UserId"] = obj.DT.Rows[0][0].ToString();

                Response.Redirect("Home.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid login credentials')", true);
            }
        }
    }
}