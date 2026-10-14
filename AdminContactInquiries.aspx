<%@ Page Title="Contact Inquiries | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminContactInquiries.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminContactInquiries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --rku-red: #e03627;
            --rku-red-dark: #c5281b;
            --rku-maroon: #991b1b;
            --rku-dark: #0f172a;
        }

        .directory-hero-card {
            background: #ffffff;
            border: 1px solid #eef0f3;
            border-radius: 16px;
            padding: 1.5rem 1.85rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            margin-top: 0.25rem;
            margin-bottom: 1.5rem;
        }

        .directory-hero-kicker {
            font-size: 0.75rem;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--rku-red);
            font-weight: 800;
            margin-bottom: 0.35rem;
        }

        .directory-hero-card h2 {
            font-family: var(--font-heading);
            font-weight: 800;
            color: #0f172a !important;
            font-size: 1.75rem;
            letter-spacing: -0.01em;
            margin-bottom: 0.35rem;
        }

        .directory-hero-card p {
            color: #64748b !important;
            font-size: 0.92rem;
            line-height: 1.55;
            margin-bottom: 0;
            max-width: 650px;
        }

        .hero-stat-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 0.55rem 1.15rem;
            border-radius: 12px;
            font-size: 0.85rem;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .hero-stat-badge.inquiry-badge {
            background: #fef2f2;
            color: #e03627;
            border: 1px solid #fee2e2;
        }

        /* Main Card Container */
        .dir-main-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(15, 23, 42, 0.03);
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

        .dir-main-card-head {
            padding: 1.15rem 1.5rem;
            background: #ffffff;
            border-bottom: 1px solid #edf2f7;
        }

        /* Custom Table Styling */
        .dir-table {
            margin-bottom: 0;
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .dir-table thead th {
            background: #f8fafc !important;
            color: #475569 !important;
            font-weight: 700 !important;
            font-size: 0.78rem !important;
            text-transform: uppercase !important;
            letter-spacing: 0.06em !important;
            padding: 1rem 1.15rem !important;
            border-top: none !important;
            border-bottom: 2px solid #e2e8f0 !important;
            vertical-align: middle;
            white-space: nowrap;
        }

        .dir-table tbody td {
            padding: 1.05rem 1.15rem !important;
            vertical-align: middle;
            border-bottom: 1px solid #f1f5f9;
            background: #ffffff;
            font-size: 0.88rem;
            transition: background 0.15s ease;
        }

        .dir-table tbody tr:hover td {
            background-color: #f8fafc !important;
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
            padding: 0.4rem 0.75rem;
            border-radius: 8px;
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
        }

        .btn-action-delete {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            font-size: 0.78rem;
            font-weight: 600;
            padding: 0.4rem 0.75rem;
            border-radius: 8px;
            background: #fef2f2;
            color: #e03627;
            border: 1px solid #fee2e2;
            transition: all 0.2s ease;
            text-decoration: none;
            cursor: pointer;
            white-space: nowrap;
        }

        .btn-action-delete:hover {
            background: #e03627;
            color: #ffffff;
            border-color: #e03627;
        }

        /* Avatar styling */
        .student-table-avatar-fallback {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: linear-gradient(135deg, #e03627, #c5281b);
            color: #ffffff;
            font-size: 0.95rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 6px rgba(224, 54, 39, 0.2);
            flex-shrink: 0;
        }

        .drawer-avatar-fallback {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(135deg, #e03627, #c5281b);
            color: #ffffff;
            font-size: 1.6rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 3px solid #ffffff;
            box-shadow: 0 4px 12px rgba(224, 54, 39, 0.2);
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

    <!-- Hero Header Banner (Matching AdminStudentDirectory design) -->
    <div class="directory-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-7">
                <div class="directory-hero-kicker">
                    <i class="fa-solid fa-envelope-open-text me-1"></i> SUPPORT &amp; INQUIRIES
                </div>
                <h2>Contact Inquiries Management</h2>
                <p>
                    Review, search, and manage all contact form submissions, student questions, and visitor feedback submitted to the placement cell.
                </p>
            </div>
            <div class="col-lg-5 text-lg-end d-flex gap-2 justify-content-lg-end flex-wrap">
                <span class="hero-stat-badge inquiry-badge shadow-sm">
                    <i class="fa-solid fa-inbox"></i> Total Inquiries: <strong><asp:Label ID="lblInquiryCount" runat="server" Text="0"></asp:Label></strong>
                </span>
            </div>
        </div>
    </div>

    <!-- Main Card Container -->
    <div class="dir-main-card">
        <div class="dir-main-card-head">
            <div class="row g-2 justify-content-between align-items-center">
                <div class="col-md-5">
                    <h6 class="fw-bold mb-0 text-dark font-heading">
                        <i class="fa-solid fa-envelope me-2" style="color: #e03627;"></i>Inquiry Submissions
                    </h6>
                </div>
                <div class="col-md-7 d-flex gap-2 flex-wrap flex-sm-nowrap justify-content-end">
                    <div class="input-group input-group-sm" style="max-width: 320px;">
                        <span class="input-group-text bg-white border-end-0 text-muted"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <input type="text" class="form-control form-control-sm border-start-0" id="inquirySearchInput" placeholder="Search by name, email, subject..." onkeyup="filterInquiryTable()">
                    </div>
                    <select class="form-select form-select-sm" id="inquiryDeptFilter" onchange="filterInquiryTable()" style="border-radius: 8px; min-width: 150px; max-width: 220px;">
                        <option value="all">All Departments</option>
                        <option value="Placement">Training &amp; Placement</option>
                        <option value="Admission">Admission Office</option>
                        <option value="Academic">Academic Affairs</option>
                        <option value="Examinations">Examinations</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                CssClass="table align-middle dir-table" GridLines="None"
                OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Inquiry ID">
                        <HeaderStyle Width="11%" />
                        <ItemTemplate>
                            <div>
                                <span class="roll-badge">#<%# Eval("Id") %></span>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Sender Details">
                        <HeaderStyle Width="27%" />
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-3">
                                <div class="student-table-avatar-fallback">
                                    <%# Eval("Name") != DBNull.Value && Eval("Name").ToString().Trim().Length > 0 ? Eval("Name").ToString().Trim().Substring(0, 1).ToUpper() : "U" %>
                                </div>
                                <div>
                                    <div class="fw-bold font-heading text-dark" style="font-size: 0.92rem;"><%# Eval("Name") %></div>
                                    <div class="text-muted small mt-0.5" style="font-size: 0.78rem;">
                                        <i class="fa-regular fa-envelope me-1" style="color: #e03627;"></i>
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
                                <i class="fa-solid fa-building-columns me-1" style="color: #e03627;"></i><%# Eval("Department") != DBNull.Value && !string.IsNullOrEmpty(Eval("Department").ToString()) ? Eval("Department") : "General" %>
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
                                    <i class="fa-regular fa-envelope-open"></i>View
                                </button>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_del"
                                    CssClass="btn-action-delete"
                                    OnClientClick="return confirm('Are you sure you want to delete this inquiry?');"
                                    title="Delete Inquiry">
                                    <i class="fa-regular fa-trash-can"></i>Delete
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
                <span class="directory-hero-kicker d-block mb-1">INQUIRY TICKET</span>
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
                    <i class="fa-solid fa-address-book me-2" style="color: #e03627;"></i>Contact Information
                </h6>
                <div class="row g-2 small">
                    <div class="col-12">
                        <span class="text-muted d-block">Email Address:</span>
                        <a href="#" id="drawerEmailLink" class="fw-semibold text-decoration-none" style="color: #e03627;">email@example.com</a>
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
                    <i class="fa-solid fa-tag me-2" style="color: #e03627;"></i>Subject
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
                <a href="#" id="drawerReplyMailBtn" class="btn text-white py-2.5 rounded-pill fw-semibold shadow-sm text-center" style="background: linear-gradient(135deg, #e03627, #c5281b);">
                    <i class="fa-solid fa-reply me-2"></i>Reply via Email
                </a>
                <button type="button" class="btn btn-light border py-2 rounded-pill fw-semibold text-secondary" data-bs-dismiss="offcanvas">
                    Close
                </button>
            </div>

        </div>
    </div>

    <!-- JavaScript for Client-Side Filtering and Side Drawer -->
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

        // Live Table Search & Filter
        function filterInquiryTable() {
            const query = (document.getElementById('inquirySearchInput').value || '').toLowerCase().trim();
            const deptFilter = (document.getElementById('inquiryDeptFilter').value || 'all').toLowerCase();
            const table = document.getElementById('<%= GridView1.ClientID %>');
            if (!table) return;

            const rows = table.getElementsByTagName('tr');
            // Skip the header row (index 0)
            for (let i = 1; i < rows.length; i++) {
                const row = rows[i];
                // Ignore empty-data row if present
                if (row.cells.length <= 1) continue;

                const text = row.innerText.toLowerCase();
                const matchesSearch = !query || text.includes(query);

                let matchesDept = true;
                if (deptFilter !== 'all') {
                    const deptCellText = (row.cells[2] ? row.cells[2].innerText : '').toLowerCase();
                    matchesDept = deptCellText.includes(deptFilter);
                }

                if (matchesSearch && matchesDept) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            }
        }
    </script>
</asp:Content>
