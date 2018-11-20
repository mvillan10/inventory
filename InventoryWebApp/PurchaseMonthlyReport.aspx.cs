using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace InventoryWebApp
{
    public partial class PurchaseMonthlyReport : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            GetReport();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        ReportDocument crystalReport = new ReportDocument();

        private void GetReport()
        {
            DBC a = new DBC();
            if (Request.QueryString["month"] != null && Request.QueryString["year"] != null)
            {

                int month = Convert.ToInt32(Request.QueryString["Month"]);
                string mnth = DateTimeFormatInfo.CurrentInfo.GetMonthName(month);
                PurchaseDetailReport objRpt = new PurchaseDetailReport();
                crystalReport = objRpt;

                a.ExcecuteQuery("Select * from PurchaseInvoiceTable where month(P_Date)='" + Request.QueryString["month"].ToString() + "' and year(P_Date)='" + Request.QueryString["year"].ToString() + "'");

                crystalReport.SetDataSource(a.DT);

                crystalReport.SetParameterValue("year", Request.QueryString["year"].ToString());

                crystalReport.SetParameterValue("month", mnth);

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