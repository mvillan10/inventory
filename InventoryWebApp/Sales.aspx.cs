using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class Sales : System.Web.UI.Page
    {
        DateTime now = DateTime.Now;
        DBC a = new DBC();
        DBC b = new DBC();
        DBC c = new DBC();
        DBC d = new DBC();
        DBC f = new DBC();
        DBC g = new DBC();
        DBC h = new DBC();
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
        DBC t = new DBC();
        public string no;
        public int count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Text = now.Date.ToString("dd-MM-yyyy");
                txtNo.Text = noGen();

                clear();
                loadCat();
                loadItem();
                loadCus();
                Panel1.Visible = false;
                btnSale.Visible = false;
                btnCancel.Visible = false;

            }

        }
        public void loadCus()
        {
            o.DT.Clear();
            o.ExcecuteQuery("select C_id + ' - ' + C_name AS name from CustomerTable");
            ddlCus.DataTextField = "name";
            ddlCus.DataSource = o.DT;
            ddlCus.DataBind();

        }
        public void loadCat()
        {
            a.DT.Clear();
            a.ExcecuteQuery("select * from CategoryTable");
            ddlCat.DataTextField = "Cat_name";
            ddlCat.DataValueField = "Cat_id";
            ddlCat.DataSource = a.DT;
            ddlCat.DataBind();
            loadItem();
        }
        public void loadItem()
        {
            b.DT.Clear();
            b.ExcecuteQuery("select * from ProductTable where P_cat='" + ddlCat.SelectedValue + "'");
            ddlItem.DataTextField = "P_name";
            ddlItem.DataValueField = "P_id";
            ddlItem.DataSource = b.DT;
            ddlItem.DataBind();

        }

        protected void txtUnit_TextChanged(object sender, EventArgs e)
        {
            k.DT.Clear();
            k.ExcecuteQuery("Select P_unit from ProductTable where P_id='" + ddlItem.SelectedValue + "'");
            if(Convert.ToInt32(txtUnit.Text)> Convert.ToInt32(k.DT.Rows[0][0].ToString()))
            {
                lblMsg.Text = "Enter valid unit";
                txtPrice.Text = "";
                txtTotal.Text = "";
                txtVat.Text = "";
            }
            else
            {
                lblMsg.Text = "";
                c.DT.Clear();
                c.ExcecuteQuery("select P_price,P_tax from ProductTable where P_id='" + ddlItem.SelectedValue + "'");

                txtPrice.Text = c.DT.Rows[0][0].ToString();
                txtVat.Text= Convert.ToString(Convert.ToDouble(c.DT.Rows[0][1].ToString())* Convert.ToDouble(txtUnit.Text));
                 
                string tot = Convert.ToString(Convert.ToDouble(txtUnit.Text) * Convert.ToDouble(txtPrice.Text));
                txtTotal.Text = tot;
            }
            
        }

        protected void ddlCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadItem();
            txtUnit.Text = ""; 
                     
              }
        
            
     
        protected void ddlItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtUnit.Text = "";
            
        }
        public string noGen()
        {
            no = "";
            a.DT.Clear();
            no = DateTime.Now.ToString("ddMMyy-HHmmss");
            return no;
         }
        public void Bind()
        {
            d.DT.Clear();
            d.ExcecuteQuery("Select t1.P_name,t2.Cat_name,t1.P_qty,t3.P_price,t1.P_tot,t3.P_tax,t1.P_no from ProductTable t3 inner join SalesTable t1 on t1.P_name=t3.P_name inner join CategoryTable t2 on t1.P_cat=t2.Cat_id where t1.Bill_no='" + txtNo.Text +"'");
            rptData.DataSource = d.DT;
            rptData.DataBind();
            if (d.DT.Rows.Count == 0)
            {
                txtSub.Text = "";
                txtTax.Text = "";
                txtAmount.Text = "";
                
            }


            l.DT.Clear();
            l.ExcecuteQuery("select sum(0 + P_tot) from SalesTable where Bill_no='" + txtNo.Text + "'");
            txtAmount.Text = l.DT.Rows[0][0].ToString();
            p.DT.Clear();
            p.ExcecuteQuery("select sum(0 + P_qty * P_price) as total from ProductTable t1 inner join SalesTable t2 on t1.P_name = t2.P_name where Bill_no = '" +txtNo.Text +"'");
            txtSub.Text = p.DT.Rows[0][0].ToString();

            txtTax.Text = Convert.ToString(Convert.ToDouble(txtAmount.Text) - Convert.ToDouble(txtSub.Text));
            
        }

              protected void btnAdd_Click(object sender, EventArgs e)
        {
            rptData.Visible = true;
            btnSale.Visible = true;
            btnCancel.Visible = true;
            
            f.DT.Clear();
            f.ExcecuteQuery("select P_name from ProductTable where P_id='" + ddlItem.SelectedValue + "'");
            string name = f.DT.Rows[0][0].ToString();
            g.DT.Clear();
            g.ExcecuteQuery("select P_unit from ProductTable where P_name='" + name + "'");
            string qty = Convert.ToString(Convert.ToInt32(g.DT.Rows[0][0].ToString()) - Convert.ToInt32(txtUnit.Text));
            m.DT.Clear();
            m.ExcecuteNonQuery("update ProductTable set P_unit='" + qty + "' where P_name='" +name + "'");

            string cost = Convert.ToString(Convert.ToDouble(txtTotal.Text) + Convert.ToDouble(txtVat.Text));
            g.DT.Clear();
                g.ExcecuteNonQuery("Insert into SalesTable values('" + txtNo.Text + "','" + ddlCat.SelectedValue + "','" + name + "','" + txtUnit.Text + "','" + cost + "','false','" + Convert.ToDateTime(txtDate.Text).Date.ToString("yyyy-MM-dd") + "')");
             
            if(ddlType.SelectedValue=="credit")
            {
                lblCredit.Visible = true;
                txtCredit.Visible = true;
            }
            else
            {
                lblCredit.Visible = false;
                txtCredit.Visible = false;
            }
            Panel1.Visible = true;

            Bind();
        }
                
        public void clear()
        {
            ddlCat.ClearSelection();
            ddlItem.ClearSelection();
            ddlCus.ClearSelection();
            ddlType.ClearSelection();
            txtUnit.Text = "";
            txtTotal.Text = "";
            txtSub.Text = "";
            txtTax.Text = "";
            txtAmount.Text = "";
            txtPrice.Text = "";
            txtBal.Text = "";
            txtBill.Text = "";
             txtVat.Text = "";
            txtCredit.Text = "";
            
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            clear();
            Response.Redirect("Sales.aspx");
         }

        protected void btnSale_Click(object sender, EventArgs e)
        { 

            if(txtCamt.Text!="")
            {
                h.DT.Clear();
                h.ExcecuteNonQuery("update SalesTable set Status='true' where Bill_no='" + txtNo.Text + "'");
                string bill = txtNo.Text;
                string sname = txtPer.Text;
                string cname = ddlCus.SelectedValue;
                string tot = txtAmount.Text;
                string type = ddlType.SelectedValue;
                string dis = txtBill.Text;
                string date = txtDate.Text;
                string credit = txtCredit.Text;
                
                n.DT.Clear();
                n.ExcecuteNonQuery("insert into InvoiceTable(Bill_no,S_name,C_name,Total,Pay_type,Bill_dis,Date,Credit) values('" + bill + "','" + sname + "','" + cname + "','" + tot + "','" + type + "','" + dis + "','"+ now.Date.ToString("yyyy-MM-dd") + "','"+credit +"')");
                if(type=="credit")
                {
                    
                    s.DT.Clear();
                    s.ExcecuteNonQuery("update CustomerTable set Bal=Bal+'" +Convert.ToDouble(credit) +"' where C_id + ' - ' + C_name='" + cname + "'");
                }
                
                Bind();
                btnPrint.Visible = true;
                btnCancel.Visible = false;
                btnAdd.Enabled = false;
                btnSale.Visible = false;
                rptData.Visible = true;
                Panel1.Visible = true;
                txtUnit.Text = "";
                txtVat.Text = "";
                txtTotal.Text = "";
                txtPrice.Text = "";
                ddlCat.ClearSelection();
                ddlItem.ClearSelection();
            }

            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Enter the amount paid by customer')", true);
            }
        }

        

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            k.DT.Clear();
            k.ExcecuteNonQuery("delete from SalesTable where Bill_no='" + txtNo.Text+"'");
            Response.Redirect("Sales.aspx");
        }

        protected void txtCamt_TextChanged(object sender, EventArgs e)
        {
            if(txtCamt.Text=="0")
            {
                ddlType.SelectedValue = "credit";
                lblCredit.Visible = true;
                txtCredit.Visible = true;
            }
            if (txtBill.Text == "")
            {
                txtBill.Text = "0";
            }
           
            if (Convert.ToDouble(txtCamt.Text)>Convert.ToDouble(txtAmount.Text))
            {

                    txtAmount.Text = Convert.ToString(Convert.ToDouble(txtAmount.Text) - Convert.ToDouble(txtBill.Text));
                    txtBal.Text = Convert.ToString(Convert.ToDouble(txtCamt.Text) - Convert.ToDouble(txtAmount.Text));
                    txtCredit.Text = "";
            }
            else
            {
                ddlType.SelectedValue = "credit";
                lblCredit.Visible = true;
                txtCredit.Visible = true;
                txtAmount.Text = Convert.ToString(Convert.ToDouble(txtAmount.Text) - Convert.ToDouble(txtBill.Text));
                txtCredit.Text= Convert.ToString(Convert.ToDouble(txtAmount.Text) - Convert.ToDouble(txtCamt.Text));
                txtBal.Text = "";
            }
           
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                rptData.Visible = true;
                g.DT.Clear();
                g.ExcecuteQuery("select P_name,P_qty from SalesTable where P_no=" + e.CommandArgument + "");
                string name = g.DT.Rows[0][0].ToString();
                string unit = g.DT.Rows[0][1].ToString();
                m.DT.Clear();
                m.ExcecuteQuery("select P_unit from ProductTable where P_name='" + name + "'");
                string qty = Convert.ToString(Convert.ToInt32(m.DT.Rows[0][0].ToString()) + Convert.ToInt32(unit));
                m.DT.Clear();
                m.ExcecuteNonQuery("update ProductTable set P_unit='" + qty + "' where P_name='" + name + "'");
                n.DT.Clear();
                n.ExcecuteNonQuery("Delete from SalesTable where P_no=" + e.CommandArgument + "");
                Bind();
            }
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
    }
}