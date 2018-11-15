<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderSummary.aspx.cs" Inherits="InventoryWebApp.OrderSummary" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Order | Summary</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/steps/jquery.steps.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <link href="plugins/dataTables/datatables.min.css" rel="stylesheet" />
    <script src="js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
    <script src="js/plugins/dataTables/datatables.min.js"></script>
 
    <script src="js/plugins/steps/jquery.steps.min.js"></script>
   
    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
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



    <div id="page-wrapper" class="gray-bg">
       
          <div class="wrapper wrapper-content">
           
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <div class="ibox-title text-center">
                                <h5>Order Summary Report</h5>
                            </div>
                            <div class="ibox-content">   
                                <form id="form1" runat="server">
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
                                       

                                  
                                </form>
                              
                            </div>
                        </div>
                    </div>

                </div>
           </div> 
        </div>
        

 </body>  


</html>

