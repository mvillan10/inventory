using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class CustomerDetails : System.Web.UI.Page
    {
        public int count = 0;
        DBC a = new DBC();
        DBC b = new DBC();
        DBC c = new DBC();
        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
        }

        public void bind()
        {
            b.DT.Clear();
            b.ExcecuteQuery("Select distinct t1.C_id + ' - ' + t1.C_name AS name,t1.C_name,C_addr,Bal from CustomerTable t1 inner join InvoiceTable t2 on t1.C_id + ' - ' + t1.C_name=t2.C_name");
            rptData.DataSource = b.DT;
            rptData.DataBind();
        }

        protected void rptData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal litTotal = new Literal();

                litTotal = e.Item.FindControl("litTotal") as Literal;
                string bal = DataBinder.Eval(e.Item.DataItem, "Bal").ToString();

                if (bal == "0")
                {
                    litTotal.Text = "";
                }
                else
                {
                    litTotal.Text = bal;
                }
                
                
                
               
                
            }
        }
        //protected void btnDelete_Command(object sender, CommandEventArgs e)
        //{
        //    if (e.CommandName == "Delete")
        //    {
        //        a.DT.Clear();
        //        a.ExcecuteNonQuery("Delete from CustomerTable where C_id='" + e.CommandArgument + "'");
        //        bind();
        //    }
        //}
        protected void logout(object sender, EventArgs e)
        {

        }
    }
}