<%@ Page Title="" Language="C#" MasterPageFile="Website.Master" AutoEventWireup="true" CodeFile="Rules.aspx.cs" Inherits="Quiz.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>

        $(document).ready(function () {
            
        
            $(".dethid").hide();
            $(".navhid").hide();
            $(".inproces").hide();

            
        });
    </script>
    <style>
        main{
            all:unset !important;
            position: absolute;
            top: 54px;
            bottom: 54px;
            left: 0px;
            right: 0px;
            overflow: auto;
        }
        .panel_1{
            width: 75%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form id="form1" runat="server">
        <br />
        <center><div class="panel_1"><asp:Panel ID="Panel1" runat="server"  BackColor="Gray" ForeColor="White">
            <div style="text-align:left;padding:25px;" >
            <br />
            Rules:<br /> <br /> 1. Test page will open up in new window, maximize it and continue.<br /> 2. Test will Automatically end when time&#39;s up.<br /> 3. Click submit if you want to end up early.<br /> 4. Make sure not to leave the site without submitting or time up or else the answers will not be saved and will not be able to give the test again.
            <br />
            5. After submission, you will automatically logout and the records will be saved!
                <br />
            6.
            <asp:Label ID="Label2" runat="server" Height="28px" Width="30px"></asp:Label>
            &nbsp; button resembles &quot;Not Answered&quot;.
            <br />
            7.
            <asp:Label ID="Label3" runat="server" Height="28px" Width="30px"></asp:Label>
            &nbsp; button resembles &quot;Marked for Review&quot;.
            <br />
            8. <asp:Label ID="Label4" runat="server"  Height="28px" Width="30px"></asp:Label>
            &nbsp; button resembles &quot;Answered &amp; Marked for Review&quot;.
            <br />
            9.
            <asp:Label ID="Label5" runat="server"  Height="28px" Width="30px"></asp:Label>
            &nbsp; button resembles &quot;Answered&quot;.
            <br />
            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Read all the details" />
            <br /></div>
        </asp:Panel></div></center>
        <br />
        <center><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Click here to start" />&nbsp;</center>
    </form>
    

</asp:Content>
