<%@ Page Title="" Language="C#" MasterPageFile="Website.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Quiz.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    </style>
    <script>
        $(document).ready(function () {
            
            $(".navhid").hide();
            $(".dethid").hide();

            
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <br />
        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img width="150px" src="image/admin-user-icon-4.jpg" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h1>Student Login</h1>
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                       <hr >
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">

                                    <label><b>User Id</b></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txt_unm" CssClass="form-control" runat="server" placeholder="User Id"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_unm" ErrorMessage="*Required!" ForeColor="#CC0000" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>

                                    <label><b>Password</b></label>
                                    <div class="form-group">
                                        <asp:TextBox ID="txt_pwd" CssClass="form-control" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_pwd" ErrorMessage="*Required!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                    </div>

                                    <center><div class="form-group" >
                                        <asp:Button ID="btn_login" runat="server" OnClick="Button1_Click" Text="Login" class="btn btn-success btn-block btn-lg" Width="228px" />
                                                          <asp:HyperLink ID="HyperLink2" runat="server" BackColor="#CCCCCC" NavigateUrl="./Signup.aspx">Click here to register</asp:HyperLink></center>

                                   
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>            
    </form>

</asp:Content>
