<%@ Page Title="" Language="C#" MasterPageFile="Website.Master" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="Quiz.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>

        $(document).ready(function () {
            
            
            $(".dethid").hide();
            $(".inproces").hide();

            
        });
    </script>
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   </br>
    <center><h2>Student Record</h2></center>
    <form id="form1" runat="server">
        <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="userid">
            <Columns>
                <asp:BoundField DataField="userid" HeaderText="userID" SortExpression="userID" />
                <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="dob" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="contact_no" HeaderText="con_no" SortExpression="con_no" />
                <asp:BoundField DataField="email_id" HeaderText="ema_id" SortExpression="ema_id" />
                <asp:BoundField DataField="pwd" HeaderText="pwd" SortExpression="pwd" />
                <asp:BoundField DataField="confirm_pwd" HeaderText="conpwd" SortExpression="conpwd" />

                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this row?')" />

                    </ItemTemplate>
                </asp:TemplateField>



            </Columns>
        </asp:GridView>
        <br />

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete all Records" OnClientClick="return confirm('Are you sure you want to delete all the records?')"/>
        <br />
            <br />

        </center>
       
    </form>
    
</asp:Content>
