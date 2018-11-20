using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class AddSupplier : System.Web.UI.Page
    {
        DBC a = new DBC();

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

        }
        public void clear()
        {
            txtName.Text = "";
            txtPhone.Text = "";
            txtAddr.Text = "";
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            a.ExcecuteNonQuery("Insert into SupplierTable (S_name, S_phone, S_address) values ('" + txtName.Text + "','" + txtPhone.Text + "','" + txtAddr.Text + "')");
            clear();
        }
    }
}