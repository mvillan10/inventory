using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InventoryWebApp
{
    public partial class PurchaseReturn : System.Web.UI.Page
    {
        DBC a = new DBC();
        DBC a1 = new DBC();
        DBC b = new DBC();
        DBC c = new DBC();
        DBC c1 = new DBC();
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
        DBC p1 = new DBC();
        DBC q = new DBC();
        DBC r = new DBC();
        DBC s = new DBC();
        DBC t = new DBC();
        
        double stotal;

        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtInvoiceDate.Text = DateTime.Now.Date.ToString("dd-MM-yyyy");
                c.ExcecuteQuery("Select max(BillNo) from PurchaseReturnTable");
                if (c.DT.Rows[0][0].ToString().Length == 0)
                {
                    txtBillNo.Text = "1";
                }
                else
                {
                    txtBillNo.Text = (Convert.ToInt32(c.DT.Rows[0][0]) + 1).ToString();
                }

                c1.ExcecuteQuery("Select max(PR_InvoiceNo) from PurchaseRInvoiceTable");
                if (c1.DT.Rows[0][0].ToString().Length == 0)
                {
                    txtInvoiceNo.Text = "1000";
                }
                else
                {
                    txtInvoiceNo.Text = (Convert.ToInt32(c1.DT.Rows[0][0]) + 1).ToString();
                }
                s.ExcecuteQuery("Select * from SupplierTable");
                ddlSupplier.DataSource = s.DT;
                ddlSupplier.DataBind();
                ddlSupplier.DataTextField = "S_name";
                ddlSupplier.DataValueField = "S_id";
                ddlSupplier.DataBind();
                ddlSupplier.Items.Insert(0, new ListItem("<None>", "-1"));

                h.ExcecuteQuery("Select * from CategoryTable");

                ddlCategory.DataSource = h.DT;
                ddlCategory.DataBind();
                ddlCategory.DataTextField = "Cat_name";
                ddlCategory.DataValueField = "Cat_id";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("--Select--", "-1"));

                BindData();
            }
        }
        public void BindData()
        {

            a.ExcecuteQuery("Select ROW_NUMBER() over(order by t1.Item) as IndexNo, *from PurchaseReturnTable t1 inner join ProductTable t2 on t1.Item = t2.P_name where BillNo = '" + txtBillNo.Text + "'");
            Grid.DataSource = a.ds;
            Grid.DataBind();
            if (a.DT.Rows.Count != 0)
            {
                if (Convert.ToBoolean(a.DT.Rows[0][6]) == false)
                {
                    btnReturn.Visible = true;
                    btnCancel.Visible = true;
                }
                else
                {
                    btnReturn.Visible = false;
                    btnCancel.Visible = false;
                }
            }
            else
            {
                txtTotal.Text = "";
                txtSubTotal.Text = "";
            }

            b.ExcecuteQuery("select sum(0+Total) from PurchaseReturnTable where BillNo='" + txtBillNo.Text + "'");
            if (b.DT.Rows[0][0].ToString().Length != 0)
            {
                txtSubTotal.Text = b.DT.Rows[0][0].ToString();
                stotal = Convert.ToDouble(txtSubTotal.Text);
                
                txtTotal.Text = stotal.ToString();
            }
        }
        public void ReturnItemsData()
        {
            Grid2.Visible = true;
            r.ExcecuteQuery("Select ROW_NUMBER() over(order by t1.Item) as IndexNo, *from PurchaseTable t1 inner join ProductTable t2 on t1.Item = t2.P_name inner join PurchaseInvoiceTable t3 on t1.PurchaseNo = t3.P_No where t3.P_InvoiceNo = '" + txtPInvoiceNo.Text + "'");

            Grid2.DataSource = r.ds;
            Grid2.DataBind();
        }
        protected void txtBillNo_TextChanged(object sender, EventArgs e)
        {
            Grid2.Visible = false;
            a1.ExcecuteQuery("Select * from PurchaseRInvoiceTable t1 inner join SupplierTable t2 on t1.S_name=t2.S_name where PR_No='" + txtBillNo.Text + "'");
            if (a1.DT.Rows.Count != 0)
            {
                txtInvoiceNo.Text = a1.DT.Rows[0][0].ToString();
                txtDate.Text = Convert.ToDateTime(a1.DT.Rows[0][1]).Date.ToString("yyyy-MM-dd");
                
                ddlSupplier.Text = a1.DT.Rows[0][5].ToString();
            }
            BindData();
        }
        protected void Grid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            Grid.CurrentPageIndex = e.NewPageIndex;
            BindData();
        }
        protected void Grid_EditCommand(object source, DataGridCommandEventArgs e)
        {
            //Grid.EditItemIndex = e.Item.ItemIndex;


            m.ExcecuteQuery("select * from ProductTable t1 inner join CategoryTable t2 on t1.P_cat=t2.Cat_id  where Cat_name='" + e.Item.Cells[1].Text.Trim() + "'");
            ddlCategory.SelectedIndex = Convert.ToInt16(m.DT.Rows[0][2]);

            ddlItem.DataSource = m.DT;
            ddlItem.DataBind();
            ddlItem.DataTextField = "P_name";
            ddlItem.DataBind();
            ddlItem.Items.Insert(0, new ListItem("--Select--", "-1"));

            Session["Itm"] = e.Item.Cells[2].Text;
            ddlItem.Text = e.Item.Cells[2].Text.Trim();
            txtNoOfUnit.Text = e.Item.Cells[3].Text;
            txtSellingCost.Text = e.Item.Cells[4].Text;
            txtAmount.Text = e.Item.Cells[5].Text;

            //btnUpdate.Visible = true;
            //btnAdd.Visible = false;
            BindData();
        }
        protected void Grid_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            Grid.EditItemIndex = -1;
            BindData();
        }
        protected void Grid_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            string Item = e.Item.Cells[2].Text;
            d.ExcecuteNonQuery("Delete from PurchaseReturnTable where BillNo='" + txtBillNo.Text + "' and Item='" + Item + "'");

            Grid.EditItemIndex = -1;
            BindData();
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            f.ExcecuteQuery("select * from ProductTable where P_cat='" + ddlCategory.SelectedItem.Value + "'");

            ddlItem.DataSource = f.DT;
            ddlItem.DataBind();
            ddlItem.DataTextField = "P_name";
            ddlItem.DataBind();
            ddlItem.Items.Insert(0, new ListItem("--Select--", "-1"));

        }
        protected void ddlItem_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void txtNoOfUnit_TextChanged(object sender, EventArgs e)
        {
            j.ExcecuteQuery("select P_price from ProductTable where P_name='" + ddlItem.SelectedItem.Text + "'");
            txtSellingCost.Text = j.DT.Rows[0][0].ToString();
            txtAmount.Text = (Convert.ToInt32(txtNoOfUnit.Text) * Convert.ToInt32(j.DT.Rows[0][0])).ToString();
        }


        public void Clear()
        {
            ddlCategory.SelectedIndex = 0;
            ddlItem.SelectedIndex = 0;
            txtNoOfUnit.Text = "";
            txtSellingCost.Text = "";
            txtAmount.Text = "";
        }

        protected void Insert(object sender, EventArgs e)
        {
            if (txtNoOfUnit.Text != "" && txtAmount.Text != "")
            {
                l.ExcecuteQuery("Select * from PurchaseReturnTable where Category='" + ddlCategory.SelectedItem.Text + "'and Item='" + ddlItem.SelectedItem.Text + "' and BillNo='" + txtBillNo.Text + "'");
                if (l.DT.Rows.Count != 0)
                {
                    string NoOfUnit = (Convert.ToInt32(txtNoOfUnit.Text) + Convert.ToInt32(l.DT.Rows[0][3])).ToString();
                    string totalAmount = (Convert.ToInt32(txtAmount.Text) + Convert.ToInt32(l.DT.Rows[0][4])).ToString();
                    string Item = l.DT.Rows[0][2].ToString();
                    g.ExcecuteNonQuery("Update PurchaseReturnTable set Category='" + ddlCategory.SelectedItem.Text + "', Item='" + ddlItem.SelectedItem.Text + "', NoOfUnit='" + NoOfUnit + "', Total='" + totalAmount + "' where BillNo='" + txtBillNo.Text + "' and Item='" + Item + "'");
                    BindData();
                    Clear();
                }
                else
                {

                    g.ExcecuteNonQuery("Insert into PurchaseReturnTable (BillNo, Category, Item, NoOfUnit, Total, Status) values('" + txtBillNo.Text + "','" + ddlCategory.SelectedItem.Text + "','" + ddlItem.SelectedItem.Text + "','" + txtNoOfUnit.Text + "','" + txtAmount.Text + "','false')");

                    BindData();
                    Clear();
                }
            }

        }
        protected void Update(object sender, EventArgs e)
        {
            k.ExcecuteNonQuery("Update PurchaseReturnTable set Category='" + ddlCategory.SelectedItem.Text + "', Item='" + ddlItem.SelectedItem.Text + "', NoOfUnit='" + txtNoOfUnit.Text + "', Total='" + txtAmount.Text + "' where BillNo='" + txtBillNo.Text + "' and Item='" + Session["Itm"] + "'");
            BindData();
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            Clear();
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            int quantity;
            string pId;
            n.ExcecuteNonQuery("Update PurchaseReturnTable set Status='true' where BillNo='" + txtBillNo.Text + "' ");
            p.ExcecuteQuery("Select * from PurchaseReturnTable t1 inner join ProductTable t2 on t1.Item=t2.P_name where BillNo='" + txtBillNo.Text + "' ");
            for (int i = 0; i < p.DT.Rows.Count; i++)
            {
                quantity = Convert.ToInt32(p.DT.Rows[i][9]) - Convert.ToInt32(p.DT.Rows[i][3]);
                pId = p.DT.Rows[i][6].ToString();
                q.ExcecuteNonQuery("Update ProductTable set P_unit='" + quantity + "' where P_id='" + pId + "' ");
                quantity = 0;
            }
            p1.ExcecuteNonQuery("Insert into PurchaseRInvoiceTable (  PR_InvoiceNo, PR_Date, S_name, Total, PR_No) values('" + txtInvoiceNo.Text + "','" + DateTime.Now.ToString("yyyy-MM-dd hh:mm tt") + "','" + ddlSupplier.SelectedItem.Text + "','" + txtTotal.Text + "','" + txtBillNo.Text + "')");
            BindData();
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            o.ExcecuteNonQuery("Delete from PurchaseReturnTable where BillNo='" + txtBillNo.Text + "' ");
            Response.Redirect("PurchaseReturn.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            btnClear.Visible = false;
        }

        protected void txtPInvoiceNo_TextChanged(object sender, EventArgs e)
        {
            t.ExcecuteQuery("Select * from PurchaseInvoiceTable t1 inner join SupplierTable t2 on t1.S_name=t2.S_name where P_InvoiceNo='" + txtPInvoiceNo.Text + "'");
            if (t.DT.Rows.Count != 0)
            {
                txtDate.Text = Convert.ToDateTime(t.DT.Rows[0][1]).Date.ToString("yyyy-dd-MM");

                ddlSupplier.Text = t.DT.Rows[0][8].ToString();
            }
            ReturnItemsData();
        }
    }
}