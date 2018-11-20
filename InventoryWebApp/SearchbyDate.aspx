<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchbyDate.aspx.cs" Inherits="InventoryWebApp.SearchbyDate" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Sales | Detailed Report</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">


    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script src="js/plugins/flot/jquery.flot.js"></script>
    <script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="js/plugins/flot/jquery.flot.symbol.js"></script>
    <script src="js/plugins/flot/jquery.flot.time.js"></script>

    <!-- Peity -->
    <script src="js/plugins/peity/jquery.peity.min.js"></script>
    <script src="js/demo/peity-demo.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <%--<script src="js/plugins/pace/pace.min.js"></script>--%>

    <!-- jQuery UI -->
    <script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- Jvectormap -->
    <script src="js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

    <!-- EayPIE -->
    <script src="js/plugins/easypiechart/jquery.easypiechart.js"></script>

    <!-- Sparkline -->
    <script src="js/plugins/sparkline/jquery.sparkline.min.js"></script>

    <!-- Sparkline demo data  -->
    <script src="js/demo/sparkline-demo.js"></script>
    <script src="js/plugins/dataTables/datatables.min.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
     <script>
    function MyPopUpWin(url, width, height) {
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
    }
        </script>

    <script>
        function MyPopUpWin1(url, width, height) {
            var from = document.getElementById("txtFrom");
            var to = document.getElementById("txtTo");
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url+'?From='+from.value+'&To='+to.value, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
    }
        </script>

    <script>
        function MyPopUpWin2(url, width, height) {
            var date = document.getElementById("txtDate");
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url+'?Date='+date.value, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
    }
        </script>

    <script>
        function MyPopUpWin3(url, width, height) {
            var month = document.getElementById("ddlMonth");
            var year = document.getElementById("ddlYear");
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url+'?Month='+month.value+'&Year='+year.value, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
    }
        </script>

    <script>
        function MyPopUpWin4(url, width, height) {
            var year = document.getElementById("ddlYr");
           
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url+'?Year='+year.value, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
    }
        </script>
</head>
 <body>
   <form id="form1" runat="server">
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            
                            <a class="dropdown-toggle" href="#">
                                    <span class="block m-t-xs font-bold"><%=Session["User"]%></span>
                                    <span class="text-muted text-xs block"><%=Session["UserId"]%> </span>
                                </a>
                            
                        </div>
                        <div class="logo-element">
                            IN+
                        </div>
                    </li>
                    <li>
                        <a href="Home.aspx"><i class="fa fa-th-large"></i><span class="nav-label">Dashboards</span> </a>

                    </li>
                    <li>
                        <a  href="Products.aspx" ><i class="fa fa-shopping-basket"></i><span class="nav-label">Products</span></a>
                    </li>
                    <li>
                        <a  href="AddOrder.aspx" ><i class="fa fa-cart-plus"></i><span class="nav-label">Order</span></a>
                    </li>
                    <li>
                        <a href="Purchase.aspx"><i class="fa fa-shopping-cart"></i><span class="nav-label">Purchase</span></a>
                    </li>
                    <li>
                        <a href="Sales.aspx"><i class="fa fa-window-restore"></i><span class="nav-label">Sales</span></a>
                    </li>
                    <li>
                        <a href="PurchaseReturn.aspx"><i class="fa fa-cart-arrow-down"></i><span class="nav-label">Return<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="PurchaseReturn.aspx">Purchase Return</a></li>
                            <li><a href="SalesReturn.aspx">Sales Return</a></li>
                        </ul>
                    </li>
                    <li>
                        <a  href="CustomerDetails.aspx" ><i class="fa fa-user-circle"></i><span class="nav-label">Customer Details</span></a>
                    </li>
                    <li>
                        <a  href="SupplierDetails.aspx" ><i class="fa fa-users"></i><span class="nav-label">Supplier Details</span></a>
                    </li>
                    <li>
                        <a  href="CreditRepay.aspx" ><i class="fa fa-credit-card"></i><span class="nav-label">Credit Repay</span></a>
                    </li>
                    <li>
                        <a  href="Expense.aspx" ><i class="fa fa-shopping-bag"></i><span class="nav-label">Other Expense</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-book"></i><span class="nav-label">Reports</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                                <li><a href="OrderSummary.aspx">Order</a></li>
                                <li><a href="PurchaseDetailReport.aspx">Purchase Detail Report</a></li>
                                <li><a href="Search.aspx">Sales Invoice</a></li>
                                <li><a href="SearchByDate.aspx">Sales Detail Report</a></li>
                        </ul>
                    </li>

                </ul>

            </div>
        </nav>

        <div id="page-wrapper1" class="gray-bg">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li>
                            <span class="m-r-sm text-muted welcome-message">Welcome to Product Dashboard.</span>
                        </li>
                       
                        <li>
                            <asp:LinkButton runat="server" ID="btnLogout" OnClick="logout">
                            <i class="fa fa-sign-out"></i>Logout</asp:LinkButton>
                        </li>

                    </ul>

                </nav>
                <div class=" col-sm">
                     <div class="ibox">
                         <div class="ibox-title text-center">
                             <h5>Sales Detailed Report</h5>
                          </div>
                          <div class="ibox-content">
                                <div class="row">
                                        <div class="col-lg-12">
                                                 <div class="form-group" >
                                                     <asp:RadioButton runat="server" ID="rbDRange" Text="Search by Date Range" CssClass="" GroupName="Option" OnCheckedChanged="rbDRange_CheckedChanged" AutoPostBack="true" Checked="true" />
                                                     <asp:RadioButton runat="server" ID="rbDate" Text="Search by Date" GroupName="Option" OnCheckedChanged="rbDate_CheckedChanged" style="margin-left:20px" AutoPostBack="true" />
                                                     <asp:RadioButton runat="server" ID="rbMonth" Text="Search by Month" GroupName="Option" OnCheckedChanged="rbMonth_CheckedChanged" style="margin-left:20px" AutoPostBack="true" />
                                                     <asp:RadioButton runat="server" ID="rbYear" Text="Search by Year" GroupName="Option" OnCheckedChanged="rbYear_CheckedChanged" style="margin-left:20px" AutoPostBack="true" />
                                                 </div>  
                                            <asp:Panel runat="server" ID="rangePanel">
                                                 <div class="form-group text-center">
                                                     <asp:Label ID="lblFrom" runat="server" Text="From:" ></asp:Label>
                                                    <asp:TextBox runat="server" ID="txtFrom" TextMode="Date"  CssClass="form-control" style="width:14% !important; display:inline-block !important"></asp:TextBox>
                                                     <asp:Label ID="lblTo" runat="server" Text="To:" ></asp:Label>
                                                    <asp:TextBox runat="server" ID="txtTo" TextMode="Date" CssClass="form-control" style="width:14% !important; display:inline-block !important"/>
                                                    <button type="button" runat="server" id="btnSearch" class="btn btn-success" onserverclick="btnSearch_ServerClick"><i class="fa fa-search"></i></button>
                                                </div> 
                                                </asp:Panel>
                                            <asp:Panel runat="server" ID="datePanel">
                                                 <div class="form-group text-center"> 
                                                    <asp:Label ID="lblDate" runat="server" Text="Date:" ></asp:Label>
                                                    <asp:TextBox runat="server" ID="txtDate" TextMode="Date" CssClass="form-control" style="width:14% !important; display:inline-block !important"/>
                                                    <button type="button" runat="server" id="btnSearch1" class="btn btn-success" onserverclick="btnSearch1_ServerClick"><i class="fa fa-search"></i></button>
                                                 </div>  
                                                </asp:Panel>
                                             <asp:Panel runat="server" ID="monthPanel">
                                                 <div class="form-group text-center"> 
                                                    <asp:Label ID="lblMonth" runat="server" Text="Month" style="margin-left:0px" ></asp:Label>
                                                    <asp:DropDownList runat="server" ID="ddlMonth" CssClass="form-control ddlht width" style="display:inline-block !important">
                                                      <asp:ListItem Text="January" Value="01"></asp:ListItem>
                                                      <asp:ListItem Text="February" Value="02"></asp:ListItem>
                                                      <asp:ListItem Text="March" Value="03"></asp:ListItem>
                                                      <asp:ListItem Text="April" Value="04"></asp:ListItem>
                                                      <asp:ListItem Text="May" Value="05"></asp:ListItem>
                                                      <asp:ListItem Text="June" Value="06"></asp:ListItem>
                                                      <asp:ListItem Text="July" Value="07"></asp:ListItem>
                                                      <asp:ListItem Text="August" Value="08"></asp:ListItem>
                                                      <asp:ListItem Text="September" Value="09"></asp:ListItem>
                                                      <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                                      <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                                      <asp:ListItem Text="December" Value="12"></asp:ListItem>
                                                     </asp:DropDownList>
                                                     <asp:Label ID="lblYear" runat="server" Text="Year" style="margin-left:0px" ></asp:Label>
                                                    <asp:DropDownList runat="server" ID="ddlYear" CssClass="form-control ddlht width" style="display:inline-block !important">
                                                      <asp:ListItem Text="2018" ></asp:ListItem>
                                                      <asp:ListItem Text="2019" ></asp:ListItem>
                                                      <asp:ListItem Text="2020" ></asp:ListItem>
                                                        <asp:ListItem Text="2021" ></asp:ListItem>
                                                      <asp:ListItem Text="2022" ></asp:ListItem>
                                                      <asp:ListItem Text="2023" ></asp:ListItem>
                                                        <asp:ListItem Text="2024" ></asp:ListItem>
                                                      <asp:ListItem Text="2025" ></asp:ListItem>
                                                      <asp:ListItem Text="2026" ></asp:ListItem>
                                                        <asp:ListItem Text="2027" ></asp:ListItem>
                                                      <asp:ListItem Text="2028" ></asp:ListItem>
                                                      <asp:ListItem Text="2029" ></asp:ListItem>
                                                        <asp:ListItem Text="2030" ></asp:ListItem>
                                                      <asp:ListItem Text="2031" ></asp:ListItem>
                                                      <asp:ListItem Text="2032" ></asp:ListItem>
                                                      
                                                     </asp:DropDownList>
                                                    <button type="button" runat="server" id="btnSearch2" class="btn btn-success" onserverclick="btnSearch2_ServerClick"><i class="fa fa-search"></i></button>
                                                 </div>  
                                                </asp:Panel>
                                            <asp:Panel runat="server" ID="yearPanel">
                                                 <div class="form-group text-center"> 
                                                    <asp:Label ID="lblYr" runat="server" Text="Year" style="margin-left:0px" ></asp:Label>
                                                    <asp:DropDownList runat="server" ID="ddlYr" CssClass="form-control ddlht width" style="display:inline-block !important">
                                                         <asp:ListItem Text="2018" ></asp:ListItem>
                                                      <asp:ListItem Text="2019" ></asp:ListItem>
                                                      <asp:ListItem Text="2020" ></asp:ListItem>
                                                        <asp:ListItem Text="2021" ></asp:ListItem>
                                                      <asp:ListItem Text="2022" ></asp:ListItem>
                                                      <asp:ListItem Text="2023" ></asp:ListItem>
                                                        <asp:ListItem Text="2024" ></asp:ListItem>
                                                      <asp:ListItem Text="2025" ></asp:ListItem>
                                                      <asp:ListItem Text="2026" ></asp:ListItem>
                                                        <asp:ListItem Text="2027" ></asp:ListItem>
                                                      <asp:ListItem Text="2028" ></asp:ListItem>
                                                      <asp:ListItem Text="2029" ></asp:ListItem>
                                                        <asp:ListItem Text="2030" ></asp:ListItem>
                                                      <asp:ListItem Text="2031" ></asp:ListItem>
                                                      <asp:ListItem Text="2032" ></asp:ListItem>
                                                        </asp:DropDownList>
                                                    <button type="button" runat="server" id="btnSearch3" class="btn btn-success" onserverclick="btnSearch3_ServerClick"><i class="fa fa-search"></i></button>
                                                </div>  
                                                </asp:Panel>
                                                                                       
                                            <div class="table-responsive">
                                                <asp:Label runat="server" ID="lblSale" ForeColor="#1c84c6" Text="Sales Details" ></asp:Label> 
                                                      <a runat="server" onclick="MyPopUpWin1('/DRangeReport.aspx',1100,600); return false;" id="btnPrint" class="btn btn-success"><i class="fa fa-print"></i>&nbsp;Print</a>
                                                    <a runat="server" onclick="MyPopUpWin2('/DateReport.aspx',1100,600); return false;" id="btnPrint1" class="btn btn-success"><i class="fa fa-print"></i>&nbsp;Print</a>
                                                      <a runat="server" onclick="MyPopUpWin3('/MonthReport.aspx',1100,600); return false;" id="btnPrint2" class="btn btn-success"><i class="fa fa-print"></i>&nbsp;Print</a>
                                                  <a runat="server" onclick="MyPopUpWin4('/YearReport.aspx',1100,600); return false;" id="btnPrint3" class="btn btn-success"><i class="fa fa-print"></i>&nbsp;Print</a>
                                                <br />
                                                <br />
                                                <asp:Repeater ID="rptData" runat="server" OnItemDataBound="rptData_ItemDataBound" >
                                                    <HeaderTemplate>
                                                        <table class="table table-striped table-hover">
                                                            <thead style="background-color: #1c84c6;color: white">
                                                                <tr class="gradeX">
                                                                   <th>No.</th>
                                                                    <th>Invoice No.</th>
                                                                    <th>Sold Price</th>
                                                                    <th>VAT</th>
                                                                     <th>Total</th>
                                                                      <th>Sales Date</th>
                                                                 </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr class="gradeX">
                                                              <td><%# ++count%></td>
                                                             <td><a onclick="MyPopUpWin('/SalesReport.aspx?InvoiceNo=<%# Eval("Bill_no")%>&Date=<%# Convert.ToDateTime(Eval("Sales_date")).Date.ToString("dd-MM-yyyy")%>',1000,600); return false;"><%# Eval("Bill_no")%></td>
                                                             <td><asp:Literal ID="litPrice" runat="server"></asp:Literal></td>
                                                            <td><asp:Literal ID="litTax" runat="server"></asp:Literal></td>
                                                            <td><asp:Literal ID="litTotal" runat="server"></asp:Literal></td>
                                                            <td><%# Convert.ToDateTime(Eval("Sales_date")).Date.ToString("dd-MM-yyyy")%></td>
                                                       </tr>
                                                   </ItemTemplate>
                                                 <FooterTemplate>
                                                        </tbody>
                       
                                            </table>
                                                     
                                              </FooterTemplate>
                                               
                                         </asp:Repeater>
                                         <div class="form-group">
                                            <asp:label runat="server" style="margin-left:603px" id="lblTA">Total Amount: </asp:label>
                                            <asp:label runat="server" ID="lblSAmt" CssClass="lbl1" />
                                        </div>
                                                 <br />
                                                 <br />
                                                <asp:Label runat="server" ID="lblReturn" ForeColor="#1c84c6" Text="Return Details" ></asp:Label>
                                                 <a runat="server" onclick="MyPopUpWin1('/RDRangeReport.aspx',1100,600); return false;" id="A1" class="btn btn-success"><i class="fa fa-print"></i>&nbsp;Print</a>
                                                    <a runat="server" onclick="MyPopUpWin2('/RDateReport.aspx',1100,600); return false;" id="A2" class="btn btn-success"><i class="fa fa-print"></i>&nbsp;Print</a>
                                                      <a runat="server" onclick="MyPopUpWin3('/RMonthReport.aspx',1100,600); return false;" id="A3" class="btn btn-success"><i class="fa fa-print"></i>&nbsp;Print</a>
                                                  <a runat="server" onclick="MyPopUpWin4('/RYearReport.aspx',1100,600); return false;" id="A4" class="btn btn-success"><i class="fa fa-print"></i>&nbsp;Print</a>
                                               <br />
                                                <br />
                                                <asp:Repeater ID="rptData1" runat="server" OnItemDataBound="rptData1_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table class="table table-striped table-hover">
                                                            <thead style="background-color: #1c84c6;color: white">
                                                                <tr class="gradeX">
                                                                   <th>No.</th>
                                                                    <th>Invoice No.</th>
                                                                     <th>Total</th>
                                                                    <th>Return Date</th>
                                                                      
                                                                 </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr class="gradeX">
                                                            
                                                              <td><%# ++count%></td>
                                                             <td><a onclick="MyPopUpWin('/SalesRReport.aspx?InvoiceNo=<%# Eval("Bill_no")%>&Date=<%# Convert.ToDateTime(Eval("Return_date")).Date.ToString("dd-MM-yyyy")%>',1000,600); return false;"><%# Eval("Bill_no")%></td>
                                                              <td><asp:Literal ID="litCost1" runat="server"></asp:Literal></td>
                                                               <td><%# Convert.ToDateTime(Eval("Return_date")).Date.ToString("dd-MM-yyyy")%></td>
                                                     </tr>
                                                   </ItemTemplate>
                                                 <FooterTemplate>
                                                        </tbody>
                       
                                            </table>
                                                     
                                              </FooterTemplate>
                                               
                                         </asp:Repeater>
                                            <div class="form-group">
                                            <asp:label runat="server" style="margin-left:426px" id="lblTA1">Total Amount : </asp:label>
                                            <asp:label runat="server" ID="lblRAmt" CssClass="lbl1" />
                                        </div>
                                     </div>
                                            
                                            
                                            </div>
                                        </div>
                                 </div>
                         </div>
                       </div>
                    </div>

                </div>
           </div> 
        
     </form>
 </body>  


</html>
