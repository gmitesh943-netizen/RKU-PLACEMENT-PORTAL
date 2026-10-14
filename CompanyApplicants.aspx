<%@ Page Title="Applicants & Selection | RKU Placement Portal" Language="C#" MasterPageFile="~/Company-Panel.Master" AutoEventWireup="true" CodeBehind="CompanyApplicants.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.CompanyApplicants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Card & Layout Enhancements */
        .page-header-box {
            background: #ffffff;
            border: 1px solid #e9ecef;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.03);
            padding: 1.25rem 1.5rem;
            margin-bottom: 1.25rem;
        }

        .stat-card-custom {
            background: #ffffff;
            border: 1px solid #eef2f6;
            border-radius: 12px;
            padding: 1.1rem 1.25rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
            transition: all 0.25s ease;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

            .stat-card-custom:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 18px rgba(0, 0, 0, 0.06);
            }

        .stat-icon-wrapper {
            width: 48px;
            height: 48px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            flex-shrink: 0;
        }

        .filter-container-box {
            background: #ffffff;
            border: 1px solid #eef2f6;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
            padding: 1.25rem;
            margin-bottom: 1.25rem;
        }

        /* Status Badges */
        .app-status-badge {
            font-size: 0.72rem;
            font-weight: 700;
            padding: 0.35rem 0.75rem;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            text-transform: uppercase;
            letter-spacing: 0.03em;
            white-space: nowrap;
        }

        .status-pending {
            background-color: #fff8e6;
            color: #b78103;
            border: 1px solid #ffe8a3;
        }

        .status-shortlisted {
            background-color: #e8f4fd;
            color: #0369a1;
            border: 1px solid #bae6fd;
        }

        .status-selected {
            background-color: #ecfdf5;
            color: #047857;
            border: 1px solid #a7f3d0;
        }

        .status-rejected {
            background-color: #fef2f2;
            color: #b91c1c;
            border: 1px solid #fecaca;
        }

        .status-under-review {
            background-color: #f1f5f9;
            color: #475569;
            border: 1px solid #cbd5e1;
        }

        /* Tags */
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

        .cgpa-tag {
            background: rgba(163, 15, 20, 0.07);
            color: #a30f14;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 0.78rem;
            display: inline-block;
            margin-top: 3px;
        }

        /* Table Styling */
        .table-custom-applicants {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
        }

            .table-custom-applicants thead th {
                background: #f8fafc;
                color: #475569;
                font-size: 0.75rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.05em;
                padding: 0.85rem 1rem;
                border-top: none;
                border-bottom: 2px solid #e2e8f0;
                vertical-align: middle;
            }

            .table-custom-applicants tbody td {
                padding: 1rem;
                vertical-align: middle;
                border-bottom: 1px solid #f1f5f9;
                background: #ffffff;
                transition: background 0.15s ease;
            }

            .table-custom-applicants tbody tr:hover td {
                background-color: #f8fafc;
            }

        /* Action Buttons */
        .action-btn-circle {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: none;
            font-size: 0.85rem;
            transition: all 0.2s ease;
            text-decoration: none !important;
            flex-shrink: 0;
        }

            .action-btn-circle:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            }

        .btn-save-status {
            background: #2563eb;
            color: #ffffff;
        }

            .btn-save-status:hover {
                background: #1d4ed8;
                color: #ffffff;
            }

        .btn-schedule-round {
            background: #f59e0b;
            color: #ffffff;
        }

            .btn-schedule-round:hover {
                background: #d97706;
                color: #ffffff;
            }

        .btn-resume-pdf {
            background: #ef4444;
            color: #ffffff;
        }

            .btn-resume-pdf:hover {
                background: #dc2626;
                color: #ffffff;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Page Top Header -->
    <div class="page-header-box">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="text-uppercase fw-bold text-rku-red small mb-1" style="letter-spacing: 0.08em; font-size: 0.75rem;">CANDIDATE RECRUITMENT</div>
                <h3 class="mb-1 fw-bold text-dark font-heading">Applicants &amp; Selection Tracker</h3>
                <p class="mb-0 text-muted small">Review registered candidates, update application stages, schedule interviews, and view resumes.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <asp:HyperLink ID="lnkManageDrives" runat="server" NavigateUrl="CompanyManageDrives.aspx" CssClass="btn btn-outline-secondary btn-sm px-3 py-2 me-2" Style="border-radius: 8px; font-weight: 600;">
                    <i class="fa-solid fa-bullhorn me-1"></i>Campus Drives
                </asp:HyperLink>
                <asp:HyperLink ID="lnkStudentDirectory" runat="server" NavigateUrl="CompanyStudentDirectory.aspx" CssClass="btn btn-rku btn-sm px-3 py-2" Style="border-radius: 8px; font-weight: 600;">
                    <i class="fa-solid fa-users me-1"></i>Student Directory
                </asp:HyperLink>
            </div>
        </div>
    </div>

    <!-- Alert / Notification Message -->
    <div id="pnlAlert" runat="server" visible="false" class="alert alert-dismissible fade show mb-3 border-0 shadow-sm" role="alert" style="border-radius: 10px;">
        <asp:Label ID="lblAlertMsg" runat="server"></asp:Label>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>

    <!-- Statistics Summary Cards -->
    <div class="row g-3 mb-4">
        <div class="col-sm-6 col-xl-3">
            <div class="stat-card-custom">
                <div class="stat-icon-wrapper" style="background: rgba(163, 15, 20, 0.1); color: var(--rku-maroon);">
                    <i class="fa-solid fa-file-lines"></i>
                </div>
                <div>
                    <h3 class="mb-0 fw-bold text-dark" id="statTotalApplicants" runat="server">0</h3>
                    <span class="small text-muted fw-semibold">Total Applications</span>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="stat-card-custom">
                <div class="stat-icon-wrapper" style="background: rgba(14, 165, 233, 0.1); color: #0284c7;">
                    <i class="fa-solid fa-user-check"></i>
                </div>
                <div>
                    <h3 class="mb-0 fw-bold text-dark" id="statShortlisted" runat="server">0</h3>
                    <span class="small text-muted fw-semibold">Shortlisted</span>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="stat-card-custom">
                <div class="stat-icon-wrapper" style="background: rgba(16, 185, 129, 0.1); color: #059669;">
                    <i class="fa-solid fa-circle-check"></i>
                </div>
                <div>
                    <h3 class="mb-0 fw-bold text-dark" id="statSelected" runat="server">0</h3>
                    <span class="small text-muted fw-semibold">Selected / Placed</span>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="stat-card-custom">
                <div class="stat-icon-wrapper" style="background: rgba(245, 158, 11, 0.1); color: #d97706;">
                    <i class="fa-solid fa-clock"></i>
                </div>
                <div>
                    <h3 class="mb-0 fw-bold text-dark" id="statPending" runat="server">0</h3>
                    <span class="small text-muted fw-semibold">Pending Review</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content Box: Filters + Table -->
    <div class="filter-container-box">
        <!-- Filter Controls Row -->
        <div class="row g-3 align-items-center mb-3 pb-3 border-bottom">
            <div class="col-md-4">
                <label class="form-label small fw-bold text-secondary mb-1">
                    <i class="fa-solid fa-filter me-1 text-rku-red"></i>Filter by Campus Drive
               
                </label>
                <asp:DropDownList ID="ddlDriveFilter" runat="server" CssClass="form-select form-select-sm"
                    Style="border-radius: 8px; font-weight: 500;" AutoPostBack="true" OnSelectedIndexChanged="ddlDriveFilter_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="col-md-3">
                <label class="form-label small fw-bold text-secondary mb-1">
                    <i class="fa-solid fa-layer-group me-1 text-rku-red"></i>Status Filter
               
                </label>
                <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="form-select form-select-sm"
                    Style="border-radius: 8px; font-weight: 500;" AutoPostBack="true" OnSelectedIndexChanged="ddlStatusFilter_SelectedIndexChanged">
                    <asp:ListItem Value="All" Text="All Application Statuses" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Pending" Text="Pending"></asp:ListItem>
                    <asp:ListItem Value="Under Review" Text="Under Review"></asp:ListItem>
                    <asp:ListItem Value="Shortlisted" Text="Shortlisted"></asp:ListItem>
                    <asp:ListItem Value="Selected" Text="Selected / Placed"></asp:ListItem>
                    <asp:ListItem Value="Rejected" Text="Rejected"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-5">
                <label class="form-label small fw-bold text-secondary mb-1">
                    <i class="fa-solid fa-magnifying-glass me-1 text-rku-red"></i>Instant Candidate Search
               
                </label>
                <div class="input-group input-group-sm">
                    <span class="input-group-text bg-light border-end-0 text-muted" style="border-radius: 8px 0 0 8px;">
                        <i class="fa-solid fa-search"></i>
                    </span>
                    <input type="text" class="form-control form-control-sm border-start-0" id="applicantSearchInput"
                        style="border-radius: 0 8px 8px 0;" placeholder="Search by student name, roll no, email..." onkeyup="filterApplicantsTable()">
                </div>
            </div>
        </div>

        <!-- Table Header Bar -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <div>
                <h6 class="fw-bold mb-0 text-dark font-heading">
                    <i class="fa-solid fa-list-check text-rku-maroon me-2"></i>Candidate Applications
                   
                    <span class="badge bg-light text-dark border ms-1 fw-bold">
                        <asp:Label ID="lblApplicantCount" runat="server" Text="0"></asp:Label></span>
                </h6>
            </div>
            <div class="text-muted small">
                <i class="fa-regular fa-lightbulb text-warning me-1"></i>Select a status and click checkmark to update
           
            </div>
        </div>

        <!-- GridView Applicants Table -->
        <div class="table-responsive" style="border-radius: 10px; border: 1px solid #eef2f6;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" DataKeyNames="Id"
                CssClass="table table-custom-applicants align-middle mb-0 custom-gridview" GridLines="None"
                OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Roll No / ID">
                        <HeaderStyle Width="13%" />
                        <ItemTemplate>
                            <span class="roll-badge"><%# Eval("StudentRollNo") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Student Info &amp; Contact">
                        <HeaderStyle Width="23%" />
                        <ItemTemplate>
                            <div class="fw-bold text-dark" style="font-size: 0.92rem;"><%# Eval("StudentName") %></div>
                            <div class="text-muted small mt-1">
                                <div><i class="fa-regular fa-envelope me-1 text-secondary"></i><%# Eval("StudentEmail") %></div>
                                <div><i class="fa-solid fa-phone me-1 text-secondary"></i><%# Eval("StudentMobile") %></div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Job Role &amp; Date">
                        <HeaderStyle Width="18%" />
                        <ItemTemplate>
                            <div class="fw-semibold text-dark"><%# Eval("JobRole") %></div>
                            <div class="text-muted small mt-1">
                                <i class="fa-regular fa-calendar me-1 text-secondary"></i><%# Eval("AppliedDate", "{0:dd-MM-yyyy}") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Branch &amp; CPI">
                        <HeaderStyle Width="16%" />
                        <ItemTemplate>
                            <div class="fw-semibold text-dark small"><%# Eval("StudentBranch") %></div>
                            <span class="cgpa-tag"><i class="fa-solid fa-chart-line me-1"></i>CPI: <%# Eval("StudentCgpa") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Current Status">
                        <HeaderStyle Width="14%" />
                        <ItemTemplate>
                            <span class='app-status-badge <%# Eval("ApplicationStatus") != DBNull.Value && (Eval("ApplicationStatus").ToString().Trim().ToLower() == "selected" || Eval("ApplicationStatus").ToString().Trim().ToLower() == "offer accepted") ? "status-selected" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower() == "shortlisted" ? "status-shortlisted" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower() == "rejected" ? "status-rejected" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower().Contains("review") ? "status-under-review" : "status-pending"))) %>'>
                                <i class='<%# Eval("ApplicationStatus") != DBNull.Value && (Eval("ApplicationStatus").ToString().Trim().ToLower() == "selected" || Eval("ApplicationStatus").ToString().Trim().ToLower() == "offer accepted") ? "fa-solid fa-circle-check" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower() == "shortlisted" ? "fa-solid fa-user-check" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower() == "rejected" ? "fa-solid fa-circle-xmark" : (Eval("ApplicationStatus") != DBNull.Value && Eval("ApplicationStatus").ToString().Trim().ToLower().Contains("review") ? "fa-solid fa-magnifying-glass" : "fa-regular fa-clock"))) %>'></i>
                                <%# Eval("ApplicationStatus") %>
                            </span>
                            <%# Eval("InterviewDate") != DBNull.Value && !string.IsNullOrEmpty(Eval("InterviewDate").ToString()) ? "<div class='small text-primary mt-1 fw-semibold' style='font-size: 0.75rem;'><i class='fa-regular fa-calendar-check me-1'></i>" + Eval("InterviewDate") + "</div>" : "" %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions &amp; Decision">
                        <HeaderStyle Width="16%" />
                        <ItemTemplate>
                            <div class="d-flex align-items-center gap-2">
                                <asp:DropDownList ID="ddlRowStatus" runat="server" CssClass="form-select form-select-sm"
                                    Style="width: 125px; font-size: 0.78rem; border-radius: 6px; padding: 0.3rem 0.5rem;">
                                    <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                    <asp:ListItem Value="Under Review">Under Review</asp:ListItem>
                                    <asp:ListItem Value="Shortlisted">Shortlisted</asp:ListItem>
                                    <asp:ListItem Value="Selected">Selected</asp:ListItem>
                                    <asp:ListItem Value="Offer Accepted">Offer Accepted</asp:ListItem>
                                    <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                                </asp:DropDownList>

                                <asp:LinkButton ID="btnSaveRowStatus" runat="server" CssClass="action-btn-circle btn-save-status" CommandName="UpdateStatus" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' title="Save Status"><i class="fa-solid fa-check"></i></asp:LinkButton>

                                <asp:LinkButton ID="btnScheduleModal" runat="server" CssClass="action-btn-circle btn-schedule-round" CommandName="ScheduleInterview" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' title="Schedule Interview"><i class="fa-regular fa-calendar-plus"></i></asp:LinkButton>

                                <a href='<%# Eval("StudentResume") != DBNull.Value && !string.IsNullOrEmpty(Eval("StudentResume").ToString()) ? ResolveUrl("~/assets/StudentPDF/" + Eval("StudentResume")) : "javascript:alert(\"Resume not uploaded by student yet.\");" %>'
                                    target='<%# Eval("StudentResume") != DBNull.Value && !string.IsNullOrEmpty(Eval("StudentResume").ToString()) ? "_blank" : "_self" %>'
                                    class='action-btn-circle btn-resume-pdf' title='View Resume PDF'>
                                    <i class='fa-solid fa-file-pdf'></i>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="text-center py-5">
                        <div class="mb-3 text-muted" style="font-size: 2.8rem; opacity: 0.5;"><i class="fa-regular fa-folder-open"></i></div>
                        <h6 class="fw-bold text-dark mb-1">No Applications Found</h6>
                        <p class="text-muted small mb-0">No students match your selected campus drive or status filter.</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>

    <!-- Schedule Interview Modal -->
    <div id="pnlScheduleModal" runat="server" visible="false">
        <div class="modal fade show d-block" tabindex="-1" style="background: rgba(15, 23, 42, 0.6); backdrop-filter: blur(4px); z-index: 1055;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border-0 shadow-lg" style="border-radius: 16px; overflow: hidden;">
                    <div class="modal-header border-bottom bg-light px-4 py-3">
                        <h5 class="modal-title fw-bold font-heading text-dark mb-0 fs-6">
                            <i class="fa-regular fa-calendar-check text-rku-maroon me-2"></i>Schedule Interview Round
                        </h5>
                        <asp:LinkButton ID="btnCloseModal" runat="server" CssClass="btn-close" OnClick="btnCloseModal_Click"></asp:LinkButton>
                    </div>
                    <div class="modal-body p-4">
                        <div class="p-3 bg-light rounded-3 mb-3 border">
                            <div class="small text-muted">Candidate Name</div>
                            <div class="fw-bold text-dark">
                                <asp:Label ID="lblModalStudentName" runat="server"></asp:Label>
                            </div>
                            <div class="small text-secondary mt-1">
                                Applying for: <strong>
                                    <asp:Label ID="lblModalJobRole" runat="server"></asp:Label></strong>
                            </div>
                        </div>

                        <asp:HiddenField ID="hfModalAppId" runat="server" />

                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">Interview Date &amp; Time</label>
                            <asp:TextBox ID="txtModalInterviewDate" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. 15 Oct 2026, 10:30 AM" Style="border-radius: 8px;"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">Venue / Online Meeting Link</label>
                            <asp:TextBox ID="txtModalVenue" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. RKU Seminar Hall-2 or Google Meet Link" Style="border-radius: 8px;"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">Remarks / Instructions for Student</label>
                            <asp:TextBox ID="txtModalRemarks" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control form-control-sm" placeholder="e.g. Please bring 2 hard copies of your updated resume." Style="border-radius: 8px;"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer border-top bg-light px-4 py-3">
                        <asp:Button ID="btnCancelModal" runat="server" CssClass="btn btn-sm btn-light border px-3" Text="Cancel" OnClick="btnCloseModal_Click" Style="border-radius: 8px;" />
                        <asp:Button ID="btnSaveSchedule" runat="server" CssClass="btn btn-sm btn-rku px-4" Text="Save &amp; Shortlist" OnClick="btnSaveSchedule_Click" Style="border-radius: 8px; font-weight: 600;" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Client-side Fast Search Filter Script -->
    <script>
        function filterApplicantsTable() {
            var input = document.getElementById('applicantSearchInput');
            var filter = input.value.toLowerCase();
            var rows = document.querySelectorAll('.custom-gridview tbody tr:not(:first-child)');

            rows.forEach(function (row) {
                var text = row.innerText.toLowerCase();
                if (text.indexOf(filter) > -1) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</asp:Content>
