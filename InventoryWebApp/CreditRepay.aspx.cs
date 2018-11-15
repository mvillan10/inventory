using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class CreditRepay : System.Web.UI.Page
    {
        DBC a = new DBC();
        DBC b = new DBC();
        DBC c = new DBC();
        DBC d = new DBC();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadCus();
            }
            
        }
        protected void loadCus()
        {
            
            a.ExcecuteQuery("select distinct C_name,C_id from CustomerTable");
            int row = a.ds.Tables[0].Rows.Count;
            string abc = "";
            for (int i = 0; i < row; i++)
            {
                abc = abc + "<option>" + "[" + a.ds.Tables[0].Rows[i][1].ToString().Trim() + "]" + a.ds.Tables[0].Rows[i][0].ToString().Trim() + "</option>";
            }
            datalist.InnerHtml = abc;

        }
       
        protected void btnPay_Click(object sender, EventArgs e)
        {
            if (txtCredit.Text == "0")
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Balance Amount to pay')", true);

            }
            else
            {
               
                if (txtAmt.Text == "")
                {
                    txtAmt.Text = "0";
                }

                string bal = Convert.ToString(Convert.ToDouble(txtCredit.Text) - Convert.ToDouble(txtAmt.Text));
                c.DT.Clear();
                c.ExcecuteNonQuery("update CustomerTable set Bal='" +bal + "' where '[' + C_id + ']'+C_name='" + txtSearch.Text + "' ");
            }
            txtAmt.Text = "";
            txtCredit.Text = "";
            txtSearch.Text = "";
            txtAmt.Enabled = true;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtAmt.Text = "";
            txtCredit.Text = "";
            txtSearch.Text = "";
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            b.DT.Clear();
            b.ExcecuteQuery("select Bal from CustomerTable where '[' + C_id + ']'+C_name='" + txtSearch.Text + "'");
            txtCredit.Text = b.DT.Rows[0][0].ToString();
            if(b.DT.Rows.Count==1)
            {
                if (txtCredit.Text == "0")
                {
                    txtAmt.Enabled = false;
                }
                else
                {
                    txtAmt.Enabled = true;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Enter valid customer')", true);
                txtAmt.Text = "";
                txtCredit.Text = "";
                txtSearch.Text = "";
                txtAmt.Enabled = true;
            }
            
        }

    
    }
}