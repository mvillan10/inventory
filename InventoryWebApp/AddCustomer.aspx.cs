using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        DBC a = new DBC();
        DBC b = new DBC();
        DBC c = new DBC();
        public string cid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtId.Text = cidGen();
            }
        }
        public string cidGen()
        {
            cid = "";
            c.DT.Clear();
            c.ExcecuteQuery("select isnull(max(dbo.udf_GetNumeric(C_id)),0)+1 from CustomerTable");
            if (c.DT.Rows.Count > 0)
            {
                int temp = Convert.ToInt32(c.DT.Rows[0][0].ToString());
                cid = temp.ToString("000");
                cid = "C-" + cid;
                return cid;
            }
            else { return ""; }

        }
        public void clear()
        {
            txtId.Text = cidGen();
            txtName.Text = "";
            txtAddr.Text = "";
            txtPhone.Text = "";
            txtVehicle.Text = "";
            
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            a.DT.Clear();
            a.ExcecuteQuery("select * from CustomerTable where C_name='" + txtName.Text+"' and C_phone='"+txtPhone.Text +"'");
            if(a.DT.Rows.Count==1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Duplicate Entry')", true);
            }
            else
            {
                b.DT.Clear();
                b.ExcecuteNonQuery("Insert into CustomerTable(C_id,C_name,C_phone,C_addr,C_vehi,Bal) values('"+ txtId.Text +"','" + txtName.Text + "','" + txtPhone.Text + "','" +txtAddr.Text + "','" + txtVehicle.Text + "','" + 0+"')");
            }
            clear();
            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}