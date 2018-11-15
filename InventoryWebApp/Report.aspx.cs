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
    public partial class Report : System.Web.UI.Page
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
            if (Request.QueryString["Orderno"] != null)
            {
                //int ID = 0;

                //int len = Request.QueryString["ID"].ToString().Split('-').Length;
                //if (len > 1) //if the input is OrderNumber
                //{ ID = Convert.ToInt32(BAL.Common.GetScalarBySQLQuery("select ID from OrderSummary where OrderNo='" + Request.QueryString["ID"].ToString() + "'")); }
                //else
                //{ ID = Convert.ToInt32(Request.QueryString["ID"].ToString()); }
                 OrderRpt objRpt = new OrderRpt();
                crystalReport = objRpt;
                a.ExcecuteQuery("select * from OrderTable t1 inner join ProductTable t2 on t1.P_id=t2.P_id where t1.Order_no='" + Request.QueryString["Orderno"].ToString() + "'");
                crystalReport.SetDataSource(a.DT);
                crystalReport.SetParameterValue("OrderNo", Request.QueryString["Orderno"].ToString());
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