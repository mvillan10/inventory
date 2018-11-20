using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class Expense : System.Web.UI.Page
    {
        public int count = 0;
        DBC a = new DBC();
        DBC b = new DBC();

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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(txtDate.Text!="")
            {
                a.DT.Clear();
                a.ExcecuteNonQuery("insert into ExpenseTable(Details,Amount,Type,Date) values('" + txtDetails.Text + "','" + txtAmt.Text + "','" + ddlType.SelectedValue + "','" + txtDate.Text + "')");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Mention the Date')", true);
            }
            clear();
        }

        public void clear()
        {
            txtAmt.Text = "";
            txtDate.Text = "";
            txtDetails.Text = "";
            txtFrom.Text = "";
            txtTo.Text = "";
            rptData.Visible = false;
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtAmt.Text = "";
            txtDate.Text = "";
            txtDetails.Text = "";
            txtFrom.Text = "";
            txtTo.Text = "";
            rptData.Visible = false;
        }

        protected void txtTo_TextChanged(object sender, EventArgs e)
        {
            if(txtFrom.Text!="" && txtTo.Text!="")
            {
                rptData.Visible = true;
                bind();
                
            }
            else
            {
                rptData.Visible = false;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Enter the range')", true);
            }
        }
        public void bind()
        {
            rptData.Visible = true;
            b.DT.Clear();
            b.ExcecuteQuery("select * from ExpenseTable where Date>='"+ Convert.ToDateTime(txtFrom.Text).Date.ToString("yyyy-MM-dd")+ "' and Date<='" + Convert.ToDateTime(txtTo.Text).Date.ToString("yyyy-MM-dd") + "'");
            rptData.DataSource = b.DT;
            rptData.DataBind();

        }

        protected void txtFrom_TextChanged(object sender, EventArgs e)
        {
            if (txtFrom.Text != "" && txtTo.Text != "")
            {
                rptData.Visible = true;
                bind();

              
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