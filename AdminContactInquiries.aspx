<%@ Page Title="Contact Inquiries | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminContactInquiries.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminContactInquiries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --rku-orange-red: #ef3724;
            --rku-orange-red-dark: #d82b19;
            --rku-dark: #0f172a;
            --rku-gray: #64748b;
            --rku-light: #f8fafc;
            --rku-border: #e2e8f0;
        }

        /* ─── HERO HEADER (Matching AdminDashboard) ─── */
        .dash-hero-card {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            padding: 1.75rem 2rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
            position: relative;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

            .dash-hero-card::before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                bottom: 0;
                width: 6px;
                background: linear-gradient(180deg, var(--rku-orange-red) 0%, var(--rku-orange-red-dark) 100%);
            }

        .hero-badge-red {
            background: rgba(239, 55, 36, 0.08);
            border: 1px solid rgba(239, 55, 36, 0.2);
            color: var(--rku-orange-red);
            font-size: 0.76rem;
            font-weight: 700;
            padding: 0.35rem 0.85rem;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            letter-spacing: 0.5px;
        }

        /* ─── MAIN WHITE CONTAINER CARD ─── */
        .dash-card-white {
            background: #ffffff;
            border: 1px solid var(--rku-border);
            border-radius: 18px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .btn-rku-orange {
            background: linear-gradient(135deg, #ef3724 0%, #d82b19 100%) !important;
            background-color: #ef3724 !important;
            border: 1px solid #d82b19 !important;
            color: #ffffff !important;
            font-weight: 700 !important;
            padding: 0.45rem 1.15rem !important;
            border-radius: 50px !important;
            font-size: 0.82rem !important;
            transition: all 0.25s ease !important;
            text-decoration: none !important;
            display: inline-block !important;
            text-align: center !important;
            box-shadow: 0 4px 14px rgba(239, 55, 36, 0.25) !important;
            cursor: pointer !important;
        }

            .btn-rku-orange:hover {
                background: linear-gradient(135deg, #d82b19 0%, #a30f14 100%) !important;
                background-color: #d82b19 !important;
                border-color: #a30f14 !important;
                color: #ffffff !important;
                transform: translateY(-1px) !important;
                box-shadow: 0 6px 18px rgba(239, 55, 36, 0.35) !important;
            }

        /* ─── CUSTOM DASH TABLE ─── */
        .custom-dash-table {
            border-collapse: separate;
            border-spacing: 0;
            width: 100%;
        }

            .custom-dash-table th {
                background-color: #f8fafc;
                color: var(--rku-dark);
                font-size: 0.74rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.6px;
                padding: 13px 14px;
                border-bottom: 1px solid var(--rku-border);
                white-space: nowrap;
            }

            .custom-dash-table td {
                padding: 13px 14px;
                vertical-align: middle;
                border-bottom: 1px solid #f1f5f9;
                font-size: 0.88rem;
                background: #ffffff;
                transition: background 0.15s ease;
            }

            .custom-dash-table tr:hover td {
                background-color: #fffafa;
            }

            .custom-dash-table tr:last-child td {
                border-bottom: none;
            }

        /* Badges & Tags */
        .roll-badge {
            background: #f8fafc;
            color: #334155;
            font-family: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, monospace;
            font-weight: 700;
            font-size: 0.82rem;
            padding: 4px 8px;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
            display: inline-block;
        }

        .dept-badge {
            display: inline-block;
            background: #f8fafc;
            color: #334155;
            font-size: 0.78rem;
            font-weight: 600;
            padding: 4px 10px;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
            line-height: 1.4;
            max-width: 100%;
        }

        /* Action Buttons */
        .btn-action-profile {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            font-size: 0.78rem;
            font-weight: 600;
            padding: 0.4rem 0.85rem;
            border-radius: 50px;
            background: #ffffff;
            color: #1e293b;
            border: 1px solid #cbd5e1;
            transition: all 0.2s ease;
            text-decoration: none;
            cursor: pointer;
            white-space: nowrap;
        }

            .btn-action-profile:hover {
                background: #0f172a;
                color: #ffffff;
                border-color: #0f172a;
                transform: translateY(-1px);
            }

        .btn-action-delete {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            font-size: 0.78rem;
            font-weight: 600;
            padding: 0.4rem 0.85rem;
            border-radius: 50px;
            background: #fef2f2;
            color: var(--rku-orange-red);
            border: 1px solid #fee2e2;
            transition: all 0.2s ease;
            text-decoration: none;
            cursor: pointer;
            white-space: nowrap;
        }

            .btn-action-delete:hover {
                background: var(--rku-orange-red);
                color: #ffffff;
                border-color: var(--rku-orange-red);
                transform: translateY(-1px);
            }

        /* Avatar styling */
        .candidate-avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--rku-orange-red) 0%, var(--rku-orange-red-dark) 100%);
            color: #ffffff;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 0.9rem;
            flex-shrink: 0;
            box-shadow: 0 2px 6px rgba(239, 55, 36, 0.25);
        }

        .drawer-avatar-fallback {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--rku-orange-red) 0%, var(--rku-orange-red-dark) 100%);
            color: #ffffff;
            font-size: 1.6rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 3px solid #ffffff;
            box-shadow: 0 4px 12px rgba(239, 55, 36, 0.2);
        }

        .drawer-detail-card {
            background: #f8fafc;
            border-radius: 14px;
            padding: 1.15rem;
            border: 1px solid #e2e8f0;
        }

        .offcanvas-profile-drawer {
            width: 460px !important;
            border-left: 1px solid #e2e8f0;
            box-shadow: -5px 0 30px rgba(0,0,0,0.1);
        }

        @media (max-width: 768px) {
            .offcanvas-profile-drawer {
                width: 100% !important;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header Banner (Matching AdminDashboard) -->
    <div class="dash-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="d-inline-flex align-items-center gap-2 mb-2">
                    <span class="hero-badge-red">
                        <i class="fa-solid fa-envelope-open-text me-1"></i>SUPPORT &amp; INQUIRIES
                    </span>
                    <span class="badge bg-light text-dark border rounded-pill px-2.5 py-1 small fw-bold" style="font-size: 0.72rem;">
                        <i class="fa-solid fa-circle text-success me-1" style="font-size: 0.55rem;"></i>Active Helpdesk
                    </span>
                </div>
                <h2 class="fw-extrabold text-dark mb-1 font-heading" style="font-size: 1.75rem; letter-spacing: -0.02em;">
                    Contact Inquiries Management
                </h2>
                <p class="text-muted mb-0 small" style="max-width: 650px; font-size: 0.88rem; line-height: 1.5;">
                    Review, search, and manage all contact form submissions, student questions, and visitor feedback submitted to the placement cell.
                </p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <div class="d-inline-flex align-items-center gap-3 p-2 rounded-4 bg-light border">
                    <div class="text-lg-end d-none d-lg-block ps-2">
                        <div class="fw-bold text-dark" style="font-size: 0.92rem;">Total Inquiries</div>
                        <div class="text-muted small" style="font-size: 0.78rem;">Live Form Submissions</div>
                    </div>
                    <div class="avatar-circle text-white fw-extrabold rounded-circle d-flex align-items-center justify-content-center shadow-sm" style="width: 46px; height: 46px; font-size: 1.05rem; background: linear-gradient(135deg, #ef3724, #d82b19);">
                        <asp:Label ID="lblInquiryCount" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Card Container (Matching AdminDashboard) -->
    <div class="dash-card-white">
        <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 pb-3 mb-3 border-bottom">
            <div>
                <h6 class="fw-bold mb-1 text-dark font-heading" style="font-size: 1.05rem;">
                    <i class="fa-solid fa-envelope me-2" style="color: var(--rku-orange-red);"></i>Inquiry Submissions
                </h6>
                <div class="text-muted small" style="font-size: 0.8rem;">
                    Search and filter visitor questions and student queries
                </div>
            </div>
            <div class="d-flex gap-2 flex-wrap flex-sm-nowrap align-items-center">
                <div class="input-group input-group-sm" style="max-width: 290px;">
                    <span class="input-group-text bg-white border-end-0 text-muted"><i class="fa-solid fa-magnifying-glass"></i></span>
                    <asp:TextBox ID="inquirySearchInput" runat="server" CssClass="form-control form-control-sm border-start-0" placeholder="Search name, email, subject..."></asp:TextBox>
                </div>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-sm btn-rku-orange px-3 rounded-pill" />
                <asp:DropDownList ID="inquiryDeptFilter" runat="server" CssClass="form-select form-select-sm" AutoPostBack="true" OnSelectedIndexChanged="inquiryDeptFilter_SelectedIndexChanged" Style="border-radius: 8px; min-width: 150px; max-width: 200px;">
                    <asp:ListItem Value="all" Text="All Departments" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Placement" Text="Training &amp; Placement"></asp:ListItem>
                    <asp:ListItem Value="Admission" Text="Admission Office"></asp:ListItem>
                    <asp:ListItem Value="Academic" Text="Academic Affairs"></asp:ListItem>
                    <asp:ListItem Value="Examinations" Text="Examinations"></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CssClass="btn btn-sm btn-light border px-3 rounded-pill" />
            </div>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                CssClass="table align-middle custom-dash-table mb-0" GridLines="None"
                OnRowCommand="GridView1_RowCommand" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:TemplateField HeaderText="Inquiry ID">
                        <HeaderStyle Width="11%" />
                        <ItemTemplate>
                            <span class="roll-badge">#<%# Eval("Id") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Sender Details">
                        <HeaderStyle Width="27%" />
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-3">
                                <div class="candidate-avatar">
                                    <%# Eval("Name") != DBNull.Value && Eval("Name").ToString().Trim().Length > 0 ? Eval("Name").ToString().Trim().Substring(0, 1).ToUpper() : "U" %>
                                </div>
                                <div>
                                    <div class="fw-bold font-heading text-dark" style="font-size: 0.92rem;"><%# Eval("Name") %></div>
                                    <div class="text-muted small mt-0.5" style="font-size: 0.78rem;">
                                        <i class="fa-regular fa-envelope me-1" style="color: var(--rku-orange-red);"></i>
                                        <a href='mailto:<%# Eval("Email") %>' class="text-secondary text-decoration-none" title="Send email"><%# Eval("Email") %></a>
                                    </div>
                                    <div class="text-muted small" style="font-size: 0.78rem;">
                                        <i class="fa-solid fa-phone me-1 text-secondary"></i><%# Eval("Mobile") %>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Department">
                        <HeaderStyle Width="18%" />
                        <ItemTemplate>
                            <span class="dept-badge">
                                <i class="fa-solid fa-building-columns me-1" style="color: var(--rku-orange-red);"></i><%# Eval("Department") != DBNull.Value && !string.IsNullOrEmpty(Eval("Department").ToString()) ? Eval("Department") : "General" %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Subject &amp; Message">
                        <HeaderStyle Width="30%" />
                        <ItemTemplate>
                            <div class="fw-bold font-heading text-dark" style="font-size: 0.88rem;"><%# Eval("Subject") %></div>
                            <div class="text-secondary small mt-1 text-truncate" style="max-width: 320px; font-size: 0.82rem; line-height: 1.45;" title='<%# Eval("Message") %>'>
                                <%# Eval("Message") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <HeaderStyle Width="14%" />
                        <ItemTemplate>
                            <div class="d-flex justify-content-center gap-1.5">
                                <button type="button" class="btn-action-profile"
                                    data-id='<%# Eval("Id") %>'
                                    data-name='<%# HttpUtility.HtmlAttributeEncode(Eval("Name") != null ? Eval("Name").ToString() : "") %>'
                                    data-email='<%# HttpUtility.HtmlAttributeEncode(Eval("Email") != null ? Eval("Email").ToString() : "") %>'
                                    data-mobile='<%# HttpUtility.HtmlAttributeEncode(Eval("Mobile") != null ? Eval("Mobile").ToString() : "") %>'
                                    data-department='<%# HttpUtility.HtmlAttributeEncode(Eval("Department") != null ? Eval("Department").ToString() : "") %>'
                                    data-subject='<%# HttpUtility.HtmlAttributeEncode(Eval("Subject") != null ? Eval("Subject").ToString() : "") %>'
                                    data-message='<%# HttpUtility.HtmlAttributeEncode(Eval("Message") != null ? Eval("Message").ToString() : "") %>'
                                    onclick="viewInquiryFromBtn(this);"
                                    title="View Full Message in Side Drawer">
                                    <i class="fa-regular fa-envelope-open me-1"></i>View
                                </button>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_del"
                                    CssClass="btn-action-delete"
                                    OnClientClick="return confirm('Are you sure you want to delete this inquiry?');"
                                    title="Delete Inquiry">
                                    <i class="fa-regular fa-trash-can me-1"></i>Delete
                                </asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EmptyDataTemplate>
                    <div class="text-center text-muted small py-5">
                        <i class="fa-regular fa-folder-open text-muted opacity-25 mb-3" style="font-size: 3rem;"></i>
                        <h6 class="fw-bold text-dark font-heading">No contact inquiries found</h6>
                        <p class="text-muted small">New inquiries submitted from the website contact page will appear here.</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>

    <!-- ==================== OFFCANVAS SIDE DRAWER FOR INQUIRY DETAILS ==================== -->
    <div class="offcanvas offcanvas-end offcanvas-profile-drawer" tabindex="-1" id="inquiryProfileDrawer">
        <div class="offcanvas-header border-bottom py-3 px-4">
            <div>
                <span class="hero-badge-red d-inline-block mb-1">INQUIRY TICKET</span>
                <h5 class="offcanvas-title fw-bold text-dark font-heading mb-0">
                    Inquiry #<span id="drawerInquiryId"></span>
                </h5>
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body p-4">
            
            <!-- Sender Header Card -->
            <div class="d-flex align-items-center gap-3 mb-4 p-3 bg-light rounded-3 border">
                <div class="drawer-avatar-fallback" id="drawerAvatarFallback">
                    U
                </div>
                <div class="flex-grow-1 overflow-hidden">
                    <h5 class="fw-bold text-dark mb-0 font-heading" id="drawerSenderName">Sender Name</h5>
                    <div class="mt-1">
                        <span class="dept-badge" id="drawerDepartment">Department</span>
                    </div>
                </div>
            </div>

            <!-- Contact Information Card -->
            <div class="drawer-detail-card mb-3">
                <h6 class="fw-bold text-dark small mb-3">
                    <i class="fa-solid fa-address-book me-2" style="color: var(--rku-orange-red);"></i>Contact Information
                </h6>
                <div class="row g-2 small">
                    <div class="col-12">
                        <span class="text-muted d-block">Email Address:</span>
                        <a href="#" id="drawerEmailLink" class="fw-semibold text-decoration-none" style="color: var(--rku-orange-red);">email@example.com</a>
                    </div>
                    <div class="col-12 mt-2">
                        <span class="text-muted d-block">Contact Number:</span>
                        <a href="#" id="drawerMobileLink" class="fw-semibold text-dark text-decoration-none">+91 00000 00000</a>
                    </div>
                </div>
            </div>

            <!-- Subject Card -->
            <div class="drawer-detail-card mb-3">
                <h6 class="fw-bold text-dark small mb-2">
                    <i class="fa-solid fa-tag me-2" style="color: var(--rku-orange-red);"></i>Subject
                </h6>
                <div class="fw-semibold text-dark small" id="drawerSubject">Subject Text</div>
            </div>

            <!-- Full Message Card -->
            <div class="drawer-detail-card mb-4">
                <h6 class="fw-bold text-dark small mb-2">
                    <i class="fa-regular fa-comment-dots text-primary me-2"></i>Inquiry Message
                </h6>
                <div class="p-3 bg-white rounded-3 border text-secondary small" id="drawerMessage" style="white-space: pre-wrap; line-height: 1.6; max-height: 250px; overflow-y: auto;">
                    Message content goes here...
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="d-flex flex-column gap-2">
                <a href="#" id="drawerReplyMailBtn" class="btn text-white py-2.5 rounded-pill fw-semibold shadow-sm text-center" style="background: linear-gradient(135deg, #ef3724, #d82b19); border: none;">
                    <i class="fa-solid fa-reply me-2"></i>Reply via Email
                </a>
                <button type="button" class="btn btn-light border py-2 rounded-pill fw-semibold text-secondary" data-bs-dismiss="offcanvas">
                    Close
                </button>
            </div>

        </div>
    </div>

    <!-- JavaScript for Client-Side Side Drawer -->
    <script>
        let inquiryDrawerInst = null;

        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-inquiries');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Contact Inquiries';
        });

        function viewInquiryFromBtn(btn) {
            const id = btn.getAttribute('data-id') || '';
            const name = btn.getAttribute('data-name') || 'Sender';
            const email = btn.getAttribute('data-email') || '';
            const mobile = btn.getAttribute('data-mobile') || '';
            const department = btn.getAttribute('data-department') || 'General';
            const subject = btn.getAttribute('data-subject') || 'No Subject';
            const message = btn.getAttribute('data-message') || 'No message content.';

            document.getElementById('drawerInquiryId').innerText = id;
            document.getElementById('drawerSenderName').innerText = name;
            document.getElementById('drawerDepartment').innerText = department;
            document.getElementById('drawerSubject').innerText = subject;
            document.getElementById('drawerMessage').innerText = message;

            // Avatar initial
            const initials = name.trim().length > 0 ? name.trim().charAt(0).toUpperCase() : 'U';
            document.getElementById('drawerAvatarFallback').innerText = initials;

            // Email link
            const emailLink = document.getElementById('drawerEmailLink');
            emailLink.innerText = email || 'Not provided';
            emailLink.href = email ? ('mailto:' + email) : '#';

            // Mobile link
            const mobLink = document.getElementById('drawerMobileLink');
            mobLink.innerText = mobile || 'Not provided';
            mobLink.href = mobile ? ('tel:' + mobile) : '#';

            // Reply button
            const replyBtn = document.getElementById('drawerReplyMailBtn');
            if (email) {
                const subjectEncoded = encodeURIComponent('Re: ' + subject + ' - RKU Placement Cell');
                replyBtn.href = 'mailto:' + email + '?subject=' + subjectEncoded;
                replyBtn.classList.remove('disabled');
            } else {
                replyBtn.href = '#';
                replyBtn.classList.add('disabled');
            }

            // Open Bootstrap Offcanvas Drawer
            const drawerEl = document.getElementById('inquiryProfileDrawer');
            if (!inquiryDrawerInst) {
                inquiryDrawerInst = new bootstrap.Offcanvas(drawerEl);
            }
            inquiryDrawerInst.show();
        }
    </script>
</asp:Content>
