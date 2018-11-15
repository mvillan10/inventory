using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class SalesReturn : System.Web.UI.Page
    {
        public int count = 0;
        public int pno;
        public string no;
        DateTime now = DateTime.Now;
        DBC a = new DBC();
        DBC b = new DBC();
        DBC c = new DBC();
        DBC d = new DBC();
        DBC f = new DBC();
        DBC g = new DBC();
        DBC h = new DBC();
        DBC i = new DBC();
        DBC j = new DBC();
        DBC k = new DBC();
        DBC l = new DBC();
        DBC m = new DBC();
        DBC n = new DBC();
        DBC o = new DBC();
        DBC p = new DBC();
        DBC q = new DBC();
        DBC r = new DBC();
        DBC s = new DBC();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Text = now.Date.ToString("dd-MM-yyyy");
                txtNo.Text = noGen();
                clear();
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = false;
                btnReturn.Visible = false;
                btnCancel.Visible = false;

            }
        }
        public string noGen()
        {
            no = "";
            a.DT.Clear();
            no = DateTime.Now.ToString("ddMMyy-HHmmss");
            return no;
        }


        protected void btnReturn_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem i in rptData1.Items)
            {

                HiddenField hid = (HiddenField)i.FindControl("hid");
                j.DT.Clear();
                j.ExcecuteQuery("select P_unit,P_cost,P_sold from TempSRTable where P_no="+hid.Value+"");
                string unit = j.DT.Rows[0][0].ToString();
                string cost= j.DT.Rows[0][1].ToString();
                string sold= j.DT.Rows[0][2].ToString();
                o.DT.Clear();
                o.ExcecuteQuery("select P_name,P_cat from SalesTable where P_no=" + hid.Value + "");
                string name= o.DT.Rows[0][0].ToString();
                string cat= o.DT.Rows[0][1].ToString();

                o.DT.Clear();
                o.ExcecuteNonQuery("Insert into SalesRTable values('" + txtNo.Text+ "','" + txtReturn.Text + "','" + cat + "','" + name + "','" + unit + "','" +sold +"','" + cost + "','" + Convert.ToDateTime(txtDate.Text).Date.ToString("yyyy-MM-dd") + "')");
               
                p.DT.Clear();
                p.ExcecuteQuery("select P_unit from ProductTable where P_name='" + name +"'");
                string rem = Convert.ToString(Convert.ToInt32(p.DT.Rows[0][0].ToString()) + Convert.ToInt32(unit));

                m.DT.Clear();
                m.ExcecuteNonQuery("Update ProductTable set P_unit='" + rem + "' where P_name='" + name + "'");
                j.DT.Clear();
                j.ExcecuteNonQuery("delete from TempSRTable where P_no=" + hid.Value + "");
            }
            s.DT.Clear();
            s.ExcecuteQuery("select sum(0+P_tot) from SalesRTable where Bill_no='" +txtNo.Text +"'");
            string total = s.DT.Rows[0][0].ToString();

            s.DT.Clear();
            s.ExcecuteNonQuery("insert into InvoiceRTable(Bill_no,S_name,C_name,Total,Pay_type,Date) values('" + txtNo.Text + "','" + txtPer.Text + "','" + txtCus.Text + "','" + total + "','" + txtType.Text + "','"+ now.Date.ToString("yyyy-MM-dd") + "')");
            clear();
            Panel1.Visible = false;
            Panel3.Visible = false;
            Panel2.Visible = false;
            btnReturn.Visible = false;
            btnCancel.Visible = false;
            rptData.Visible = false;
            rptData1.Visible = false;
            btnPrint.Visible = true;
            btnAdd.Enabled = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            m.DT.Clear();
            m.ExcecuteNonQuery("Delete from TempSRTable");
            txtReturn.Text = "";
            clear();
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            btnReturn.Visible = false;
            btnCancel.Visible = false;
            rptData.Visible = false;
            rptData1.Visible = false;
        }

        protected void txtUnit_TextChanged(object sender, EventArgs e)
        {
            i.DT.Clear();
            i.ExcecuteQuery("Select P_qty from SalesTable where P_no=" + Session["Pno"] + "");
            if (Convert.ToInt32(txtUnit.Text) > Convert.ToInt32(i.DT.Rows[0][0].ToString()))
            {
                lblMsg.Text = "Enter valid unit";
                txtPrice.Text = "";
                txtTotal.Text = "";
                txtVat.Text = "";
            }
            else
            {
                lblMsg.Text = "";
                j.DT.Clear();
                j.ExcecuteQuery("select P_price,P_tax from ProductTable where P_name='" + txtItem.Text + "'");

                txtPrice.Text = j.DT.Rows[0][0].ToString();
                txtTotal.Text = Convert.ToString(Convert.ToDouble(j.DT.Rows[0][0].ToString()) * Convert.ToDouble(txtUnit.Text));
                txtVat.Text= Convert.ToString(Convert.ToDouble(j.DT.Rows[0][1].ToString())* Convert.ToDouble(txtUnit.Text));
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            clear();
            Response.Redirect("SalesReturn.aspx");
        }

        protected void txtReturn_TextChanged(object sender, EventArgs e)
        {
            //clear();
            q.DT.Clear();
            q.ExcecuteQuery("select S_name,C_name,Pay_type from InvoiceTable where Bill_no='" + txtReturn.Text+"'");
            if(q.DT.Rows.Count>0)
            {
                txtPer.Text = q.DT.Rows[0][0].ToString();
                txtCus.Text = q.DT.Rows[0][1].ToString();
                txtType.Text = q.DT.Rows[0][2].ToString();
                Panel1.Visible = true;
                Bind();
            }
            

        }
        public void bindTemp()
        {
            Panel3.Visible = true;
            k.DT.Clear();
            k.ExcecuteQuery("Select * from SalesTable t1 inner join TempSRTable t2 on t1.P_no=t2.P_no ");
            rptData1.DataSource = k.DT;
            rptData1.DataBind();
            if (k.DT.Rows.Count == 0)
            {
                txtRSub.Text = "";
                txtRTax.Text = "";
                txtRAmount.Text = "";

            }
            //string unit=k.DT.Rows[0][9].ToString();
            //string price = txtPrice.Text;
            r.DT.Clear();
            r.ExcecuteQuery("select sum(0+P_cost),sum(0+P_sold) from TempSRTable");
            txtRAmount.Text = r.DT.Rows[0][0].ToString();
            txtRSub.Text = r.DT.Rows[0][1].ToString();
            txtRTax.Text= Convert.ToString(Convert.ToDouble(txtRAmount.Text) - Convert.ToDouble(txtRSub.Text));


        }
        public void Bind()
        {
            Panel2.Visible = true;
            c.DT.Clear();
            c.ExcecuteQuery("Select t1.P_name,t2.Cat_name,t1.P_qty,t3.P_price,t1.P_tot,t3.P_tax,t1.P_no from ProductTable t3 inner join SalesTable t1 on t1.P_name=t3.P_name inner join CategoryTable t2 on t1.P_cat=t2.Cat_id where t1.Bill_no='" + txtReturn.Text + "'");
            rptData.DataSource = c.DT;
            rptData.DataBind();
            if (c.DT.Rows.Count == 0)
            {
                txtSub.Text = "";
                txtTax.Text = "";
                txtAmount.Text = "";
                
            }
           
            d.DT.Clear();
            d.ExcecuteQuery("select sum(0 + P_tot) from SalesTable where Bill_no='" + txtReturn.Text + "'");
            txtAmount.Text = d.DT.Rows[0][0].ToString();
            p.DT.Clear();
            p.ExcecuteQuery("select sum(0 + P_qty * P_price) as total from ProductTable t1 inner join SalesTable t2 on t1.P_name = t2.P_name where Bill_no = '" + txtReturn.Text + "'");
            txtSub.Text = p.DT.Rows[0][0].ToString();
            if(txtSub.Text!="" && txtAmount.Text!="")
            {
                txtTax.Text = Convert.ToString(Convert.ToDouble(txtAmount.Text) - Convert.ToDouble(txtSub.Text));
            }
            
        }
        public void clear()
        {
            txtCat.Text="";
            txtItem.Text="";
            txtUnit.Text = "";
            txtTotal.Text = "";
            txtSub.Text = "";
            txtTax.Text = "";
            txtAmount.Text = "";
            txtPrice.Text = "";
            txtVat.Text = "";
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            rptData.Visible = true;
            btnReturn.Visible = true;
            btnCancel.Visible = true;

            k.DT.Clear();
            k.ExcecuteQuery("select * from TempSRTable where P_no=" + Session["Pno"] + "");
            string cost = Convert.ToString(Convert.ToDouble(txtVat.Text) + Convert.ToDouble(txtTotal.Text));
            if (k.DT.Rows.Count==0)
            {
                
                l.DT.Clear();
                l.ExcecuteNonQuery("Insert into TempSRTable values(" + Session["Pno"] + ",'" + txtUnit.Text + "','" + txtTotal.Text+"','"+ cost+"')");
            }
            else
            {
                l.DT.Clear();
                l.ExcecuteNonQuery("update TempSRTable set P_unit='" + txtUnit.Text+"', P_sold='" + txtTotal.Text+"',P_cost='" +cost+"' where P_no=" + Session["Pno"] +"");
            }
            bindTemp();
            
        }

       protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            
            if (e.CommandName == "Select")
            {
                Session["Pno"] = e.CommandArgument;
                f.DT.Clear();
                f.ExcecuteQuery("select P_cat,P_name,P_qty from SalesTable where P_no=" + e.CommandArgument +"");
                
                g.DT.Clear();
                g.ExcecuteQuery("select Cat_name from CategoryTable where Cat_id='" + f.DT.Rows[0][0].ToString() +"'");

                h.DT.Clear();
                h.ExcecuteQuery("select P_price,P_tax from ProductTable where P_name='" + f.DT.Rows[0][1].ToString() + "'");
                string sold = Convert.ToString(Convert.ToDouble(f.DT.Rows[0][2].ToString()) * Convert.ToDouble(h.DT.Rows[0][0].ToString()));
                txtCat.Text = g.DT.Rows[0][0].ToString();
                txtItem.Text = f.DT.Rows[0][1].ToString();
                txtUnit.Text = f.DT.Rows[0][2].ToString();
                txtPrice.Text = h.DT.Rows[0][0].ToString();
                txtTotal.Text = sold;
                txtVat.Text = Convert.ToString(Convert.ToDouble(h.DT.Rows[0][1].ToString()) * Convert.ToDouble(txtUnit.Text));
            }
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
               
                m.DT.Clear();
                m.ExcecuteNonQuery("Delete from TempSRTable where P_no=" + e.CommandArgument + "");
                bindTemp();
            }
        }

 
        protected void txtPrice_TextChanged(object sender, EventArgs e)
        {
            txtTotal.Text = Convert.ToString(Convert.ToDouble(txtUnit.Text) * Convert.ToDouble(txtPrice.Text));
            txtVat.Text= Convert.ToString(Convert.ToDouble(txtUnit.Text) * Convert.ToDouble(txtVat.Text));
        }

       
        protected void rptData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal litTax = new Literal();

                litTax = e.Item.FindControl("litTax") as Literal;
                string tax = DataBinder.Eval(e.Item.DataItem, "P_tax").ToString();
                string qty = DataBinder.Eval(e.Item.DataItem, "P_qty").ToString();

                string ttax = Convert.ToString(Convert.ToDouble(tax) * Convert.ToDouble(qty));
                litTax.Text = ttax;
            }
        }

        protected void txtVat_TextChanged(object sender, EventArgs e)
        {
        //    txtTotal.Text = Convert.ToString(Convert.ToDouble(txtUnit.Text) * Convert.ToDouble(txtPrice.Text));
            
        }
    }
}