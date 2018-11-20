using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class PurchaseDetailReport1 : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {

            if (Session["User"] == null)
            {
                Session["Error"] = "unauthorised";
                Response.Redirect("Index.aspx");

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                yearPanel.Visible = false;
                monthPanel.Visible = false;
                check();
            }
        }
        protected void rbYear_CheckedChanged(object sender, EventArgs e)
        {
            check();
        }
        protected void rbMonth_CheckedChanged(object sender, EventArgs e)
        {
            check();
        }
        void check()
        {
            if (rbMonth.Checked == true)
            {
                yearPanel.Visible = false;
                monthPanel.Visible = true;
                A1.Visible = true;
                A2.Visible = false;
            }
            else
            {
                yearPanel.Visible = true;
                monthPanel.Visible = false;
                A1.Visible = false;
                A2.Visible = true;
            }
        }
        protected void logout(object sender, EventArgs e)
        {
            Session["User"] = null;
            Session["UserId"] = null;
            Response.Redirect("Index.aspx");
        }
        

    }
}
