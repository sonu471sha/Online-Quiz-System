<%@ Page Title="" Language="C#" MasterPageFile="./Website.Master" AutoEventWireup="true" CodeFile="TestBckup_Folder.aspx.cs" Inherits="Quiz.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        .equal_space{
            display: flex;
            justify-content:space-around;
        }
        .equal_space button {
            flex: 1;
            margin-right: 10px;
        }
        .equal_space button:last-child {
            margin-right: 0px;
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
    <br />
    <center><h2>Student Answersheet</h2></center>
    <form id="form1" runat="server">
        
        <br />
        <center><asp:ListBox ID="ListBox1" runat="server" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox></center>
        <br />
        <div class="equal_space">
        <span><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete Selected Item" OnClientClick="return confirm('Are you sure you want to delete the selected item?')" /></span>

        <span><asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Open Selected Item" /></span>

        <span><asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Delete All Items" OnClientClick="return confirm('Are you sure you want to delete all the student answersheet?')"/></span>
        </div>

        <br />

        <center><asp:GridView ID="GridView1" runat="server">
        </asp:GridView></center>

    </form>
</asp:Content>