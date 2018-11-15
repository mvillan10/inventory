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
    public partial class SalesRReport : System.Web.UI.Page
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
                SalesRRpt objRpt = new SalesRRpt();
                crystalReport = objRpt;
                a.ExcecuteQuery("select * from  SalesRTable where Bill_no='" + Request.QueryString["InvoiceNo"].ToString() + "'");
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