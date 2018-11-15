using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class ReportPurchase : System.Web.UI.Page
    {
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
            DBC a = new DBC();
            if (Request.QueryString["pino"] != null)
            {


                PurchaseReport objRpt = new PurchaseReport();
                crystalReport = objRpt;

                //a.ExcecuteQuery("select * from PurchaseTable t1 inner join ProductTable t2 on t1.Item=t2.P_name where t1.PurchaseNo='" + Request.QueryString["pno"].ToString() + "'");
                a.ExcecuteQuery("select* from PurchaseTable t1 inner join ProductTable t2 on t1.Item = t2.P_name inner join PurchaseInvoiceTable t3 on t1.PurchaseNo = t3.P_No where t3.P_InvoiceNo ='" + Request.QueryString["pino"].ToString() + "' ");

                crystalReport.SetDataSource(a.DT);

                crystalReport.SetParameterValue("pino", Request.QueryString["pino"].ToString());

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
