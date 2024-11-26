<%@ Page Title="" Language="C#" MasterPageFile="./Website.Master" AutoEventWireup="true" CodeFile="Release_system.aspx.cs" Inherits="Quiz.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
    </style>
    <script>
        $(document).ready(function () {
            
            
            $(".dethid").hide();
            $(".inproces").hide();

            
        });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
<br />
        <div style="color:forestgreen; font-weight:bold;">Welcome,&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
       
<br />
<br />
       <center> <asp:Panel style="text-align:left;" ID="Panel1" runat="server">
            <h2>System can be used by one admin at a time. Once you login here no other admin can use it until you click release and logout! You can also take a backup and delete the record before releasing the system to avoid data loss!</h2>
            </asp:Panel>
            <br />
            <asp:Button style="background-color:red; color:white;" ID="Button1" runat="server" Text="Release and Logout" OnClick="Button1_Click" OnClientClick="return confirm('Once released the other admin user will get right to check, modify and use the system. Please make sure to take a backup and delete the saved questions and result data before releasing the system. Are you sure you want release the system and logout?');" />
            <br />
            
            <br />
            You can erase the record before releasing through below buttons!
            <br></BR>
            
            <asp:Button ID="Button2" runat="server" Text="Delete Question List" OnClick="Button2_Click" OnClientClick="return confirm('Are you sure you want to delete the entire Question List?')" />
            
            <br></BR>
            <asp:Button ID="Button3" runat="server" Text="Delete Result Records" OnClick="Button3_Click" OnClientClick="return confirm('Are you sure you want to delete the result data?')" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="Delete Students Answersheet" OnClientClick="return confirm('Are you sure you want to delete the students answersheet ?')" OnClick="Button4_Click" />
        
        </BR>
        </BR>


           </center>
    </form>

</asp:Content>
