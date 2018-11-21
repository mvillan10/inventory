using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class Register : System.Web.UI.Page
    {
        DBC a = new DBC();
        DBC b = new DBC();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnReg_Click(object sender, EventArgs e)
        {
            a.DT.Clear();
            a.ExcecuteQuery("select * from LoginTable where Userid='" + txtUserid.Text + "' and flag='false'");
            
                if(a.DT.Rows.Count==0)
                {
                    lblUid.Text = "You cannot register with this Userid";
                    
               }
                else
                {
                    lblUid.Text = "";
                    b.ExcecuteNonQuery("Update LoginTable set Username='" + txtUsername.Text + "',Password='" + txtPassword.Text + "',flag='true' where Userid='" + txtUserid.Text + "' and flag='false'");
                    Panel1.Visible = true;
                    refresh();
            }
            
            clear();
            
        }
        public void refresh()
        {
            Response.AppendHeader("Refresh", "2;url=index.aspx");
         
        }


        public void clear()
        {
            txtUserid.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirm.Text = "";
        }
        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {
            a.DT.Clear();
            a.ExcecuteQuery("select * from LoginTable where Username='"+txtUsername.Text+"'");
            if(a.DT.Rows.Count>0)
            {
                lblUname.Text = "This username is already taken.";
            }
            else{
                lblUname.Text = "";
                
            }
        }

        protected void txtUserid_TextChanged(object sender, EventArgs e)
        {
            lblUid.Text="";
        }

       
    }
}