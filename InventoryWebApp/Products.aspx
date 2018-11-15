<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="InventoryWebApp.ProductDetails" %>





<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Product | Dashboard</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">



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
</head>

<body>
<form id="form1" runat="server">
    <div id="wrapper">
        

        <div id="page-wrapper" class="gray-bg">
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

                    <div class="row">
                        <div class="col-sm">
                            <div class=" ibox-content">            
                               
                               <a onclick="MyPopUpWin('/AddProduct.aspx',1000,600); return false;" style=""><i class="fa fa-plus"></i>&nbsp;Add Product</a>
                                
                                <a onclick="MyPopUpWin('/AddOrder.aspx',1000,600);" class="" style="margin-left: 20px"><i class="fa fa-cart-plus"></i>&nbsp;Order Now</a>
                                <a href="OrderSummary.aspx" class="" style="margin-left: 20px"><i class="fa fa-table"></i>&nbsp;Order Report</a>
                                <a onclick="MyPopUpWin('/CustomerDetails.aspx',1000,600); return false;" class="" style="margin-left: 20px"><i class="fa fa-user-circle"></i>&nbsp;Customer Details</a>
                                <a href="Search.aspx" class="" style="margin-left: 20px"><i class="fa fa-list-alt"></i>&nbsp;Invoice Report</a>
                                <a href="SearchByDate.aspx" class="" style="margin-left: 20px"><i class="fa fa-book"></i>&nbsp;Reports</a>
                                <a href="Sales.aspx" class="" style="margin-left: 20px"><i class="fa fa-window-restore"></i>&nbsp;Sales</a>
                                <a href="SalesReturn.aspx" class="" style="margin-left: 20px"><i class="fa fa-window-maximize"></i>&nbsp;Sales Return</a>
                                 <a href="Expense.aspx" class="" style="margin-left: 20px"><i class="fa fa-shopping-bag"></i>&nbsp;Other Expenses</a>
                                <a onclick="MyPopUpWin('/CreditRepay.aspx',500,500); return false;" class="" style="margin-left: 20px"><i class="fa fa-credit-card"></i>&nbsp;Credit Repay</a>
                                <br />
                            </div>
                        </div>
                        
                    </div>


                    <div class="ibox">
                        <div class="ibox-title">
                            <h5>Product Details</h5>
                            <button type="button" style="margin-left:0px" class="btn btn-toolbar" runat="server" onserverclick="refresh"><i class="fa fa-refresh"></i></button>
                        </div>
                        <div class="ibox-content">
                           
                            <div class="table-responsive">
                                <asp:Repeater ID="rptData" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-striped table-hover">
                                            <thead style="background-color: #1c84c6;color: white">
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Product_Id</th>
                                                    <th>Product Name</th>
                                                    <th>Category</th>
                                                    <th>Qty</th>
                                                    <th>Unit Price</th>
                                                    <th>VAT/unit</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <tr class="gradeX">

                                            <td><%#++count%></td>
                                           
                                            <td><a onclick="MyPopUpWin('/AddProduct.aspx?id=<%# Eval("P_id")%>',1000,600); return false;"><%# Eval("P_id")%></a></td>
                                            <td><%# Eval("P_name")%></td>
                                            <td><%# Eval("Cat_name")%></td>
                                            <td><%# Eval("P_unit")%></td> 
                                            <td><%# Eval("P_price")%></td>
                                            <td><%# Eval("P_tax")%></td>
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
</form>
    




    <!-- Mainly scripts -->

    <script>
        $(document).ready(function () {
            $('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    { extend: 'copy' },
                    { extend: 'csv' },
                    { extend: 'excel', title: 'ExampleFile' },
                    { extend: 'pdf', title: 'ExampleFile' },

                    {
                        extend: 'print',
                        customize: function (win) {
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

</body>
</html>