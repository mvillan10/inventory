using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class Search : System.Web.UI.Page
    {
        public int count = 0;
        DateTime now = DateTime.Now;
        DBC a = new DBC();
        DBC b = new DBC();
        DBC c = new DBC();
        DBC d = new DBC();
        DBC f = new DBC();
        DBC g = new DBC();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            Panel1.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            a.DT.Clear();
            a.ExcecuteQuery("Select t1.P_name,t1.P_qty,t3.P_price,t1.P_tot,t3.P_tax,t1.Sales_date from ProductTable t3 inner join SalesTable t1 on t1.P_name=t3.P_name inner join CategoryTable t2 on t1.P_cat=t2.Cat_id where t1.Bill_no='" + txtNo.Text + "'");
            if (a.DT.Rows.Count > 0)
            {
                btnPrint.Visible = true;
                btnPrint1.Visible = false;
                rptData.Visible = true;
                rptData1.Visible = false;

                Panel1.Visible = true;
                lblMsg.Text = "";

                rptData.DataSource = a.DT;
                rptData.DataBind();
                txtDate.Text = Convert.ToDateTime(a.DT.Rows[0][5].ToString()).Date.ToString("dd-MM-yyyy");

                b.ExcecuteQuery("select sum(0 + P_tot) from SalesTable where Bill_no='" + txtNo.Text + "'");

                txtAmount.Text = b.DT.Rows[0][0].ToString();
                c.DT.Clear();
                c.ExcecuteQuery("select sum(0 + P_qty * P_price) as total from ProductTable t1 inner join SalesTable t2 on t1.P_name = t2.P_name where Bill_no = '" + txtNo.Text + "'");
                txtSub.Text = c.DT.Rows[0][0].ToString();

                txtTax.Text = Convert.ToString(Convert.ToDouble(txtAmount.Text) - Convert.ToDouble(txtSub.Text));

            }
            else
            {

                d.DT.Clear();
                d.ExcecuteQuery("select * from SalesRTable t1 inner join CategoryTable t2 on t1.P_cat=t2.Cat_id where t1.Bill_no='" + txtNo.Text + "'");
                if (d.DT.Rows.Count > 0)
                {
                    btnPrint.Visible = false;
                    btnPrint1.Visible = true;
                    rptData1.Visible = true;
                    rptData.Visible = false;
                    Panel1.Visible = true;
                    lblMsg.Text = "";

                    rptData1.DataSource = d.DT;
                    rptData1.DataBind();
                    txtDate.Text = Convert.ToDateTime(d.DT.Rows[0][7].ToString()).Date.ToString("dd-MM-yyyy");

                    f.ExcecuteQuery("select sum(0 + P_tot),sum(0+P_sold) from SalesRTable where Bill_no='" + txtNo.Text + "'");
                    txtAmount.Text = f.DT.Rows[0][0].ToString();
                    txtSub.Text = f.DT.Rows[0][1].ToString();
                    txtTax.Text = Convert.ToString(Convert.ToDouble(txtAmount.Text) - Convert.ToDouble(txtSub.Text));
                }
                else
                {
                    lblMsg.Text = "Enter a valid Invoice No.";

                    rptData.Visible = false;
                    rptData1.Visible = false;
                    Panel1.Visible = false;
                    btnPrint.Visible = false;
                    btnPrint1.Visible = false;

                }
            }

        }

        protected void rptData1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal litPrice = new Literal();
                Literal litTax1 = new Literal();
                litPrice = e.Item.FindControl("litPrice") as Literal;
                litTax1 = e.Item.FindControl("litTax1") as Literal;
                string total = DataBinder.Eval(e.Item.DataItem, "P_tot").ToString();
                string sold = DataBinder.Eval(e.Item.DataItem, "P_sold").ToString();
                string qty = DataBinder.Eval(e.Item.DataItem, "P_qty").ToString();
                string price = Convert.ToString(Convert.ToDouble(sold) / Convert.ToDouble(qty));
                string tax = Convert.ToString(Convert.ToDouble(total) - Convert.ToDouble(sold));

                litPrice.Text = price;
                litTax1.Text = tax;
            }
        }

        protected void rptData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal litTax = new Literal();
                Literal litTot = new Literal();
                litTax = e.Item.FindControl("litTax") as Literal;
                litTot = e.Item.FindControl("litTot") as Literal;
                string price = DataBinder.Eval(e.Item.DataItem, "P_price").ToString();
                string qty = DataBinder.Eval(e.Item.DataItem, "P_qty").ToString();
                string tax = DataBinder.Eval(e.Item.DataItem, "P_tax").ToString();
                string tot = Convert.ToString(Convert.ToDouble(price) * Convert.ToDouble(qty));
                string ttax = Convert.ToString(Convert.ToDouble(tax) * Convert.ToDouble(qty));

                litTax.Text = ttax;
                litTot.Text = tot;
            }
        }
    }
}