<%@ Page Title="" Language="C#" MasterPageFile="Website.Master" AutoEventWireup="true" CodeFile="student_home.aspx.cs" Inherits="Quiz.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 27px;
        }
        .auto-style2 {
            display: block;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            background-clip: padding-box;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            background-color: #fff;
        }
        table {
            
            background-color: gray;
            color: white;
			border-collapse: collapse;
			width: 100%;
			max-width: 800px;
			margin: 0 auto;
			font-size: 16px;
            border: 0px solid !important;
		}

        .cornflex{

            display: flex;
            justify-content:space-between;
            color:forestgreen;
            font-weight:bold;

       }
        main{
            all:unset !important;
            position: absolute;
            top: 54px;
            bottom: 54px;
            left: 0px;
            right: 0px;
            overflow: auto;
        }

        
    </style>
    <script>


        $(document).ready(function () {
            
        
            $(".dethid").hide();
            $(".navhid").hide();
            $(".inproces").hide();

            
        });
    </script>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     


    <form id="form1" runat="server">
        <div class="cornflex"><div>Welcome,&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
        <asp:LinkButton style="background-color:red; color:white; font-weight:bold;" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Logout</asp:LinkButton></div>
<br />
<center><h2>Your details with us!</h2>
        
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Full_Name:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox2" runat="server" Enabled="false" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Required!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="myFullNameValidator" ForeColor="blue" runat="server" ControlToValidate="TextBox2" ValidationExpression="^[A-Za-z]+(?:\s+[A-Za-z]+)+$" ErrorMessage="Enter a valid full name!"></asp:RegularExpressionValidator>
                                  
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Date of Birth:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Date" CssClass="auto-style2" placeholder="DOB" Enabled="false" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11"  runat="server" ControlToValidate="TextBox3" ErrorMessage="*Required!" ForeColor="#CC0000"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">Gender:</td>
                <td class="auto-style1">
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style2" placeholder="Gender" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" Enabled="false">
                                            <asp:ListItem Text="Select Value" Value=""></asp:ListItem>
                                            <asp:ListItem Value="Male"></asp:ListItem>
                                            <asp:ListItem Value="Female"></asp:ListItem>
                                            <asp:ListItem Value="Others"></asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" InitialValue="" ControlToValidate="DropDownList1" ErrorMessage="*Required!" ForeColor="#CC0000"></asp:RequiredFieldValidator>

                                   </td>
            </tr>
            <tr>
                <td class="auto-style1">Contact_no:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox5" runat="server" Enabled="false"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox5" ErrorMessage="*Required!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ForeColor="blue" ID="myMobileNumberValidator" runat="server" ControlToValidate="TextBox5" ValidationExpression="^\d{10}$" ErrorMessage="Please enter a valid mobile number!"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Email_id:</td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox6" runat="server" Enabled="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*Required!" ControlToValidate="TextBox6" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ForeColor="blue" ID="myEmailValidator" runat="server" ControlToValidate="TextBox6" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Please enter a valid email ID!"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
    <br />
       <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="Button1_Click" />
            <asp:Button ID="Button3" runat="server" Text="Update" Visible="false" OnClick="Button3_Click"  />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Continue with the Test" />
            <br />
    <asp:Label style="color:red;" ID="Label2" runat="server" ></asp:Label>

    </center>
    </form>
            <br />
            <br />
     


</asp:Content>
