<%@ Page Title="" Language="C#" MasterPageFile="Website.Master" AutoEventWireup="true" CodeFile="Results.aspx.cs" Inherits="Quiz.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script>
        $(document).ready(function () {
            
            
            $(".dethid").hide();
            $(".inproces").hide();

            
        });
    </script>
    <style>
        .nedes {
            
            background-color: gray;
            color: white;
			border-collapse: collapse;
			width: 100%;
			max-width: 800px;
			margin: 0 auto;
			font-size: 16px;
            border: 0px solid !important;
		}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    </br>

    <center><h2>Students Result Record</h2></center>


        <form id="form1" runat="server">
            <div class="container">
                <br />
                <center>Enter Marks Details if you want to add it in the below Result Data<br />
            <table class="nedes" style="width:100%;">
                <tr>
                    <td>Marks per Question:</td>
                    <td><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required! " ControlToValidate="TextBox1" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter a valid marks!" ForeColor="#CC0000" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                <tr>
                    <td>Negative Marks per Question:</td>
                    <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required! " ControlToValidate="TextBox2" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please enter a valid marks!" ForeColor="#CC0000" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>

                    </td>
                </tr>
            </table>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update Marks in Result Data" />
            <br />
           

<asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
           
        </br>



            <asp:Button ID="btnExport" runat="server" OnClick="btnExport_Click" Text="Download Result Data in Excel" />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="./Result_Delete.aspx" Target="_parent">Detele Result Record</asp:HyperLink>



</center>
            <br />


</div>
    </form>

</asp:Content>