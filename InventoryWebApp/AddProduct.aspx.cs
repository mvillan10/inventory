using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class AddProduct : System.Web.UI.Page
    {
        string pid;
        string pname;
        string pcat;
        string nou;
        string price;
        string tax;
        DBC a = new DBC();
        DBC b = new DBC();
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
            if (!IsPostBack)
            {


                if (Request.QueryString["id"] != null)
                {
                    lblNew.Text = "Edit Product";
                    btnSave.Text = "Update";
                    txtPid.Text = Request.QueryString["id"].ToString();
                    loadCat();
                    
                    b.ExcecuteQuery("select P_name,P_unit,P_price ,P_cat,P_tax from ProductTable where P_id='" + Request.QueryString["id"]+ "'");
                    txtPname.Text = b.DT.Rows[0][0].ToString();
                    ddlPcat.Text = b.DT.Rows[0][3].ToString();
                    txtPnou.Text = b.DT.Rows[0][1].ToString();
                    txtPrice.Text = b.DT.Rows[0][2].ToString();
                    txtTax.Text = b.DT.Rows[0][4].ToString();                   
                    txtPid.Enabled = false;
                    txtPnou.Enabled = false;
                    
                    btnClear.Visible = false;
                    btnDelete.Visible = true;
                   
                }
                else
                {
                    txtPid.Text = pidGen();
                    loadCat();
                    btnDelete.Visible = false;
                }


            }

        }
        public string pidGen()
        {
            pid = "";
            a.DT.Clear();
            a.ExcecuteQuery("select isnull(max(dbo.udf_GetNumeric(P_id)),0)+1 from ProductTable");
            if (a.DT.Rows.Count > 0)
            {
                int temp = Convert.ToInt32(a.DT.Rows[0][0].ToString());
                pid = temp.ToString("000");
                pid = "PRO-" + pid;
                return pid;
            }
            else { return ""; }

        }
        public void clear()
        {
            txtPid.Text = pidGen();
            txtPname.Text = "";
            txtPnou.Text = "";
            txtPrice.Text = "";
            txtTax.Text = "";
            ddlPcat.ClearSelection();

        }

        public void loadCat()
        {
            a.DT.Clear();
            a.ExcecuteQuery("select * from CategoryTable");
            ddlPcat.DataSource = a.DT;
            ddlPcat.DataBind();
            ddlPcat.DataTextField = "Cat_name";
            ddlPcat.DataValueField = "Cat_id";
            ddlPcat.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            if (Request.QueryString["id"] != null)
            {
                pname = txtPname.Text;
                pcat = ddlPcat.SelectedValue;
                nou = txtPnou.Text;
                price = txtPrice.Text;
                tax = txtTax.Text;
                a.DT.Clear();
                a.ExcecuteNonQuery("update ProductTable set P_name='" + pname + "',P_cat='" + pcat + "',P_price='" + price + "',P_tax='" +tax +"' where P_id='" + Request.QueryString["id"] + "'");

            }
            else
            {
                pname = txtPname.Text;
                pcat = ddlPcat.SelectedValue;
                nou = txtPnou.Text;
                price = txtPrice.Text;
                tax = txtTax.Text;
                a.DT.Clear();
                a.ExcecuteNonQuery("Insert into ProductTable(P_id,P_name,P_cat,P_unit,P_price,P_tax) values('" + txtPid.Text.ToString().Trim() + "','" + pname + "','" + pcat + "','" + nou + "','" + price + "','"+ tax+ "')");
                clear();
            }


        }
        protected void addCat(object sender, EventArgs e)
        {
            btnAddcat.Visible = false;
            txtAddcat.Visible = true;
            btnAddcat2.Visible = true;
        }


        protected void addCat2(object sender, EventArgs e)
        {
            a.DT.Clear();
            //a.ExcecuteQuery("select isnull(max(Cat_id),0)+1 from CategoryTable");
            a.ExcecuteNonQuery("insert into CategoryTable values('" + txtAddcat.Text.ToString().Trim() + "')");
            btnAddcat2.Visible = false;
            btnAddcat.Visible = true;
            txtAddcat.Visible = false;

            loadCat();
        }


        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                /*this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked YES!')", true);*/
                a.DT.Clear();
                a.ExcecuteNonQuery("Delete from ProductTable where P_id='" + Request.QueryString["id"] + "'");
            }
            
            clear();
            txtPid.Text = "";
            btnDelete.Visible = false;
            btnSave.Visible = false;
        }
    }
}