using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class OrderSummary : System.Web.UI.Page
    {
        public int count = 0;
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
            if(!IsPostBack)
            {
                //loadOrder();
            }
            
        }

        protected void ddlOrder_SelectedIndexChanged(object sender, EventArgs e)
        {
                
                 a.DT.Clear();
                a.ExcecuteQuery("select t2.Order_no,t1.P_name,t2.Quantity,t1.P_price,t2.Total from ProductTable t1 inner join OrderTable t2 on t1.P_id=t2.P_id where t2.Order_date='" + Convert.ToDateTime(txtOrderdate.Text).Date.ToString("yyyy - MM - dd") + "' and t2.Order_no='" + ddlOrder.SelectedValue + "'");
                rptData.DataSource = a.DT;
                rptData.DataBind();
        }

        protected void txtOrderdate_TextChanged(object sender, EventArgs e)
        {
           rbAll.Checked = true;
            ddlOrder.Enabled = false;
            a.DT.Clear();
            a.ExcecuteQuery("select t2.Order_no,t1.P_name,t2.Quantity,t1.P_price,t2.Total from ProductTable t1 inner join OrderTable t2 on t1.P_id=t2.P_id where t2.Order_date='" + Convert.ToDateTime(txtOrderdate.Text).Date.ToString("yyyy - MM - dd") + "'");
            rptData.DataSource = a.DT;
            rptData.DataBind();
        }

        public void loadOrder()
        {
            a.DT.Clear();
            a.ExcecuteQuery("select Order_no from OrderTable where Order_date='" + Convert.ToDateTime(txtOrderdate.Text).Date.ToString("yyyy - MM - dd") + "'");
            ddlOrder.DataTextField = "Order_no";
            ddlOrder.DataValueField = "Order_no";
            ddlOrder.DataSource = a.DT;
             ddlOrder.DataBind();
            RemoveDuplicateItems(ddlOrder);
        }
       

        void RemoveDuplicateItems(DropDownList ddl)
        {
            for (int i = 0; i < ddl.Items.Count; i++)
            {
                ddl.SelectedIndex = i;
                string str = ddl.SelectedItem.ToString();
                for (int counter = i + 1; counter < ddl.Items.Count; counter++)
                {
                    ddl.SelectedIndex = counter;
                    string compareStr = ddl.SelectedItem.ToString();
                    if (str == compareStr)
                    {
                        ddl.Items.RemoveAt(counter);
                        counter = counter - 1;
                    }
                }
            }
        }

        
         
        protected void rbAll_CheckedChanged(object sender, EventArgs e)
        {
            ddlOrder.Enabled = false;
            a.DT.Clear();
            a.ExcecuteQuery("select t2.Order_no,t1.P_name,t2.Quantity,t1.P_price,t2.Total from ProductTable t1 inner join OrderTable t2 on t1.P_id=t2.P_id where t2.Order_date='" + Convert.ToDateTime(txtOrderdate.Text).Date.ToString("yyyy - MM - dd") + "'");
            rptData.DataSource = a.DT;
            rptData.DataBind();
        }

        protected void rbAny_CheckedChanged(object sender, EventArgs e)
        {
            ddlOrder.Enabled = true;
            loadOrder();
            a.DT.Clear();
            a.ExcecuteQuery("select t2.Order_no,t1.P_name,t2.Quantity,t1.P_price,t2.Total from ProductTable t1 inner join OrderTable t2 on t1.P_id=t2.P_id where t2.Order_date='" + Convert.ToDateTime(txtOrderdate.Text).Date.ToString("yyyy - MM - dd") + "' and t2.Order_no='" + ddlOrder.SelectedValue + "'");
            rptData.DataSource = a.DT;
            rptData.DataBind();
        }

        protected void logout(object sender, EventArgs e)
        {
            Session["User"] = null;
            Session["UserId"] = null;
            Response.Redirect("Index.aspx");
        }
    }
}