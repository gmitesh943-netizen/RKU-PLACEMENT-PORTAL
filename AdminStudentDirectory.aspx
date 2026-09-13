<%@ Page Title="Users & Companies | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminStudentDirectory.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminStudentDirectory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .custom-gridview {
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #e9ecef;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
        }
        .custom-gridview th {
            background-color: #ef3724 !important;
            color: #ffffff !important;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
            padding: 14px 16px !important;
            border: none !important;
        }
        .custom-gridview td {
            padding: 12px 16px !important;
            vertical-align: middle;
            font-size: 0.88rem;
            border-bottom: 1px solid #f1f3f5 !important;
        }
        .custom-gridview tr:hover {
            background-color: #f8f9fa !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Student Registration Directory Card -->
    <div class="dashboard-card border-0 rounded-3 p-4 bg-white shadow-sm mb-4">
        <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom">
            <div>
                <h5 class="fw-bold mb-1 text-dark">
                    <i class="fa-solid fa-user-graduate text-rku-red me-2"></i>Student Registration Directory
                </h5>
                <p class="text-muted small mb-0">View and manage all registered students in the portal.</p>
            </div>
            <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-3 py-2 rounded-pill">
                <i class="fa-solid fa-users me-1"></i>Students
            </span>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                CssClass="table table-hover align-middle custom-gridview mb-0"
                GridLines="None" UseAccessibleHeader="true" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("regFullName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Enrollment">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("regRollNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("regEmail") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mobile">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("regMobile") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Username">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("regUsername") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Profile">
                        <ItemTemplate>
                            <button type="button" class="btn btn-outline-info btn-sm rounded-pill px-3 shadow-none"
                                onclick="showStudentModal('<%# Eval("regFullName") %>', '<%# Eval("regRollNo") %>', '<%# Eval("regEmail") %>', '<%# Eval("regMobile") %>', '<%# Eval("regUsername") %>')">
                                <i class="fa-solid fa-id-card me-1"></i>Profile
                            </button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_del"
                                CssClass="btn btn-outline-danger btn-sm rounded-pill px-3 shadow-none"
                                OnClientClick="return confirm('Are you sure you want to delete this student?');">
                                <i class="fa-solid fa-trash-can me-1"></i>Delete
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EmptyDataTemplate>
                    <div class="text-center py-5 text-muted">
                        <i class="fa-solid fa-user-slash fa-3x mb-3 text-secondary opacity-50"></i>
                        <p class="mb-0 fw-semibold">No students registered yet.</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>

    <!-- Company Registration Directory Card -->
    <div class="dashboard-card border-0 rounded-3 p-4 bg-white shadow-sm">
        <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom">
            <div>
                <h5 class="fw-bold mb-1 text-dark">
                    <i class="fa-regular fa-building text-rku-red me-2"></i>Company Registration Directory
                </h5>
                <p class="text-muted small mb-0">View and manage all registered recruiter companies in the portal.</p>
            </div>
            <span class="badge bg-dark text-white border border-dark px-3 py-2 rounded-pill">
                <i class="fa-solid fa-briefcase me-1"></i>Recruiters
            </span>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%"
                CssClass="table table-hover align-middle custom-gridview mb-0"
                GridLines="None" UseAccessibleHeader="true" OnRowCommand="GridView2_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CompanyName">
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("compName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="HRName">
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("compHRName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("compEmail") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mobile">
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("compMobile") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Username">
                        <ItemTemplate>
                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("compUsername") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Profile">
                        <ItemTemplate>
                            <button type="button" class="btn btn-outline-info btn-sm rounded-pill px-3 shadow-none"
                                onclick="showCompanyModal('<%# Eval("compName") %>', '<%# Eval("compHRName") %>', '<%# Eval("compEmail") %>', '<%# Eval("compMobile") %>', '<%# Eval("compUsername") %>')">
                                <i class="fa-solid fa-building me-1"></i>Profile
                            </button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_cdel"
                                CssClass="btn btn-outline-danger btn-sm rounded-pill px-3 shadow-none"
                                OnClientClick="return confirm('Are you sure you want to delete this company?');">
                                <i class="fa-solid fa-trash-can me-1"></i>Delete
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EmptyDataTemplate>
                    <div class="text-center py-5 text-muted">
                        <i class="fa-regular fa-building fa-3x mb-3 text-secondary opacity-50"></i>
                        <p class="mb-0 fw-semibold">No companies registered yet.</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>

    <!-- Student Full Profile Modal -->
    <div class="modal fade" id="adminStudentModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content border-0 shadow">
                <div class="modal-header bg-rku-maroon text-white">
                    <h5 class="modal-title font-heading fw-bold"><i class="fa-solid fa-user-graduate me-2"></i>Student Full Profile Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4" id="adminStudentModalBody"></div>
                <div class="modal-footer bg-light py-2">
                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Company Full Profile Modal -->
    <div class="modal fade" id="adminCompanyModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content border-0 shadow">
                <div class="modal-header bg-dark text-white">
                    <h5 class="modal-title font-heading fw-bold"><i class="fa-regular fa-building me-2 text-rku-red"></i>Company Profile Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4" id="adminCompanyModalBody"></div>
                <div class="modal-footer bg-light py-2">
                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        let studentModalInst = null;
        let companyModalInst = null;

        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-students');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Users & Companies Directory';
        });

        function showStudentModal(name, roll, email, mobile, username) {
            const dbUser = (typeof PortalDB !== 'undefined') ? PortalDB.getUser(username) : null;
            const fullName = name || (dbUser ? dbUser.name : 'Student');
            const rollNo = roll || (dbUser ? dbUser.enrollment : username);
            const emailAddr = email || (dbUser ? dbUser.email : '-');
            const mobileNo = mobile || (dbUser ? dbUser.mobile : '-');
            const branch = dbUser ? (dbUser.branch || 'Computer Engineering') : 'Engineering / IT';
            const cgpa = dbUser ? (dbUser.cgpa || '8.50') : '8.0+';
            const skills = dbUser ? (dbUser.skills || 'C#, ASP.NET, SQL Server, HTML, CSS') : 'C#, SQL, Web Development';

            document.getElementById('adminStudentModalBody').innerHTML = `
                <div class="d-flex align-items-center mb-4 pb-3 border-bottom">
                    <div class="rounded-circle d-flex align-items-center justify-content-center me-3 fw-bold text-white"
                         style="width:65px;height:65px;font-size:1.5rem;background:#ef3724;">
                        ${fullName.substring(0,2).toUpperCase()}
                    </div>
                    <div>
                        <h4 class="fw-bold mb-1 text-dark">${fullName}</h4>
                        <div class="text-muted small">
                            <span class="badge bg-danger me-2">STUDENT</span>
                            Roll / Enrollment: <strong class="text-dark font-monospace">${rollNo}</strong>
                        </div>
                    </div>
                </div>
                <div class="row g-3">
                    <div class="col-md-6"><div class="p-3 bg-light rounded border">
                        <div class="text-muted small fw-bold mb-1">Email Address</div>
                        <div class="fw-semibold text-dark">${emailAddr}</div>
                    </div></div>
                    <div class="col-md-6"><div class="p-3 bg-light rounded border">
                        <div class="text-muted small fw-bold mb-1">Mobile Number</div>
                        <div class="fw-semibold text-dark">${mobileNo}</div>
                    </div></div>
                    <div class="col-md-6"><div class="p-3 bg-light rounded border">
                        <div class="text-muted small fw-bold mb-1">Branch / Degree</div>
                        <div class="fw-semibold text-dark">${branch}</div>
                    </div></div>
                    <div class="col-md-6"><div class="p-3 bg-light rounded border">
                        <div class="text-muted small fw-bold mb-1">CGPA / Performance</div>
                        <div class="fw-semibold text-dark">${cgpa}</div>
                    </div></div>
                    <div class="col-12"><div class="p-3 bg-light rounded border">
                        <div class="text-muted small fw-bold mb-1">Technical Skills</div>
                        <div class="fw-semibold text-dark">${skills}</div>
                    </div></div>
                </div>`;
            if (!studentModalInst) studentModalInst = new bootstrap.Modal(document.getElementById('adminStudentModal'));
            studentModalInst.show();
        }

        function showCompanyModal(compName, hrName, email, mobile, username) {
            const cName = compName || 'Company';
            const hr = hrName || 'HR Manager';
            const emailAddr = email || '-';
            const mobileNo = mobile || '-';

            document.getElementById('adminCompanyModalBody').innerHTML = `
                <div class="d-flex align-items-center mb-4 pb-3 border-bottom">
                    <div class="rounded-circle d-flex align-items-center justify-content-center me-3 fw-bold text-white"
                         style="width:65px;height:65px;font-size:1.5rem;background:#111;">
                        <i class="fa-solid fa-building"></i>
                    </div>
                    <div>
                        <h4 class="fw-bold mb-1 text-dark">${cName}</h4>
                        <div class="text-muted small">
                            <span class="badge bg-dark me-2">RECRUITER</span>
                            HR Contact: <strong class="text-dark">${hr}</strong>
                        </div>
                    </div>
                </div>
                <div class="row g-3">
                    <div class="col-md-6"><div class="p-3 bg-light rounded border">
                        <div class="text-muted small fw-bold mb-1">HR Email</div>
                        <div class="fw-semibold text-dark">${emailAddr}</div>
                    </div></div>
                    <div class="col-md-6"><div class="p-3 bg-light rounded border">
                        <div class="text-muted small fw-bold mb-1">Contact Phone</div>
                        <div class="fw-semibold text-dark">${mobileNo}</div>
                    </div></div>
                    <div class="col-md-6"><div class="p-3 bg-light rounded border">
                        <div class="text-muted small fw-bold mb-1">Portal Username</div>
                        <div class="fw-semibold text-dark font-monospace">${username}</div>
                    </div></div>
                    <div class="col-md-6"><div class="p-3 bg-light rounded border">
                        <div class="text-muted small fw-bold mb-1">Account Status</div>
                        <div class="fw-semibold text-success"><i class="fa-solid fa-circle-check me-1"></i>Verified Partner</div>
                    </div></div>
                </div>`;
            if (!companyModalInst) companyModalInst = new bootstrap.Modal(document.getElementById('adminCompanyModal'));
            companyModalInst.show();
        }
    </script>
</asp:Content>
