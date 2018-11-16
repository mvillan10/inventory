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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
            }
                
        }
        public void getData()
        {
            a.ExcecuteQuery("select COUNT(P_InvoiceNo),SUM(Total) from PurchaseInvoiceTable");
            totalPurchaseNo = a.DT.Rows[0][0].ToString();
            totalPurchaseAmount = a.DT.Rows[0][1].ToString();
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery("select COUNT(Bill_no), SUM(Total) from InvoiceTable");
            totalSalesNo = a.DT.Rows[0][0].ToString();
            totalSalesAmount = a.DT.Rows[0][1].ToString();
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery("select COUNT(distinct Order_no) from OrderTable");
            totalOrder = a.DT.Rows[0][0].ToString();
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery(" select COUNT (S_id), SUM(Balance) from SupplierTable");
            totalSuppliers = a.DT.Rows[0][0].ToString();
            totalSupCredit = a.DT.Rows[0][1].ToString();
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery("select COUNT (C_id), SUM(Bal) from CustomerTable");
            totalCustomers = a.DT.Rows[0][0].ToString();
            totalCusCredit = a.DT.Rows[0][1].ToString();
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery(" select COUNT (P_id) from ProductTable");
            totalProducts = a.DT.Rows[0][0].ToString();
            a.ds.Clear();
            a.DT.Clear();

            a.ExcecuteQuery(" select SUM (Amount) from ExpenseTable");
            totalExpense = a.DT.Rows[0][0].ToString();
            a.ds.Clear();
            a.DT.Clear();

        }

        protected void logout(object sender, EventArgs e)
        {

        }
    }
}