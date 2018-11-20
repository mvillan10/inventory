using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class SearchbyDate : System.Web.UI.Page
    {
        public int count = 0;
        DBC a = new DBC();
        DBC b = new DBC();
        DBC c = new DBC();
        DBC d = new DBC();
        DBC f = new DBC();
        DBC g = new DBC();
        DBC h = new DBC();

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
            lblSale.Visible = false;
            lblReturn.Visible = false;
            lblTA.Visible = false;
            lblTA1.Visible = false;
            check();
        }

        protected void rbDRange_CheckedChanged(object sender, EventArgs e)
        {
            check();
        }

        protected void rbDate_CheckedChanged(object sender, EventArgs e)
        {
            check();

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
            btnPrint.Visible = false;
            btnPrint1.Visible = false;
            btnPrint2.Visible = false;
            btnPrint3.Visible = false;
            A1.Visible = false;
            A2.Visible = false;
            A3.Visible = false;
            A4.Visible = false;
            if (rbDRange.Checked)
            {
                datePanel.Visible = false;
                rangePanel.Visible = true;
                monthPanel.Visible = false;
                yearPanel.Visible = false;
                
            }
            else if(rbDate.Checked)
            {
                datePanel.Visible = true;
                rangePanel.Visible = false;
                monthPanel.Visible = false;
                yearPanel.Visible = false;
            }
            else if(rbMonth.Checked)
            {
                datePanel.Visible = false;
                rangePanel.Visible = false;
                monthPanel.Visible = true;
                yearPanel.Visible = false;
            }
            else if(rbYear.Checked)
            {
                datePanel.Visible = false;
                rangePanel.Visible = false;
                monthPanel.Visible = false;
                yearPanel.Visible = true;
            }
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            btnPrint.Visible = true;
            btnPrint1.Visible = false;
            btnPrint2.Visible = false;
            btnPrint3.Visible = false;
            A1.Visible = true;
            A2.Visible = false;
            A3.Visible = false;
            A4.Visible = false;
            lblSale.Visible = true;
            lblReturn.Visible = true;
            lblTA.Visible = true;
            lblTA1.Visible = true;
            a.DT.Clear();
            a.ExcecuteQuery("Select distinct Bill_no,Sales_date from SalesTable where Sales_date >= '" + txtFrom.Text + "' and Sales_date<='" + txtTo.Text + "'");
            rptData.DataSource = a.DT;
            rptData.DataBind();
            f.DT.Clear();
            f.ExcecuteQuery("select sum(0+P_tot) from SalesTable where Sales_date >= '" + txtFrom.Text + "' and Sales_date<='" + txtTo.Text + "'");
            lblSAmt.Text = f.DT.Rows[0][0].ToString();

            b.DT.Clear();
            b.ExcecuteQuery("select distinct Bill_no,Return_date from SalesRTable where Return_date >='" + txtFrom.Text + "' and Return_date<='" + txtTo.Text + "'");
            rptData1.DataSource = b.DT;
            rptData1.DataBind();
            g.DT.Clear();
            g.ExcecuteQuery("select sum(0+P_tot) from SalesRTable where Return_date >= '" + txtFrom.Text + "' and Return_date<='" + txtTo.Text + "'");
            lblRAmt.Text = g.DT.Rows[0][0].ToString();

        }
        protected void btnSearch1_ServerClick(object sender, EventArgs e)
        {
            btnPrint.Visible = false;
            btnPrint1.Visible = true;
            btnPrint2.Visible = false;
            btnPrint3.Visible = false;
            A1.Visible = false;
            A2.Visible = true;
            A3.Visible = false;
            A4.Visible = false;
            lblSale.Visible = true;
            lblReturn.Visible = true;
            lblTA.Visible = true;
            lblTA1.Visible = true;
            a.DT.Clear();
            a.ExcecuteQuery("Select distinct Bill_no,Sales_date from SalesTable where Sales_date = '" + txtDate.Text + "'");
            rptData.DataSource = a.DT;
            rptData.DataBind();
            f.DT.Clear();
            f.ExcecuteQuery("select sum(0+P_tot) from SalesTable where Sales_date = '" + txtDate.Text + "'");
            lblSAmt.Text = f.DT.Rows[0][0].ToString();

            b.DT.Clear();
            b.ExcecuteQuery("select distinct Bill_no,Return_date from SalesRTable where Return_date ='" + txtDate.Text + "'");
            rptData1.DataSource = b.DT;
            rptData1.DataBind();

            g.DT.Clear();
            g.ExcecuteQuery("select sum(0+P_tot) from SalesRTable where Return_date = '" + txtDate.Text + "'");
            lblRAmt.Text = g.DT.Rows[0][0].ToString();



        }
        protected void btnSearch2_ServerClick(object sender, EventArgs e)
        {
            btnPrint.Visible = false;
            btnPrint1.Visible = false;
            btnPrint2.Visible = true;
            btnPrint3.Visible = false;
            A1.Visible = false;
            A2.Visible = false;
            A3.Visible = true;
            A4.Visible = false;
            lblSale.Visible = true;
            lblReturn.Visible = true;
            lblTA.Visible = true;
            lblTA1.Visible = true;
            a.DT.Clear();
            a.ExcecuteQuery("Select distinct Bill_no,Sales_date from SalesTable where Month(Sales_date)= '" + ddlMonth.SelectedValue + "' and Year(Sales_date)='" + ddlYear.Text + "'");
            rptData.DataSource = a.DT;
            rptData.DataBind();
            f.DT.Clear();
            f.ExcecuteQuery("select sum(0+P_tot) from SalesTable where Month(Sales_date) = '" + ddlMonth.SelectedValue + "' and Year(Sales_date)='" + ddlYear.Text + "'");
            lblSAmt.Text = f.DT.Rows[0][0].ToString();

            b.DT.Clear();
            b.ExcecuteQuery("select distinct Bill_no,Return_date from SalesRTable where Month(Return_date) ='" + ddlMonth.SelectedValue + "' and Year(Return_date)='" + ddlYear.Text + "'");
            rptData1.DataSource = b.DT;
            rptData1.DataBind();
            g.DT.Clear();
            g.ExcecuteQuery("select sum(0+P_tot) from SalesRTable where Month(Return_date) = '" + ddlMonth.SelectedValue + "' and Year(Return_date)='" + ddlYear.Text + "'");
            lblRAmt.Text = g.DT.Rows[0][0].ToString();
        }

        protected void btnSearch3_ServerClick(object sender, EventArgs e)
        {
            btnPrint.Visible = false;
            btnPrint1.Visible = false;
            btnPrint2.Visible = false;
            btnPrint3.Visible = true;
            A1.Visible = false;
            A2.Visible = false;
            A3.Visible = false;
            A4.Visible = true;
            lblSale.Visible = true;
            lblReturn.Visible = true;
            lblTA.Visible = true;
            lblTA1.Visible = true;
            a.DT.Clear();
            a.ExcecuteQuery("Select distinct Bill_no,Sales_date from SalesTable where Year(Sales_date) = '" + ddlYr.Text + "'");
            rptData.DataSource = a.DT;
            rptData.DataBind();
            f.DT.Clear();
            f.ExcecuteQuery("select sum(0+P_tot) from SalesTable where Year(Sales_date) = '" + ddlYr.Text + "'");
            lblSAmt.Text = f.DT.Rows[0][0].ToString();

            b.DT.Clear();
            b.ExcecuteQuery("select distinct Bill_no,Return_date from SalesRTable where Year(Return_date) ='" + ddlYr.Text + "'");
            rptData1.DataSource = b.DT;
            rptData1.DataBind();
            g.DT.Clear();
            g.ExcecuteQuery("select sum(0+P_tot) from SalesRTable where Year(Return_date) = '" + ddlYr.Text + "'");
            lblRAmt.Text = g.DT.Rows[0][0].ToString();
        }

        protected void rptData1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal litCost1 = new Literal();

                litCost1 = e.Item.FindControl("litCost1") as Literal;

                string no = DataBinder.Eval(e.Item.DataItem, "Bill_no").ToString();
                c.DT.Clear();
                c.ExcecuteQuery("select sum(0+P_tot) from SalesRTable where Bill_no='" + no + "'");

                litCost1.Text = c.DT.Rows[0][0].ToString();
            }
        }

        protected void rptData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal litTotal = new Literal();
                 litTotal = e.Item.FindControl("litTotal") as Literal;

                Literal litTax = new Literal();
                 litTax = e.Item.FindControl("litTax") as Literal;

                Literal litPrice = new Literal();
                litPrice = e.Item.FindControl("litPrice") as Literal;

                string no = DataBinder.Eval(e.Item.DataItem, "Bill_no").ToString();
                d.DT.Clear();
                d.ExcecuteQuery("select sum(0+P_tot) from SalesTable where Bill_no='" + no + "'");
                litTotal.Text = d.DT.Rows[0][0].ToString();

                h.DT.Clear();
                h.ExcecuteQuery("select sum(0 + P_qty * P_price) as total from ProductTable t1 inner join SalesTable t2 on t1.P_name = t2.P_name where Bill_no = '" + no + "'");
                litPrice.Text = h.DT.Rows[0][0].ToString();

                litTax.Text = Convert.ToString(Convert.ToDouble(d.DT.Rows[0][0].ToString()) - Convert.ToDouble(h.DT.Rows[0][0].ToString()));
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