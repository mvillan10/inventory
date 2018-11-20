<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderSummary.aspx.cs" Inherits="InventoryWebApp.OrderSummary" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Order | Report</title>
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
        $(document).ready(function(){
            $('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    { extend: 'copy'},
                    {extend: 'csv'},
                    {extend: 'excel', title: 'ExampleFile'},
                    {extend: 'pdf', title: 'ExampleFile'},

                    {extend: 'print',
                     customize: function (win){
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');

                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                    }
                    }
                ]

            });

        });

    </script>
    <script>
        function MyPopUpWin(url, width, height) {
            var date = document.getElementById("txtOrderdate");
            var orderno = document.getElementById("ddlOrder");
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url+'?Orderno='+orderno.value+'&date='+date.value, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
    }
        </script>
</head>

<body class="">
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
                                <h5>Order Summary Report</h5>
                            </div>
                            <div class="ibox-content"> 
                                   <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group" style="margin-top: 21px" > 
                                                <asp:Label ID="lblOrderdate" runat="server" Text="Order Date"></asp:Label>
                                                <asp:RadioButton ID="rbAll" runat="server" Text="Show All" GroupName="Option" style="margin-left:100px" Autopostback="true" OnCheckedChanged="rbAll_CheckedChanged"/>
                                                 <asp:RadioButton ID="rbAny" runat="server" GroupName="Option" style="margin-left:30px" AutoPostBack="true" OnCheckedChanged="rbAny_CheckedChanged"/>
                                                  <asp:Label ID="lblOrder" runat="server" Text="Order No." style="margin-left:6px"></asp:Label>
                                                <br />
                                                 <p style="display:flex;">
                                                      <asp:TextBox runat="server" ID="txtOrderdate" CssClass="form-control" style="width:14%" OnTextChanged="txtOrderdate_TextChanged" AutoPostBack="true" TextMode="Date"/><br />
                                                      
                                                       <asp:DropDownList ID="ddlOrder" runat="server" CssClass="form-control ddlht" style="margin-left:135px;width:65px" OnSelectedIndexChanged="ddlOrder_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                       <%--<asp:button runat="server" class="btn btn-primary" style="margin-left:47px" Text="Report"></asp:button> --%>
                                                       <a onclick="MyPopUpWin('/Report.aspx',1000,600); return false;" runat="server" class="btn btn-success" style="margin-left:47px">Report</a>
                                
                                                 </p><br />
                                                 <asp:RequiredFieldValidator ID="required" runat="server" ControlToValidate="txtOrderdate" ErrorMessage="Enter a Date" ForeColor="Red" />
                                                <asp:CompareValidator id="dateValidator" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtOrderdate" ErrorMessage="Please enter a valid date" style="margin-left:-80px" ForeColor="Red"></asp:CompareValidator>
                                                    
                                             </div>           
                                             <div class="table-responsive">
                                                <asp:Repeater ID="rptData" runat="server">
                                                    <HeaderTemplate>
                                                        <table class="table table-striped table-hover dataTables-example">
                                                            <thead style="background-color: #1c84c6;color: white">
                                                                <tr>
                                                                    
                                                                    <th>No.</th>
                                                                    <th>Order No.</th>
                                                                    <th>Product Name</th>
                                                                    <th>Qty</th>
                                                                     <th>Unit Price</th>
                                                                     <th>Total Amount</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                   </HeaderTemplate>
                                                   <ItemTemplate>
                                                        <tr class="gradeX">
                                                            <td><%# ++count%></td>
                                                             <td><%# Eval("Order_no") %></td>
                                                             <td><%# Eval("P_name")%></td>
                                                             <td><%# Eval("Quantity")%></td>
                                                             <td><%# Eval("P_price")%></td>
                                                            <td><%# Eval("Total")%></td>
                                                             

                                                            
                                                       </tr>
                                                   </ItemTemplate>

                                    <FooterTemplate>
                                        </tbody>
                       
                                </table>
                                        
                                        </FooterTemplate>
                                                    
                                </asp:Repeater>
                                    
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

