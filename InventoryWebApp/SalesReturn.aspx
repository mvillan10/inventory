<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesReturn.aspx.cs" Inherits="InventoryWebApp.SalesReturn" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Sales | Return</title>
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
            var date = document.getElementById("txtDate");
            var no = document.getElementById("txtNo");
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url+'?InvoiceNo='+no.value+'&Date='+date.value, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
    }
        </script>
    
</head>
 <body>
<form id="form1" runat="server">
    <div id="page-wrapper" class="gray-bg">
        <div class="wrapper wrapper-content">
           <div class="row">
                <div class="col-lg-12">
                     <div class="ibox">
                         <div class="ibox-title text-center">
                             <h5>Sales Return Details</h5>
                          </div>
                          <div class="ibox-content">
                                <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group" >
                                                 <asp:Label ID="lblNo" runat="server" Text="Invoice No."></asp:Label>
                                                <asp:TextBox runat="server" ID="txtNo" TextMode="SingleLine" CssClass="form-control" style="width:134px !important; display:inline-block !important" Enabled="false"/>

                                                <asp:Label ID="lblDate" runat="server" Text="Date:" style="margin-left:610px" ></asp:Label>
                                               <asp:TextBox runat="server" ID="txtDate" TextMode="SingleLine" CssClass="form-control" style="width:120px !important; display:inline-block !important"/>
                                                <asp:Button ID="btnNew" runat="server" Onclick="btnNew_Click" Text="New" CssClass="btn btn-success" />
                                                <a runat="server" onclick="MyPopUpWin('/SalesRReport.aspx',1100,600); return false;" id="btnPrint" class="btn btn-success" visible="false"><i class="fa fa-print"></i>&nbsp;Print</a>
                                            </div>  
                                       <br /><br />
                                            <div class="form-group">
                                                <asp:Label ID="lblReturn" runat="server" Text="Return Invoice No."></asp:Label>
                                                <asp:TextBox runat="server" ID="txtReturn" TextMode="SingleLine" CssClass="form-control" style="width:134px !important; display:inline-block !important" OnTextChanged="txtReturn_TextChanged" AutoPostBack="true"/>
                                            </div>
                                            <asp:Panel runat="server" ID="Panel1">
                                            <div class="form-group">
                                                <asp:Label ID="lblType" runat="server" Text="Payment Type" ></asp:Label>
                                                <asp:Label ID="lblPer" runat="server" Text="Sales Person" style="margin-left:120px"></asp:Label>
                                                <asp:Label ID="lblCus" runat="server" Text="Customer Name" style="margin-left:129px" ></asp:Label>
                                                 <p style="display:flex">
                                                     <asp:TextBox runat="server" ID="txtType" TextMode="SingleLine" Enabled="false" CssClass="form-control width" style="display:inline-block !important"/>
                                                     <asp:TextBox runat="server" ID="txtPer" TextMode="SingleLine" Enabled="false" CssClass="form-control width" style="display:inline-block !important;margin-left:20px" />
                                                <asp:TextBox runat="server" ID="txtCus" TextMode="SingleLine" Enabled="false" CssClass="form-control width" style="display:inline-block !important;margin-left:20px"/>
                                                </p>
                                             </div>
                                            </asp:Panel><br />
                                            <div class="form-group">
                                                 <asp:Label ID="lblCat" runat="server" Text="Category"></asp:Label>
                                                <asp:Label ID="lblItem" runat="server" Text="Product Name" style="margin-left:150px"></asp:Label>
                                                <asp:Label ID="lblUnit" runat="server" Text="Units" style="margin-left:115px"></asp:Label> 
                                               
                                                <asp:Label ID="lblPrice" runat="server" Text="Unit Price" style="margin-left:97px"></asp:Label>
                                                <asp:Label ID="lblTotal" runat="server" Text="Sold Price" style="margin-left:146px"></asp:Label>  
                                                 <asp:Label ID="lblVat" runat="server" Text="VAT" style="margin-left:142px"></asp:Label>   
                                                <p style="display:flex">
                                                       <asp:TextBox ID="txtCat" runat="server" TextMode="SingleLine" CssClass="form-control width" Enabled="false"></asp:TextBox>
                                                        <asp:TextBox ID="txtItem" runat="server" CssClass="form-control width" TextMode="SingleLine" style="margin-left:18px" Enabled="false"></asp:TextBox>
                                                        <asp:TextBox runat="server" ID="txtUnit" TextMode="SingleLine" CssClass=" form-control" style="margin-left:18px;width:114px" OnTextChanged="txtUnit_TextChanged" AutoPostBack="true" />
                                                        <asp:TextBox runat="server" ID="txtPrice" TextMode="SingleLine" CssClass=" form-control width" style="margin-left:18px" OnTextChanged="txtPrice_TextChanged" AutoPostBack="true" />
                                                        <asp:TextBox runat="server" ID="txtTotal" TextMode="SingleLine" CssClass=" form-control width" style="margin-left:18px" Enabled="false"/>
                                                        <asp:TextBox runat="server" ID="txtVat" TextMode="SingleLine" CssClass=" form-control" style="margin-left:18px;width:114px" Enabled="false" OnTextChanged="txtVat_TextChanged" AutoPostBack="true" />
                                                        <asp:button runat="server" ID="btnAdd" class="btn btn-success" style="margin-left:20px" Text="Add" OnClick="btnAdd_Click"></asp:button>
                                                </p>
                                                <p>
                                                    <asp:Label runat="server" ID="lblMsg" ForeColor="Red" Text="" style="margin-left:418px" ></asp:Label> 
                                                </p>
                                                
                                            </div>
                                            <div class="ibox-content"></div>
                                             <div class="table-responsive">
                                                <asp:Repeater ID="rptData1" runat="server">
                                                    <HeaderTemplate>
                                                        <table class="table table-striped table-hover">
                                                            <thead style="background-color: #1c84c6;color: white">
                                                                <tr class="gradeX">
                                                                    
                                                                     <th>No.</th>
                                                                    <th>Product Name</th>
                                                                    <th>Units</th>
                                                                    <th>Sold Price</th>
                                                                     <th>Total</th>
                                                                      <th>Options</th>
                                                                 </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr class="gradeX">
                                                            
                                                              <td><%# ++count%></td>
                                                             <td><%# Eval("P_name")%></td>
                                                              <td><%# Eval("P_unit")%></td>
                                                                <td><%# Eval("P_sold")%></td>
                                                               <td><%# Eval("P_cost")%></td>
                                                               <td><asp:LinkButton runat="server" ID="btnDelete" Text="Delete" OnCommand="btnDelete_Command" CommandName="Delete" CommandArgument='<%# Eval("P_no") %>'  ></asp:LinkButton></td>
                                                             <asp:HiddenField runat="server" ID="hid" Value='<%# Eval("P_no") %>' />
                                                           
                                                       </tr>
                                                   </ItemTemplate>
                                                 <FooterTemplate>
                                                        </tbody>
                       
                                            </table>
                                                     
                                              </FooterTemplate>
                                               
                                         </asp:Repeater>
                                                 <asp:Panel ID="Panel3" runat="server">   
                                                  <div class="form-group">

                                                   <asp:Label ID="lblRSub" runat="server" Text="Total Amount" style="margin-left:531px"></asp:Label>
                                               
                                                <asp:Label ID="lblRTax" runat="server" Text="VAT" style="margin-left:123px"></asp:Label>
                                                
                                                 <asp:Label ID="lblRAmount" runat="server" Text="Net Amount" style="margin-left:183px"></asp:Label>
                                            <p style="display:flex">
                                            
                                             <asp:TextBox runat="server" ID="txtRSub" TextMode="SingleLine" CssClass="form-control width" style="margin-left:531px" Enabled="false" />
                                            <asp:TextBox runat="server" ID="txtRTax" TextMode="SingleLine" CssClass="form-control width " style="margin-left:20px" Enabled="false" />
                                                <asp:TextBox runat="server" ID="txtRAmount" TextMode="SingleLine" style="margin-left:20px;font-weight:bold" CssClass="form-control width" Enabled="false" />
                                            </p>
                                         </div>
                                    </asp:Panel>
                                        </div>
                                            </div> 
                                        <div class="ibox-content">
                                             <div class="table-responsive">
                                                <asp:Repeater ID="rptData" runat="server" OnItemDataBound="rptData_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table class="table table-striped table-hover">
                                                            <thead style="background-color: #1c84c6;color: white">
                                                                <tr class="gradeX">
                                                                    
                                                                     <th>No.</th>
                                                                    <th>Product Name</th>
                                                                    <th>Category</th>
                                                                    <th>Units</th>
                                                                     <th>Unit Price</th>
                                                                    <th>VAT</th>
                                                                     <th>Total</th>
                                                                      <th>Options</th>
                                                                 </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr class="gradeX">
                                                            
                                                              <td><%# ++count%></td>
                                                             <td><%# Eval("P_name")%></td>
                                                              <td><%# Eval("Cat_name")%></td>
                                                              <td><%# Eval("P_qty")%></td>
                                                                <td><%# Eval("P_price")%></td>
                                                                <td><asp:Literal runat="server" ID="litTax" ></asp:Literal></td>
                                                             <td><%# Eval("P_tot")%></td>
                                                               <td><asp:LinkButton runat="server" ID="btnEdit" Text="Edit" OnCommand="btnEdit_Command" CommandName="Select" CommandArgument='<%# Eval("P_no") %>'  ></asp:LinkButton></td>
                                                             
                                                           
                                                       </tr>
                                                   </ItemTemplate>
                                                 <FooterTemplate>
                                                        </tbody>
                       
                                            </table>
                                                     
                                              </FooterTemplate>
                                               
                                         </asp:Repeater>
                                        <asp:Panel ID="Panel2" runat="server">      
                                         
                                        <div class="form-group">
                                              <asp:Label ID="lblSub" runat="server" Text="Total Amount" style="margin-left:520px"></asp:Label>
                                               
                                                <asp:Label ID="lblTax" runat="server" Text="VAT" style="margin-left:123px"></asp:Label>
                                                
                                                 <asp:Label ID="lblAmount" runat="server" Text="Net Amount" style="margin-left:183px"></asp:Label>
                                            <p style="display:flex">
                                            
                                             <asp:TextBox runat="server" ID="txtSub" TextMode="SingleLine" CssClass="form-control width" style="margin-left:520px" Enabled="false" />
                                            <asp:TextBox runat="server" ID="txtTax" TextMode="SingleLine" CssClass="form-control width " style="margin-left:20px" Enabled="false" />
                                                <asp:TextBox runat="server" ID="txtAmount" TextMode="SingleLine" style="margin-left:20px;font-weight:bold" CssClass="form-control width" Enabled="false" />
                                            </p>
                                         </div>
                                    </asp:Panel>
                                     
                                     </div>
                                            <asp:Button ID="btnReturn" runat="server" CssClass="btn btn-success" Text="Return" OnClick="btnReturn_Click" />
                                             <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-success" Text="Cancel" OnClick="btnCancel_Click" />
                                            
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

   