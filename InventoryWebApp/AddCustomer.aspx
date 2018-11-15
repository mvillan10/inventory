<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="InventoryWebApp.AddCustomer" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Add | Customer</title>
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
    
</head>
    <body >
    <div id="page-wrapper" class="gray-bg">
        <div class="wrapper wrapper-content">
            <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <div class="ibox-content">
                                
                                <form id="form1" runat="server">
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div class="form-group" style="margin-top: 21px" >
                                                <asp:Label ID="lblId" runat="server" Text="Customer id"></asp:Label><br />
                                                 <asp:TextBox runat="server" ID="txtId" TextMode="SingleLine" CssClass="form-control width" Enabled="false" AutoPostBack="true"/>
                                                </div>
                                            <div class="form-group" style="margin-top: 21px" >
                                                <asp:Label ID="lblName" runat="server" Text="Customer Name"></asp:Label><br />
                                                 <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control widthtxt"/>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Enter a name" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblPhone" runat="server" Text="Phone No."></asp:Label><br />
                                                 <asp:TextBox runat="server" ID="txtPhone" TextMode="SingleLine" CssClass=" form-control widthtxt"/>
                                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter a valid phone no." ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>  
                                            </div>
                                             <div class="form-group">
                                                <asp:Label ID="lblAddr" runat="server" Text="Address"></asp:Label><br />
                                                 <asp:TextBox runat="server" ID="txtAddr" TextMode="MultiLine" CssClass="form-control widthtxt"/><br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddr" ErrorMessage="Enter address" ForeColor="Red"></asp:RequiredFieldValidator>
                                             </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblVehicle" runat="server" Text="Vehicle No."></asp:Label><br />
                                                 <asp:TextBox runat="server" ID="txtVehicle" TextMode="SingleLine" CssClass="form-control widthtxt"/><br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtVehicle" ErrorMessage="Enter vehicle no." ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                              <div>
                                              <asp:button  style=" margin-right:50px;" runat="server" ID="btnSave" text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />
                                          
                                              <asp:button  style="margin-right:50px" runat="server" ID="btnClear" text="Clear" CssClass="btn btn-success" OnClick="btnClear_Click" />

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
