using System;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class SalesReport : System.Web.UI.Page
    {
        DBC a = new DBC();
        private void Page_Init(object sender, EventArgs e)
        {
            GetReport();
        }

        ReportDocument crystalReport = new ReportDocument();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void GetReport()
        {
            if (Request.QueryString["InvoiceNo"] != null)
            {
                SalesRpt objRpt = new SalesRpt();
                crystalReport = objRpt;
                a.ExcecuteQuery("Select t1.P_name,t2.Cat_name,t1.P_qty,t3.P_price,t1.P_tot,t3.P_tax,t1.P_no,t4.Bill_dis from ProductTable t3 inner join SalesTable t1 on t1.P_name=t3.P_name inner join CategoryTable t2 on t1.P_cat=t2.Cat_id inner join InvoiceTable t4 on t1.Bill_no=t4.Bill_no where t1.Bill_no='" + Request.QueryString["InvoiceNo"].ToString() + "'");
                crystalReport.SetDataSource(a.DT);
                crystalReport.SetParameterValue("InvoiceNo", Request.QueryString["InvoiceNo"].ToString());
                crystalReport.SetParameterValue("Date", Request.QueryString["date"].ToString());
                CrystalReportViewer1.ReportSource = crystalReport;
            }
        }
        protected void Page_Unload(object sender, EventArgs e)
        {
            if (crystalReport != null)
            {
                crystalReport.Close();
                crystalReport.Dispose();
                GC.Collect();
                CrystalReportViewer1.Dispose();
            }
        }
    }
}