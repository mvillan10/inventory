using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class Home : System.Web.UI.Page
    {
        DBC a = new DBC();
        public string totalPurchaseNo;
        public string totalPurchaseAmount;
        public string totalSalesNo;
        public string totalSalesAmount;
        public string totalOrder;
        public string totalSuppliers;
        public string totalCustomers;
        public string totalProducts;
        public string totalExpense;
        public string totalCusCredit;
        public string totalSupCredit;

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
                getData();
                getDailyData();
            }
                
        }
        public void getData()
        {

            a.ExcecuteQuery("select COUNT(distinct Order_no) from OrderTable");
            totalOrder = a.DT.Rows[0][0].ToString();
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery(" select COUNT (S_id), SUM(Balance) from SupplierTable");
            totalSuppliers = a.DT.Rows[0][0].ToString();
            if (a.DT.Rows[0][1].ToString()!= "")
            {
                totalSupCredit = a.DT.Rows[0][1].ToString();
            }
            else
            {
                totalSupCredit = "0";
            }
            
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery("select COUNT (C_id), SUM(Bal) from CustomerTable");
            totalCustomers = a.DT.Rows[0][0].ToString();
            if (a.DT.Rows[0][1].ToString() != "")
            {
                totalCusCredit = a.DT.Rows[0][1].ToString();
            }
            else
            {
                totalCusCredit = "0";
            }
            
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery(" select COUNT (P_id) from ProductTable");
            totalProducts = a.DT.Rows[0][0].ToString();
            a.ds.Clear();
            a.DT.Clear();
            

        }
        public void getDailyData()
        {
            a.ExcecuteQuery("select COUNT(P_InvoiceNo),SUM(Total) from PurchaseInvoiceTable where day(P_Date)='" + DateTime.Now.Day + "' and month(P_Date)='" + DateTime.Now.Month + "' and year(P_Date)='" + DateTime.Now.Year + "' ");
            totalPurchaseNo = a.DT.Rows[0][0].ToString();
            if (a.DT.Rows[0][1].ToString() != "")
            {
                totalPurchaseAmount = a.DT.Rows[0][1].ToString();
            }
            else
            {
                totalPurchaseAmount = "0";
            }
      
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery("select COUNT(Bill_no), SUM(Total) from InvoiceTable where Date='" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "'");
            totalSalesNo = a.DT.Rows[0][0].ToString();
            if (a.DT.Rows[0][1].ToString() != "")
            {
                totalSalesAmount = a.DT.Rows[0][1].ToString();
            }
            else
            {
                totalSalesAmount = "0";
            }
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery(" select SUM (Amount) from ExpenseTable where Date='" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "'");
            if (a.DT.Rows[0][0].ToString()!= "")
            {
                totalExpense = a.DT.Rows[0][0].ToString();
            }
            else
            {
                totalExpense = "0";
            }
            a.ds.Clear();
            a.DT.Clear();
        }
        public void getMonthlyData()
        {
            a.ExcecuteQuery("select COUNT(P_InvoiceNo),SUM(Total) from PurchaseInvoiceTable where month(P_Date)='" + DateTime.Now.Month + "'");
            totalPurchaseNo = a.DT.Rows[0][0].ToString();
            if (a.DT.Rows[0][1].ToString() != "")
            {
                totalPurchaseAmount = a.DT.Rows[0][1].ToString();
            }
            else
            {
                totalPurchaseAmount = "0";
            }
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery("select COUNT(Bill_no), SUM(Total) from InvoiceTable where month(Date)='" + DateTime.Now.Date.Month + "'");
            totalSalesNo = a.DT.Rows[0][0].ToString();
            if (a.DT.Rows[0][1].ToString() != "")
            {
                totalSalesAmount = a.DT.Rows[0][1].ToString();
            }
            else
            {
                totalSalesAmount = "0";
            }
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery(" select SUM (Amount) from ExpenseTable where month(Date)='" + DateTime.Now.Date.Month + "'");
            if (a.DT.Rows[0][0].ToString() != "")
            {
                totalExpense = a.DT.Rows[0][0].ToString();
            }
            else
            {
                totalExpense = "0";
            }
            a.ds.Clear();
            a.DT.Clear();
        }
        public void getYearlyData()
        {
            a.ExcecuteQuery("select COUNT(P_InvoiceNo),SUM(Total) from PurchaseInvoiceTable where year(P_Date)='" + DateTime.Now.Date.Year + "'");
            totalPurchaseNo = a.DT.Rows[0][0].ToString();
            if (a.DT.Rows[0][1].ToString() != "")
            {
                totalPurchaseAmount = a.DT.Rows[0][1].ToString();
            }
            else
            {
                totalPurchaseAmount = "0";
            }
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery("select COUNT(Bill_no), SUM(Total) from InvoiceTable where year(Date)='" + DateTime.Now.Year + "'");
            totalSalesNo = a.DT.Rows[0][0].ToString();
            if (a.DT.Rows[0][1].ToString() != "")
            {
                totalSalesAmount = a.DT.Rows[0][1].ToString();
            }
            else
            {
                totalSalesAmount = "0";
            }
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery(" select SUM (Amount) from ExpenseTable where year(Date)='" + DateTime.Now.Year + "'");
            if (a.DT.Rows[0][0].ToString() != "")
            {
                totalExpense = a.DT.Rows[0][0].ToString();
            }
            else
            {
                totalExpense = "0";
            }
            a.ds.Clear();
            a.DT.Clear();
        }
        protected void btnDay_Click(object sender, EventArgs e)
        {
            getData();
            getDailyData();
            
        }
        protected void btnMonth_Click(object sender, EventArgs e)
        {
            getData();
            getMonthlyData();
        }
        protected void btnYear_Click(object sender, EventArgs e)
        {
            getData();
            getYearlyData();
        }
        protected void logout(object sender, EventArgs e)
        {
            Session["User"] = null;
            Session["UserId"] = null;
            Response.Redirect("Index.aspx");
        }
    }
}