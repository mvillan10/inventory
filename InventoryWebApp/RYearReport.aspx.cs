﻿using System;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class RYearReport : System.Web.UI.Page
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
            if (Request.QueryString["Year"] != null)
            {

                RYearRpt objRpt = new RYearRpt();
                crystalReport = objRpt;
                a.ExcecuteQuery("select Bill_no,Return_date,sum(0+P_sold) as price,Sum(0+P_tot) as total,Sum(0+P_tot)-sum(0+P_sold) as tax from SalesRTable where Year(Return_date)='" + Request.QueryString["Year"] + "' group by Bill_no,Return_date ");
                crystalReport.SetDataSource(a.DT);

                crystalReport.SetParameterValue("year", Request.QueryString["Year"].ToString());
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