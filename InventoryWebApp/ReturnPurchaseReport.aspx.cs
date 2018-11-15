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
    public partial class ReturnPurchaseReport : System.Web.UI.Page
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
                //int ID = 0;

                //int len = Request.QueryString["ID"].ToString().Split('-').Length;
                //if (len > 1) //if the input is OrderNumber
                //{ ID = Convert.ToInt32(BAL.Common.GetScalarBySQLQuery("select ID from OrderSummary where OrderNo='" + Request.QueryString["ID"].ToString() + "'")); }
                //else
                //{ ID = Convert.ToInt32(Request.QueryString["ID"].ToString()); }

                PurchaseReturnReport objRpt = new PurchaseReturnReport();
                crystalReport = objRpt;
                
                a.ExcecuteQuery("select* from PurchaseReturnTable t1 inner join ProductTable t2 on t1.Item = t2.P_name inner join PurchaseRInvoiceTable t3 on t1.BillNo = t3.PR_No where t3.PR_InvoiceNo ='" + Request.QueryString["pino"].ToString() + "' ");

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