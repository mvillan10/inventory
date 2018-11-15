<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="InventoryWebApp.Expense" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Expenses</title>
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
</head>
<body class="">
    <div id="page-wrapper" class="gray-bg">
          <div class="wrapper wrapper-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <div class="ibox-title text-center">
                                <h5>Other Expenses</h5>
                            </div>
                            <div class="ibox-content">   
                                <form id="form1" runat="server">
                                   <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <asp:Label ID="lblDate" runat="server" Text="Date" ></asp:Label> 
                                                <asp:TextBox runat="server" ID="txtDate" TextMode="Date"  CssClass="form-control" style="width:14% !important; display:inline-block !important"></asp:TextBox>
                                            </div>
                                             <div class="form-group">
                                                <asp:Label ID="lblType" runat="server" Text="Type" ></asp:Label> 
                                                <asp:DropDownList runat="server" ID="ddlType" CssClass="form-control ddlht" style="width:16% !important; display:inline-block !important">
                                                     <asp:ListItem Text="General Expenses"></asp:ListItem>
                                                      <asp:ListItem Text="Other"></asp:ListItem>
                                                    </asp:DropDownList>
                                             </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblAmt" runat="server" Text="Net Amount" ></asp:Label> 
                                                <asp:TextBox runat="server" ID="txtAmt" TextMode="SingleLine"  CssClass="form-control width" style="display:inline-block !important"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblDetails" runat="server" Text="Description" ></asp:Label> <br />
                                                <asp:TextBox runat="server" ID="txtDetails" TextMode="MultiLine"  CssClass="form-control" style="width:27%"></asp:TextBox>
                                            </div>
                                             <div class="form-group">
                                                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" ></asp:Button>
                                                <asp:Button runat="server" ID="btnClear" Text="Clear" CssClass="btn btn-success" OnClick="btnClear_Click"></asp:Button>
                                            </div><br />
                                            <div class="form-group text-center">
                                                    <asp:Label ID="lblFrom" runat="server" Text="From:" ></asp:Label>
                                                    <asp:TextBox runat="server" ID="txtFrom" TextMode="Date"  CssClass="form-control" style="width:14% !important; display:inline-block !important" AutoPostBack="true" OnTextChanged="txtFrom_TextChanged"></asp:TextBox>
                                                     <asp:Label ID="lblTo" runat="server" Text="To:" ></asp:Label>
                                                    <asp:TextBox runat="server" ID="txtTo" TextMode="Date" CssClass="form-control" style="width:14% !important; display:inline-block !important" AutoPostBack="true" OnTextChanged="txtTo_TextChanged"/>
                                                </div>
                                                <div class="table-responsive">
                                                <asp:Repeater ID="rptData" runat="server">
                                                    <HeaderTemplate>
                                                        <table class="table table-striped table-hover dataTables-example">
                                                            <thead style="background-color: #1c84c6;color: white">
                                                                <tr>
                                                                    <th>No.</th>
                                                                    <th>Date</th>
                                                                    <th>Description</th>
                                                                    <th>Amount</th>
                                                                   <th>Expense Type</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                   </HeaderTemplate>
                                                   <ItemTemplate>
                                                        <tr class="gradeX">
                                                            <td><%# ++count%></td>
                                                             <td><%# Convert.ToDateTime(Eval("Date")).Date.ToString("dd-MM-yyyy") %></td>
                                                             <td><%# Eval("Details")%></td>
                                                            <td><%# Eval("Amount")%></td>
                                                            <td><%# Eval("Type")%></td>
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

