<%@ Page Title="" Language="C#" MasterPageFile="Website.Master" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Quiz.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script>

        $(document).ready(function () {
            
        
            $(".dethid").hide();
            $(".navhid").hide();

            
        });
    </script>
    <style>
        main{
            all:unset !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <br />
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 mx-auto">

                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h1 style="text-align:center"><b>Student Registration</b></h1>
                                    </center>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col">
                                   <hr />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                   <asp:Label ID="Label1" runat="server" Text="Username :">Userid :</asp:Label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txt_unm" runat="server" CssClass="form-control" placeholder="User Id"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txt_unm" ErrorMessage="*Required!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="myUserIDValidator" runat="server" ControlToValidate="txt_unm" ValidationExpression="^[a-zA-Z0-9_]{6,20}$" ForeColor="blue" ErrorMessage="Enter User Id with atleast 6 characters!"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <asp:Label ID="Label2" runat="server" Text="Full Name :">Full Name :</asp:Label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txt_fnm" runat="server" CssClass="form-control" placeholder="FullName"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_fnm" ErrorMessage="*Required!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="myFullNameValidator" ForeColor="blue" runat="server" ControlToValidate="txt_fnm" ValidationExpression="^[A-Za-z]+(?:\s+[A-Za-z]+)+$" ErrorMessage="Enter a valid full name!"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                   
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                   <asp:Label ID="Label3" runat="server" Text="Date Of Birth :">Date of Birth :</asp:Label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txt_dob" runat="server" TextMode="Date" CssClass="form-control" placeholder="DOB"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11"  runat="server" ControlToValidate="txt_dob" ErrorMessage="*Required!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                   <asp:Label ID="Label4" runat="server" Text="Gender :">Gender :</asp:Label>
                                    <div class="form-group">
                                        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control" placeholder="Gender">
                                            <asp:ListItem Text="Select Value" Value=""></asp:ListItem>
                                            <asp:ListItem Value="Male"></asp:ListItem>
                                            <asp:ListItem Value="Female"></asp:ListItem>
                                            <asp:ListItem Value="Others"></asp:ListItem>
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" InitialValue="" ControlToValidate="DropDownList1" ErrorMessage="*Required!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="Label5" runat="server" Text="Contact No. :">Contact No:</asp:Label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txt_cno" runat="server" TextMode="Phone" CssClass="form-control" placeholder="Contact number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txt_cno" ErrorMessage="*Required!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ForeColor="blue" ID="myMobileNumberValidator" runat="server" ControlToValidate="txt_cno" ValidationExpression="^\d{10}$" ErrorMessage="Please enter a valid mobile number!"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <asp:Label ID="Label6" runat="server" Text="Email Id :">Email Id :</asp:Label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txt_email" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter Email Id"></asp:TextBox>&nbsp;
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*Required!" ControlToValidate="txt_email" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ForeColor="blue" ID="myEmailValidator" runat="server" ControlToValidate="txt_email" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Please enter a valid email ID!"></asp:RegularExpressionValidator><br />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="Label7" runat="server" Text="Password :">Password :</asp:Label>     
                                    <div class="form-group">
                                        <asp:TextBox ID="txt_password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*Required!" ControlToValidate="txt_password" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="myPasswordValidator"  runat="server" ForeColor="blue" ControlToValidate="txt_password" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*?_~+-]).{8,}$" ErrorMessage="Enter a valid password- Format:Abc@1234"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <asp:Label ID="Label8" runat="server" Text="Re-Enter Password :">Re-Enter Password :</asp:Label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txt_cpwd" runat="server" TextMode="Password" CssClass="form-control" placeholder="Re-Enter Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Required!" ControlToValidate="txt_cpwd" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="myConfirmPasswordValidator" ForeColor="blue" runat="server" ControlToValidate="txt_cpwd" ControlToCompare="txt_password" Operator="Equal" ErrorMessage="The password and confirm password fields must match"></asp:CompareValidator>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <center><div class="col-md-6">
                                        <asp:Button ID="btn_register" class="btn btn-primary btn-block btn-lg" runat="server" Text="Register" Width="200px" OnClick="btn_register_Click" />
                                    <asp:HyperLink ID="HyperLink2" runat="server" BackColor="#CCCCCC" NavigateUrl="./Login.aspx">Click here to login</asp:HyperLink>
                                </div></center>

                                
                            </div>
                            
                                </div>
             
                    </div>
                 </div>
           </div>
        </div>
        
    </form>
    <br />
</asp:Content>


<%--<div class="row">
                <div class="col">
                        <asp:Label ID="lbl_unm" runat="server" Text="Username :">Userid :</asp:Label>
                        <asp:TextBox ID="txt_unm" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_unm" ErrorMessage="User id is required..!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        
                    
                    <td style="text-align:right">
                        <asp:Label ID="lbl_fnm" runat="server" Text="Full Name :">Full Name :</asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txt_fnm" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_fnm" ErrorMessage="Full name is Require...!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                <tr>
                    <td style="text-align:right">
                        <asp:Label ID="lbl_dob" runat="server" Text="Date Of Birth :">Date of Birth :</asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txt_dob" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_dob" ErrorMessage="Date Of Birth is Required...!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="text-align:right">
                        <asp:Label ID="lbl_gender" runat="server" Text="Gender :">Gender :</asp:Label>
                    </td>
                    <td class="auto-style1" >
                        &nbsp;</td>
                    <td class="auto-style1" style="text-align:left">
                        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Value="Select Value"></asp:ListItem>
                            <asp:ListItem Value="Male"></asp:ListItem>
                            <asp:ListItem Value="Female"></asp:ListItem>
                            <asp:ListItem Value="Other"></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please Select Gender..!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">
                        <asp:Label ID="lbl_cno" runat="server" Text="Contact No. :">Contact No:</asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txt_cno" runat="server" TextMode="Phone"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_cno" ErrorMessage="Please enter Valid Contact Number...!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Your Contact Number should be 10 Digit...!" ControlToValidate="txt_cno" ForeColor="Blue" MaximumValue="10" MinimumValue="10"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">
                        <asp:Label ID="lbl_email" runat="server" Text="Email Id :">Email Id :</asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter valid Email Id..!" ControlToValidate="txt_email" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter your Email_id in this format: abc@gmail.com" ControlToValidate="txt_email" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                
                <tr>
                    <td style="text-align:right">
                        
                        <asp:Label ID="lbl_pwd" runat="server" Text="Password :">Password :</asp:Label>
                        
                        </td>
                    <td >
                        &nbsp;</td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter your Password...!" ControlToValidate="txt_password" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">
                        
                        <asp:Label ID="lbl_cpwd" runat="server" Text="Re-Enter Password :">Re-Enter Password :</asp:Label>
                        
                        </td>
                    <td>
                        &nbsp;</td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txt_cpwd" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please re-enter your Password...!" ControlToValidate="txt_cpwd" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Your Password is not matching...!" ControlToCompare="txt_password" ControlToValidate="txt_cpwd" ForeColor="Blue"></asp:CompareValidator>
                        </td>
                </tr>
                <tr>
                    <td>
                        
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
               
<tr>
                    <td style="text-align:right">
                        
                        
                        
                        </td>
                    <td style="text-align:center">
                        &nbsp;</td>
                    <td style="text-align:left">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="./Login.aspx" Target="_parent">Login</asp:HyperLink>
                    </td>
                </tr>
    --%>
