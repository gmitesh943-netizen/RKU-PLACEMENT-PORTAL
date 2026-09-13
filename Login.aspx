<%@ Page Title="Login" Language="C#" MasterPageFile="~/MainMaster.Master"
    AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="RKU_PLACEMENT_PORTAL.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .portal-login-page {
            min-height: calc(100vh - 72px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 42px 18px;
            background: linear-gradient(135deg, #fff9f8 0%, #f7f8fc 52%, #fff4f2 100%);
            font-family: Inter, Arial, sans-serif;
        }

        .portal-login-shell {
            width: min(100%, 940px);
            display: grid;
            grid-template-columns: 1fr 1.12fr;
            overflow: hidden;
            background: #fff;
            border: 1px solid #edf0f5;
            border-radius: 16px;
            box-shadow: 0 18px 55px rgba(49, 37, 49, 0.14);
        }

        .login-showcase {
            position: relative;
            min-height: 535px;
            overflow: hidden;
            padding: 55px 48px 105px;
            color: #1b1b21;
            background: linear-gradient(155deg, #fff 0%, #fff 56%, #fff5f5 100%);
        }

        .login-showcase::before,
        .login-showcase::after {
            content: "";
            position: absolute;
            border-radius: 50%;
            pointer-events: none;
        }

        .login-showcase::before {
            width: 310px;
            height: 310px;
            right: -165px;
            bottom: 42px;
            border: 1px solid rgba(231, 53, 43, 0.18);
            box-shadow: 0 0 0 28px rgba(231, 53, 43, 0.035), 0 0 0 55px rgba(231, 53, 43, 0.02);
        }

        .login-showcase::after {
            width: 250px;
            height: 34px;
            left: -20px;
            bottom: -17px;
            background: #f43129;
            transform: rotate(5deg);
            box-shadow: 190px -8px 0 #d91e27;
        }

        .showcase-brand {
            display: inline-flex;
            align-items: center;
            gap: 11px;
            margin-bottom: 57px;
            color: #171820;
            font-family: Outfit, Arial, sans-serif;
            font-weight: 800;
            font-size: 15px;
            letter-spacing: 0.02em;
        }

        .showcase-brand img {
            width: 36px;
            height: 36px;
            object-fit: contain;
        }

        .showcase-brand span {
            display: block;
            color: #e42d2c;
            font-size: 9px;
            font-weight: 800;
            letter-spacing: 0.12em;
        }

        .showcase-title {
            margin: 0;
            font-family: Outfit, Arial, sans-serif;
            font-size: clamp(29px, 3.2vw, 39px);
            font-weight: 800;
            line-height: 1.03;
            letter-spacing: -0.045em;
        }

        .showcase-title em {
            color: #f03730;
            font-style: normal;
        }

        .showcase-text {
            max-width: 290px;
            margin: 14px 0 21px;
            color: #747681;
            font-size: 12px;
            line-height: 1.65;
        }

        .showcase-line {
            width: 33px;
            height: 3px;
            margin-bottom: 34px;
            border-radius: 3px;
            background: #f03730;
        }

        .showcase-stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 9px;
            position: relative;
            z-index: 1;
        }

        .showcase-stat {
            min-height: 78px;
            padding: 13px 10px;
            border: 1px solid #eceef2;
            border-radius: 6px;
            text-align: center;
            background: rgba(255, 255, 255, 0.86);
            box-shadow: 0 5px 12px rgba(31, 35, 47, 0.03);
        }

        .showcase-stat i {
            display: block;
            margin-bottom: 6px;
            color: #ed332d;
            font-size: 13px;
        }

        .showcase-stat strong {
            display: block;
            color: #282a32;
            font-size: 13px;
            line-height: 1;
        }

        .showcase-stat span {
            display: block;
            margin-top: 5px;
            color: #92949c;
            font-size: 8px;
            font-weight: 600;
        }

        .login-form-panel {
            display: flex;
            align-items: center;
            padding: 42px clamp(30px, 6vw, 72px);
            background: #fff;
        }

        .login-form-content {
            width: 100%;
            max-width: 375px;
            margin: 0 auto;
        }

        .login-heading {
            margin: 0;
            color: #171820;
            font-family: Outfit, Arial, sans-serif;
            font-size: 29px;
            font-weight: 800;
            letter-spacing: -0.035em;
        }

        .login-intro {
            margin: 7px 0 25px;
            color: #9396a0;
            font-size: 11px;
        }

        .login-section-label {
            display: block;
            margin: 0 0 10px;
            color: #4d515d;
            font-size: 10px;
            font-weight: 700;
        }

        .login-role-buttons {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 7px;
            margin-bottom: 20px;
        }

        .login-role-btn {
            min-height: 34px;
            border: 1px solid #f0b2af;
            border-radius: 5px;
            color: #e23d38;
            background: #fff;
            font-size: 10px;
            font-weight: 700;
            transition: 0.2s ease;
        }

        .login-role-btn:hover,
        .login-role-btn.active {
            border-color: #f13831;
            color: #fff;
            background: #f13831;
            box-shadow: 0 5px 11px rgba(241, 56, 49, 0.18);
        }

        .login-field {
            position: relative;
            margin-bottom: 12px;
        }

        .login-field > i {
            position: absolute;
            z-index: 1;
            top: 50%;
            left: 13px;
            color: #a5aab5;
            font-size: 12px;
            transform: translateY(-50%);
        }

        .login-input {
            width: 100%;
            height: 42px;
            border: 1px solid #e7e9ef;
            border-radius: 5px;
            outline: none;
            color: #333743;
            background: #fafbfc;
            padding: 0 43px 0 35px;
            font-size: 11px;
            transition: 0.2s ease;
        }

        .login-input:focus {
            border-color: #f04b45;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(240, 75, 69, 0.1);
        }

        .password-toggle {
            position: absolute;
            top: 50%;
            right: 11px;
            z-index: 2;
            border: 0;
            color: #a5aab5;
            background: transparent;
            font-size: 13px;
            transform: translateY(-50%);
        }

        .login-options {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 4px 0 17px;
            color: #737782;
            font-size: 10px;
        }

        .remember-login {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            cursor: pointer;
        }

        .remember-login input {
            width: 12px;
            height: 12px;
            margin: 0;
            accent-color: #f13831;
        }

        .forgot-password {
            color: #ed3732;
            font-weight: 700;
            text-decoration: none;
        }

        .login-submit {
            width: 100%;
            height: 42px;
            border: 0;
            border-radius: 5px;
            color: #fff;
            background: #f13931;
            box-shadow: 0 7px 14px rgba(241, 57, 49, 0.24);
            font-size: 11px;
            font-weight: 800;
            transition: 0.2s ease;
        }

        .login-submit:hover {
            background: #dd2d28;
            transform: translateY(-1px);
        }

        .login-divider {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 20px 0 14px;
            color: #a2a5ad;
            font-size: 9px;
        }

        .login-divider::before,
        .login-divider::after {
            content: "";
            flex: 1;
            height: 1px;
            background: #eceef2;
        }

        .google-signin {
            width: 100%;
            height: 39px;
            border: 1px solid #e9ebef;
            border-radius: 5px;
            color: #555a66;
            background: #fff;
            font-size: 10px;
            font-weight: 700;
        }

        .google-signin i {
            margin-right: 8px;
            color: #4285f4;
            font-size: 12px;
        }

        .login-register {
            margin: 17px 0 0;
            color: #8c9099;
            text-align: center;
            font-size: 10px;
        }

        .login-register a {
            color: #ef3832;
            font-weight: 800;
            text-decoration: none;
        }

        .selected-role,
        .error-message {
            display: block;
            margin-top: 11px;
            text-align: center;
            font-size: 10px;
        }

        .selected-role {
            color: #858993;
        }

        .selected-role span {
            color: #e9342f;
            font-weight: 800;
        }

        .error-message {
            color: #d62320;
            font-weight: 600;
        }

        @media (max-width: 767.98px) {
            .portal-login-page {
                align-items: flex-start;
                padding: 24px 14px;
            }

            .portal-login-shell {
                grid-template-columns: 1fr;
            }

            .login-showcase {
                min-height: auto;
                padding: 32px 30px 48px;
            }

            .showcase-brand {
                margin-bottom: 35px;
            }

            .login-showcase::before {
                bottom: -120px;
            }

            .login-form-panel {
                padding: 34px 28px 40px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="portal-login-page">
        <section class="portal-login-shell" aria-label="Placement portal sign in">
            <aside class="login-showcase">
                <div class="showcase-brand">
                    <img src="assets/images/RKU LOGO.png" alt="RK University">
                    <div>RK UNIVERSITY<span>PLACEMENT PORTAL</span></div>
                </div>

                <h1 class="showcase-title">Welcome <em>Back!</em></h1>
                <p class="showcase-text">Log in to continue your placement journey and unlock opportunities.</p>
                <div class="showcase-line"></div>

                <div class="showcase-stats">
                    <div class="showcase-stat">
                        <i class="fa-solid fa-user-graduate"></i><strong>5000+</strong><span>Students Placed</span>
                    </div>
                    <div class="showcase-stat">
                        <i class="fa-solid fa-building"></i><strong>300+</strong><span>Recruiters</span>
                    </div>
                    <div class="showcase-stat">
                        <i class="fa-solid fa-award"></i><strong>20 LPA</strong><span>Highest Package</span>
                    </div>
                </div>
            </aside>

            <section class="login-form-panel">
                <div class="login-form-content">
                    <h2 class="login-heading">Sign In</h2>
                    <p class="login-intro">Enter your credentials to access your account.</p>

                    <asp:HiddenField ID="hfSelectedRole" runat="server" Value="student" />

                    <label class="login-section-label">Select Role</label>
                    <div class="login-role-buttons">
                        <asp:Button ID="btnStudent" runat="server" Text="Student" CssClass="login-role-btn active" UseSubmitBehavior="false" OnClientClick="selectRole('student'); return false;" />
                        <asp:Button ID="btnCompany" runat="server" Text="Company" CssClass="login-role-btn" UseSubmitBehavior="false" OnClientClick="selectRole('company'); return false;" />
                        <asp:Button ID="btnAdmin" runat="server" Text="Admin" CssClass="login-role-btn" UseSubmitBehavior="false" OnClientClick="selectRole('admin'); return false;" />
                    </div>

                    <div class="login-field">
                        <i class="fa-regular fa-envelope"></i>
                        <asp:TextBox ID="txtemail" runat="server" CssClass="login-input" TextMode="Email" placeholder="Email or enrollment number" autocomplete="off"></asp:TextBox>
                    </div>

                    <div class="login-field">
                        <i class="fa-solid fa-lock"></i>
                        <asp:TextBox ID="txtpassword" runat="server" CssClass="login-input" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                        <button type="button" class="password-toggle" onclick="togglePassword()" aria-label="Show or hide password"><i class="fa-regular fa-eye"></i></button>
                    </div>

                    <div class="login-options">
                        <label class="remember-login"><input type="checkbox"> Remember me</label>
                        <a class="forgot-password" href="ForgotPassword.aspx">Forgot Password?</a>
                    </div>

                    <asp:Button ID="Button1" runat="server" Text="Sign In" CssClass="login-submit" OnClick="Button1_Click" UseSubmitBehavior="false" />

                    <div class="login-divider">or continue with</div>
                    <button type="button" class="google-signin"><i class="fa-brands fa-google"></i>Sign in with Google</button>
                    <p class="login-register">Don't have an account? <a href="Register.aspx">Register Now</a></p>

                    <div class="selected-role">Login as: <span><asp:Label ID="lblSelectedRole" runat="server" Text="Student"></asp:Label></span></div>
                    <asp:Label ID="lblMsg" runat="server" CssClass="error-message"></asp:Label>
                </div>
            </section>
        </section>
    </main>

    <script>
        function togglePassword() {
            var password = document.getElementById('<%= txtpassword.ClientID %>');
            var icon = document.querySelector('.password-toggle i');
            var isPassword = password.type === 'password';
            password.type = isPassword ? 'text' : 'password';
            icon.className = isPassword ? 'fa-regular fa-eye-slash' : 'fa-regular fa-eye';
        }

        function selectRole(role) {
            document.getElementById('<%= hfSelectedRole.ClientID %>').value = role;

            var student = document.getElementById('<%= btnStudent.ClientID %>');
            var company = document.getElementById('<%= btnCompany.ClientID %>');
            var admin = document.getElementById('<%= btnAdmin.ClientID %>');
            var selectedRole = document.getElementById('<%= lblSelectedRole.ClientID %>');

            student.className = 'login-role-btn';
            company.className = 'login-role-btn';
            admin.className = 'login-role-btn';

            if (role === 'student') {
                student.className = 'login-role-btn active';
                selectedRole.innerText = 'Student';
            } else if (role === 'company') {
                company.className = 'login-role-btn active';
                selectedRole.innerText = 'Company';
            } else {
                admin.className = 'login-role-btn active';
                selectedRole.innerText = 'Admin';
            }
        }
    </script>
</asp:Content>
