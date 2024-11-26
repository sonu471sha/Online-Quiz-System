<%@ Page Title="" Language="C#" MasterPageFile="Website.Master" AutoEventWireup="true" CodeFile="examdetails.aspx.cs" Inherits="Quiz.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 168px;
        }
        .auto-style2 {
            width: 193px;
        }
        .auto-style3 {
            width: 269px;
        }
        
    </style>
    <script>
        $(document).ready(function () {
            
            
            $(".dethid").hide();
            $(".inproces").hide();

            
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/>
    <center><h2>Current Test Details</h2></center>
    <br/>
    <form id="form1" runat="server">
        <div>
            <center><table>
                <tr>
                    <td class="auto-style2">Current Test Duration:</td>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                     minutes</td>
                    <td class="auto-style3">Current Exam Name:</td>
                    <td class="auto-style4">
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
            </table></center>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </div>
    </form>
    <br />


</asp:Content>
