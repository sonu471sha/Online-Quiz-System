<%@ Page Title="" Language="C#" MasterPageFile="Website.Master" AutoEventWireup="true" CodeFile="chk_add_ques.aspx.cs" Inherits="Quiz.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script>
        $(document).ready(function () {
            
            
            $(".dethid").hide();
            $(".inproces").hide();

            
        });
    </script>

    <style>
        
        table {
            
            background-color: gray;
            color: white;
			border-collapse: collapse;
			width: 100%;
			max-width: 800px;
			margin: 0 auto;
			font-size: 16px;
            
		}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    </br>
    <center><h2>Update Test Details</h2>
    
    <form id="form1" runat="server" enctype="multipart/form-data">
        <br />
        <table style="width:100%;">
            <tr>
                <td>Test Duration (in minutes):</td>
                <td>&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required! " ControlToValidate="TextBox1" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter a valid test duration!" ForeColor="#CC0000" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
</td>
            <tr>
                <td>Test Name:</td>
                <td>&nbsp;<asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" *Required! " ControlToValidate="TextBox2" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please enter a valid test name!" ForeColor="#CC0000" ValidationExpression="^[a-zA-Z0-9]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Update Question List</td>
                <td>&nbsp;<asp:FileUpload ID="FileUploadControl" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" *Required" ControlToValidate="FileUploadControl" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="UploadButton" runat="server" OnClick="Button2_Click" Text="Update Exam Details" />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="./examdetails.aspx" Target="_parent">Check Exam Details</asp:HyperLink>
        
        <br />
        <br />
        <asp:Panel ID="Panel2" runat="server" >
            <asp:Label style="color:red;" CssClass="lblaler" ID="Label1" runat="server"></asp:Label>
        </asp:Panel>

        <asp:Panel ID="Panel1" runat="server" Style="text-align:left;" >
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The file could not be uploaded. Please check your Excelsheet for the following conditions:
            <br />
            1) Questions must be Unique.
            <br />
            2) Option in a row must be Unique.
            <br />
            3) Any Cell in the Excelsheet Table should not have a Null Value.
            <br />
            4) Correct Option column can only accept either &#39;A&#39;,&#39;B&#39;,&#39;C&#39; or &#39;D&#39;.
            <br />
            5) The table in the Excelsheet must have exactly 6 columns.
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Also check the given example on how a table in an Excelsheet should look.<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="Image1" runat="server" />
        </asp:Panel>
        <br />
        <br />
        <br />
    </form></center> 
</asp:Content>
