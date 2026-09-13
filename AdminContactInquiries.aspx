<%@ Page Title="Contact Inquiries | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminContactInquiries.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminContactInquiries" %>

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
        .avatar-circle {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background-color: #ef3724;
            color: white;
            font-weight: 700;
            font-size: 0.85rem;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="dashboard-card border-0 rounded-3 p-4 bg-white shadow-sm">
        <div class="d-flex justify-content-between align-items-center mb-4 pb-3 border-bottom">
            <div>
                <h5 class="fw-bold mb-1 text-dark">
                    <i class="fa-regular fa-envelope text-rku-red me-2"></i>Contact Inquiries
                </h5>
                <p class="text-muted small mb-0">View and manage all contact form submissions from students and visitors.</p>
            </div>
            <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-3 py-2 rounded-pill">
                <i class="fa-solid fa-inbox me-1"></i>Inquiries Portal
            </span>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                CssClass="table table-hover align-middle custom-gridview mb-0"
                GridLines="None" UseAccessibleHeader="true" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="ID" ItemStyle-Width="60px">
                        <ItemTemplate>
                            <span class="badge bg-light text-dark border font-monospace px-2 py-1">
                                #<%# Eval("Id") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Sender Name">
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-2">
                                <div class="avatar-circle">
                                    <%# Eval("Name") != DBNull.Value && !string.IsNullOrEmpty(Eval("Name").ToString()) ? Eval("Name").ToString().Substring(0, 1).ToUpper() : "U" %>
                                </div>
                                <span class="fw-semibold text-dark"><%# Eval("Name") %></span>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Contact Info">
                        <ItemTemplate>
                            <div>
                                <div class="text-dark small"><i class="fa-regular fa-envelope me-1 text-muted"></i><%# Eval("Email") %></div>
                                <div class="text-muted small"><i class="fa-solid fa-phone me-1 text-muted"></i><%# Eval("Mobile") %></div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Department">
                        <ItemTemplate>
                            <span class="badge bg-light text-dark border px-2.5 py-1.5 rounded-2">
                                <i class="fa-solid fa-building me-1 text-rku-maroon"></i><%# Eval("Department") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Subject & Message">
                        <ItemTemplate>
                            <div>
                                <div class="fw-bold text-dark mb-1 small"><%# Eval("Subject") %></div>
                                <div class="text-secondary small text-truncate" style="max-width: 250px;" title='<%# Eval("Message") %>'>
                                    <%# Eval("Message") %>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="100px" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_del"
                                CssClass="btn btn-outline-danger btn-sm rounded-pill px-3 shadow-none"
                                OnClientClick="return confirm('Are you sure you want to delete this inquiry?');">
                                <i class="fa-solid fa-trash-can me-1"></i>Delete
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EmptyDataTemplate>
                    <div class="text-center py-5 text-muted">
                        <i class="fa-regular fa-folder-open fa-3x mb-3 text-secondary opacity-50"></i>
                        <p class="mb-0 fw-semibold">No contact inquiries found.</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-inquiries');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Contact Inquiries';
        });
    </script>
</asp:Content>
