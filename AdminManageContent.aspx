<%@ Page Title="Manage Web Content | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminManageContent.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminManageContent" %>

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

            .hero-stat-badge.student-badge {
                background: #fef2f2;
                color: #e03627;
                border: 1px solid #fee2e2;
            }

            .hero-stat-badge.company-badge {
                background: #f8fafc;
                color: #0f172a;
                border: 1px solid #e2e8f0;
            }

        /* Filter Tab Buttons */
        .filter-tab-btn {
            font-size: 0.82rem;
            font-weight: 600;
            color: #64748b;
            background: #ffffff;
            border: 1px solid #e2e8f0;
            padding: 0.5rem 1.15rem;
            border-radius: 50px;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            text-decoration: none !important;
        }

            .filter-tab-btn:hover {
                background: #fef2f2;
                color: #e03627;
                border-color: #fee2e2;
            }

            .filter-tab-btn.active {
                background: linear-gradient(135deg, #e03627, #c5281b) !important;
                color: #ffffff !important;
                border-color: transparent !important;
                box-shadow: 0 4px 12px rgba(224, 54, 39, 0.22);
            }

        .tab-count-badge {
            background: #f1f5f9;
            color: #475569;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 0.76rem;
            font-weight: 800;
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
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .dir-main-card-body {
            padding: 1.25rem 1.5rem;
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

        .cpi-tag {
            background: #fef2f2;
            color: #e03627;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 6px;
            border: 1px solid #fee2e2;
            font-size: 0.76rem;
            display: inline-block;
        }

        .backlog-tag {
            background: #f8fafc;
            color: #64748b;
            font-weight: 600;
            padding: 2px 8px;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
            font-size: 0.74rem;
            display: inline-block;
        }

        /* Avatar Styling (Matches AdminStudentDirectory) */
        .student-table-avatar {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #ffffff;
            box-shadow: 0 2px 6px rgba(0,0,0,0.08);
            flex-shrink: 0;
        }

        .student-table-avatar-fallback {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: linear-gradient(135deg, #e03627, #c5281b);
            color: #ffffff;
            font-size: 1rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 6px rgba(224, 54, 39, 0.2);
            flex-shrink: 0;
        }

        .company-table-logo {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            object-fit: cover;
            border: 1px solid #e2e8f0;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.06);
            background: #ffffff;
            flex-shrink: 0;
            padding: 2px;
        }

        .company-avatar-fallback {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            background: linear-gradient(135deg, #1e293b, #0f172a);
            color: #ffffff;
            font-size: 1.1rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
            flex-shrink: 0;
        }

        /* Action Buttons (Matches AdminStudentDirectory) */
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

        /* Upload Zone */
        .img-upload-zone {
            background: #f8fafc;
            border: 2px dashed #cbd5e1;
            border-radius: 12px;
            padding: 1.25rem;
            text-align: center;
            transition: all 0.2s ease;
        }

            .img-upload-zone:hover {
                background: #fef2f2;
                border-color: #fca5a5;
            }

        .btn-rku {
            background: linear-gradient(135deg, #e03627, #c5281b) !important;
            color: #ffffff !important;
            font-weight: 700;
            border: none;
            box-shadow: 0 4px 14px rgba(224, 54, 39, 0.25);
            transition: all 0.2s ease;
            border-radius: 8px;
        }

            .btn-rku:hover {
                background: linear-gradient(135deg, #c5281b, #991b1b) !important;
                color: #ffffff !important;
                box-shadow: 0 6px 18px rgba(224, 54, 39, 0.35);
            }

        .section-anchor {
            scroll-margin-top: 80px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header Banner (Matching AdminStudentDirectory design) -->
    <div class="directory-hero-card">
        <div class="row align-items-center g-3">
            <div class="col-lg-7">
                <div class="directory-hero-kicker">
                    <i class="fa-solid fa-layer-group me-1"></i>WEBSITE CONTENT CMS
               
                </div>
                <h2>Website Content Management</h2>
                <p>
                    Manage placed students, success stories, campus gallery highlights, and placement cell team members.
               
                </p>
            </div>
            <div class="col-lg-5 text-lg-end d-flex gap-2 justify-content-lg-end flex-wrap">
                <span class="hero-stat-badge student-badge shadow-sm">
                    <i class="fa-solid fa-user-graduate"></i>Placement Portal CMS
                </span>
                <span class="hero-stat-badge company-badge shadow-sm">
                    <i class="fa-solid fa-globe"></i>Live Website
                </span>
            </div>
        </div>
    </div>

    <!-- Quick Navigation Filter Buttons -->
    <div class="d-flex gap-2 mb-4 flex-wrap">
        <a href="#section-placed" class="filter-tab-btn active">
            <i class="fa-solid fa-user-graduate me-1.5"></i>Placed Students
        </a>
        <a href="#section-stories" class="filter-tab-btn">
            <i class="fa-solid fa-trophy me-1.5"></i>Success Stories
        </a>
        <a href="#section-gallery" class="filter-tab-btn">
            <i class="fa-regular fa-images me-1.5"></i>Campus Gallery
        </a>
        <a href="#section-team" class="filter-tab-btn">
            <i class="fa-solid fa-users-gear me-1.5"></i>Placement Team
        </a>
    </div>

    <!-- =====================================================
         SECTION 0: PLACED STUDENTS
    ====================================================== -->
    <div id="section-placed" class="section-anchor">
        <div class="row g-4 mb-5">
            <!-- ALL PLACED STUDENTS (GRIDVIEW) -->
            <div class="col-xl-7 col-lg-6">
                <div class="dir-main-card h-100">
                    <div class="dir-main-card-head">
                        <h6 class="fw-bold mb-0 text-dark font-heading">
                            <i class="fa-solid fa-users me-2" style="color: #e03627;"></i>All Placed Students
                        </h6>
                        <span class="tab-count-badge" id="placementCountBadge" runat="server">0 students</span>
                    </div>
                    <div class="p-0">
                        <div id="adminPlacementList" style="max-height: 580px; overflow-y: auto;">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" GridLines="None" CssClass="w-100" OnRowCommand="GridView1_RowCommand1">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="p-3 border-bottom d-flex justify-content-between align-items-center bg-white" style="transition: background 0.15s ease;">
                                                <div class="d-flex align-items-center gap-3" style="max-width: 78%;">
                                                    <%# (!string.IsNullOrEmpty(Eval("StudentImage") as string) && Eval("StudentImage").ToString().Trim() != "" && Eval("StudentImage").ToString() != "~/assets/PlacmentStudentImage/") ? 
                                                        "<img src='" + ResolveUrl(Eval("StudentImage").ToString()) + "' class='student-table-avatar' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" alt='Student Photo' />" : "" %>
                                                    <div class="student-table-avatar-fallback" style='<%# (!string.IsNullOrEmpty(Eval("StudentImage") as string) && Eval("StudentImage").ToString().Trim() != "" && Eval("StudentImage").ToString() != "~/assets/PlacmentStudentImage/") ? "display:none;": "display:inline-flex;" %>'>
                                                        <%# Eval("StudentName") != DBNull.Value && Eval("StudentName").ToString().Trim().Length > 0 ? Eval("StudentName").ToString().Trim().Substring(0, 1).ToUpper() : "S" %>
                                                    </div>
                                                    <div>
                                                        <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                                            <span class="badge bg-secondary text-white rounded-pill px-2.5 py-0.5" style="font-size: 0.68rem;">Batch <%# Eval("PlacementYear") %></span>
                                                            <span class="cpi-tag"><i class="fa-solid fa-building me-1"></i><%# Eval("CompanyName") %></span>
                                                        </div>
                                                        <h6 class="fw-bold mb-0 text-dark font-heading" style="font-size: 0.95rem;"><%# Eval("StudentName") %></h6>
                                                        <p class="mb-0 text-muted small mt-0.5"><%# Eval("Department") %> &bull; Placed at <strong><%# Eval("CompanyName") %></strong> (<%# Eval("PlacementYear") %>)</p>
                                                    </div>
                                                </div>
                                                <div class="d-flex gap-1.5">
                                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="cmd_edt" CommandArgument='<%# Eval("StudentName") %>' CssClass="btn-action-profile" ToolTip="Edit Placement"><i class="fa-regular fa-pen-to-square"></i>Edit</asp:LinkButton>
                                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("StudentName") %>' CssClass="btn-action-delete" ToolTip="Delete Placement" OnClientClick="return confirm('Are you sure you want to delete this placed student?');"><i class="fa-regular fa-trash-can"></i>Delete</asp:LinkButton>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblNoPlacedStudents" runat="server" CssClass="text-center text-muted small py-5 d-block" Text="No placed students added yet." Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- PLACEMENT FORM -->
            <div class="col-xl-5 col-lg-6">
                <div class="dir-main-card" style="position: sticky; top: 20px;">
                    <div class="dir-main-card-head">
                        <h6 class="fw-bold mb-0 font-heading text-dark" id="placementFormTitle">
                            <i class="fa-solid fa-user-graduate me-2" style="color: #e03627;"></i>Add Placed Student
                        </h6>
                    </div>
                    <div class="dir-main-card-body">
                        <asp:HiddenField ID="editPlacementId" runat="server" ClientIDMode="Static" Value="" />

                        <!-- Student Image Upload -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Student Photo</label>
                            <label for="placementImage" class="img-upload-zone d-block" style="cursor: pointer;">
                                <asp:Image ID="placementImagePreview" runat="server" ClientIDMode="Static" Style="display: none; width: 80px; height: 80px; object-fit: cover; border-radius: 10px; margin: 0 auto 10px;" />
                                <div id="placementUploadHint">
                                    <i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2 d-block"></i>
                                    <span class="text-muted small">Click to upload student photo</span>
                                </div>
                            </label>
                            <asp:FileUpload ID="placementImage" runat="server" ClientIDMode="Static" CssClass="d-none" accept="image/*" onchange="previewPlacementImage(this)" />
                        </div>

                        <!-- Student Name -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Student Name</label>
                            <asp:TextBox ID="placementStudentName" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="e.g. Krishna Patel" />
                        </div>

                        <!-- Department -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Department</label>
                            <asp:DropDownList ID="placementDepartment" runat="server" ClientIDMode="Static"
                                CssClass="form-select">
                                <asp:ListItem Value="" Text="-- Select Department --" Selected="True" />
                                <asp:ListItem Value="BCA" Text="BCA" />
                                <asp:ListItem Value="BBA" Text="BBA" />
                                <asp:ListItem Value="B.Tech" Text="B.Tech" />
                                <asp:ListItem Value="MCA" Text="MCA" />
                                <asp:ListItem Value="MBA" Text="MBA" />
                                <asp:ListItem Value="M.Tech" Text="M.Tech" />
                            </asp:DropDownList>
                        </div>

                        <!-- Company Name -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Company Name</label>
                            <asp:TextBox ID="placementCompanyName" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="e.g. TCS" />
                        </div>

                        <!-- Placement Year -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Placement Year</label>
                            <asp:DropDownList ID="placementYear" runat="server" ClientIDMode="Static"
                                CssClass="form-select">
                                <asp:ListItem Value="" Text="-- Select Placement Year --" Selected="True" />
                                <asp:ListItem Value="2026" Text="2026" />
                                <asp:ListItem Value="2025" Text="2025" />
                                <asp:ListItem Value="2024" Text="2024" />
                                <asp:ListItem Value="2023" Text="2023" />
                                <asp:ListItem Value="2022" Text="2022" />
                                <asp:ListItem Value="2021" Text="2021" />
                            </asp:DropDownList>
                        </div>

                        <!-- Buttons -->
                        <div class="d-grid gap-2 mt-3">
                            <asp:Button ID="placementSubmitBtn" runat="server" ClientIDMode="Static" Text="Add Placed Student" CssClass="btn btn-rku btn-sm py-2" CausesValidation="false" UseSubmitBehavior="false" OnClick="placementSubmitBtn_Click" />
                            <asp:Button ID="placementCancelBtn" runat="server" ClientIDMode="Static" Text="Cancel" CssClass="btn btn-outline-secondary btn-sm py-2" CausesValidation="false" UseSubmitBehavior="false" OnClick="placementCancelBtn_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--    SECTION 1: SUCCESS STORIES -->
    <div id="section-stories" class="section-anchor">
        <div class="row g-4 mb-5">
            <!-- ALL SUCCESS STORIES (GRIDVIEW) -->
            <div class="col-xl-7 col-lg-6">
                <div class="dir-main-card h-100">
                    <div class="dir-main-card-head">
                        <h6 class="fw-bold mb-0 text-dark font-heading">
                            <i class="fa-solid fa-trophy me-2" style="color: #e03627;"></i>All Success Stories
                        </h6>
                        <span class="tab-count-badge" id="storyCountBadge" runat="server">0 stories</span>
                    </div>
                    <div class="p-0">
                        <div id="adminStoriesList" style="max-height: 580px; overflow-y: auto;">
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" ShowHeader="False" GridLines="None" CssClass="w-100" OnRowCommand="GridView3_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="p-3 border-bottom d-flex justify-content-between align-items-center bg-white" style="transition: background 0.15s ease;">
                                                <div class="d-flex align-items-center gap-3" style="max-width: 78%;">
                                                    <%# (!string.IsNullOrEmpty(Eval("StudentPhoto") as string) && Eval("StudentPhoto").ToString().Trim() != "" && Eval("StudentPhoto").ToString() != "~/assets/PlacmentStudentImage/") ? 
                                                        "<img src='" + ResolveUrl(Eval("StudentPhoto").ToString()) + "' class='student-table-avatar' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" alt='Student Photo' />" : "" %>
                                                    <div class="student-table-avatar-fallback" style='<%# (!string.IsNullOrEmpty(Eval("StudentPhoto") as string) && Eval("StudentPhoto").ToString().Trim() != "" && Eval("StudentPhoto").ToString() != "~/assets/PlacmentStudentImage/") ? "display:none;": "display:inline-flex;" %>'>
                                                        <%# Eval("StudentName") != DBNull.Value && Eval("StudentName").ToString().Trim().Length > 0 ? Eval("StudentName").ToString().Trim().Substring(0, 1).ToUpper() : "S" %>
                                                    </div>
                                                    <div>
                                                        <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                                            <%# (Eval("IsHallOfFame") != null && (Eval("IsHallOfFame").ToString() == "1" || Eval("IsHallOfFame").ToString().ToLower() == "true")) ? "<span class='badge bg-warning text-dark rounded-pill px-2.5 py-0.5' style='font-size:0.68rem;'><i class='fa-solid fa-trophy me-1'></i>Hall of Fame (Rank " + Eval("PodiumRank") + ")</span>" : "<span class='badge bg-light text-muted border rounded-pill px-2.5 py-0.5' style='font-size:0.68rem;'>Standard</span>" %>
                                                            <span class="cpi-tag"><i class="fa-solid fa-sack-dollar me-1"></i><%# Eval("Package") %></span>
                                                        </div>
                                                        <h6 class="fw-bold mb-0 text-dark font-heading" style="font-size: 0.95rem;"><%# Eval("StudentName") %></h6>
                                                        <p class="mb-0 text-muted small mt-0.5"><%# Eval("DegreeBranch") %> &bull; Placed at <strong><%# Eval("Recruiter") %></strong> (<%# Eval("JobDesignation") %>)</p>
                                                    </div>
                                                </div>
                                                <div class="d-flex gap-1.5">
                                                 <asp:LinkButton ID="btnStoryEdit" runat="server" CommandName="cmd_sedt" CommandArgument='<%# Eval("StoryId") %>' CssClass="btn-action-profile" ToolTip="Edit Story"><i class="fa-regular fa-pen-to-square"></i>Edit</asp:LinkButton>
                                            <asp:LinkButton ID="btnStoryDelete" runat="server" CommandName="cmd_sdel" CommandArgument='<%# Eval("StoryId") %>' CssClass="btn-action-delete" ToolTip="Delete Story" OnClientClick="return confirm('Are you sure you want to delete this success story?');"><i class="fa-regular fa-trash-can"></i>Delete</asp:LinkButton>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblNoStories" runat="server" CssClass="text-center text-muted small py-5 d-block" Text="No success stories added yet." Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- STORY FORM -->
            <div class="col-xl-5 col-lg-6">
                <div class="dir-main-card" style="position: sticky; top: 20px;">
                    <div class="dir-main-card-head">
                        <h6 class="fw-bold mb-0 font-heading text-dark" id="storyFormTitle" runat="server">
                            <i class="fa-solid fa-trophy me-2" style="color: #e03627;"></i>Add Placed Student Story
                        </h6>
                    </div>
                    <div class="dir-main-card-body">
                        <asp:HiddenField ID="editStoryId" runat="server" ClientIDMode="Static" Value="" />

                        <!-- Student Full Name -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Student Full Name</label>
                            <asp:TextBox ID="storyStudentName" runat="server" ClientIDMode="Static"
                                CssClass="form-control" placeholder="e.g. Krishna Patel" />
                        </div>

                        <!-- Degree & Branch -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Degree &amp; Branch</label>
                            <asp:TextBox ID="storyDegree" runat="server" ClientIDMode="Static"
                                CssClass="form-control" placeholder="e.g. BCA | School of Computer Applications" />
                        </div>

                        <!-- Student Photo (Optional) -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Student Photo (Optional)</label>
                            <label for="storyImage" class="img-upload-zone d-block" style="cursor: pointer;">
                                <asp:Image ID="storyImagePreview" runat="server" ClientIDMode="Static"
                                    Style="display: none; width: 80px; height: 80px; object-fit: cover; border-radius: 10px; margin: 0 auto 10px;" />
                                <div id="storyUploadHint">
                                    <i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2 d-block"></i>
                                    <span class="text-muted small">Click to upload student photo</span>
                                </div>
                            </label>
                            <asp:FileUpload ID="storyImage" runat="server" ClientIDMode="Static"
                                CssClass="d-none" accept="image/*" onchange="previewStoryImage(this)" />
                        </div>

                        <!-- Recruiter & Package -->
                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Recruiter</label>
                                <asp:TextBox ID="storyRecruiter" runat="server" ClientIDMode="Static"
                                    CssClass="form-control" placeholder="e.g. TCS" />
                            </div>
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Package</label>
                                <asp:TextBox ID="storyPackage" runat="server" ClientIDMode="Static"
                                    CssClass="form-control" placeholder="e.g. 12 LPA" />
                            </div>
                        </div>

                        <!-- Job Designation -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Job Designation</label>
                            <asp:TextBox ID="storyRole" runat="server" ClientIDMode="Static"
                                CssClass="form-control" placeholder="e.g. Software Engineer" />
                        </div>

                        <!-- Student Testimonial -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Student Testimonial</label>
                            <asp:TextBox ID="storyQuote" runat="server" ClientIDMode="Static"
                                TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Student experience quote..." />
                        </div>

                        <!-- Key Skills -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Key Skills <span class="text-muted fw-normal">(comma-separated)</span></label>
                            <asp:TextBox ID="storySkills" runat="server" ClientIDMode="Static"
                                CssClass="form-control" placeholder="HTML, CSS, JavaScript, SQL" />
                        </div>

                        <!-- Add to Hall of Fame Podium -->
                        <div class="form-check mb-2">
                            <asp:CheckBox ID="storyIsHallOfFame" runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                            <label class="form-check-label small fw-semibold" for="storyIsHallOfFame">
                                <i class="fa-solid fa-award text-warning me-1"></i>Add to Hall of Fame Podium
                           
                            </label>
                        </div>

                        <!-- Podium Rank -->
                        <div class="mb-3" id="rankSelectGroup">
                            <label class="form-label text-muted small fw-bold">Podium Rank</label>
                            <asp:DropDownList ID="storyRank" runat="server" ClientIDMode="Static" CssClass="form-select">
                                <asp:ListItem Value="" Text="-- Select Rank --" Selected="True" />
                                <asp:ListItem Value="1" Text="Rank 1 (Gold - Highest Package)" />
                                <asp:ListItem Value="2" Text="Rank 2 (Silver)" />
                                <asp:ListItem Value="3" Text="Rank 3 (Bronze)" />
                            </asp:DropDownList>
                        </div>

                        <!-- Buttons -->
                        <div class="d-grid gap-2 mt-3">
                            <asp:Button ID="storySubmitBtn" runat="server" ClientIDMode="Static"
                                Text="Publish Success Story" CssClass="btn btn-rku btn-sm py-2"
                                CausesValidation="false" UseSubmitBehavior="false"
                                OnClick="storySubmitBtn_Click" />

                            <asp:Button ID="storyCancelBtn" runat="server" ClientIDMode="Static"
                                Text="Cancel" CssClass="btn btn-outline-secondary btn-sm py-2"
                                CausesValidation="false" UseSubmitBehavior="false"
                                OnClick="storyCancelBtn_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- =====================================================
         SECTION 2: PLACEMENT GALLERY
    ====================================================== -->
    <div id="section-gallery" class="section-anchor">
        <div class="row g-4 mb-5">
            <!-- ALL GALLERY ITEMS (GRIDVIEW) -->
            <div class="col-xl-7 col-lg-6">
                <div class="dir-main-card h-100">
                    <div class="dir-main-card-head">
                        <h6 class="fw-bold mb-0 text-dark font-heading">
                            <i class="fa-regular fa-images me-2" style="color: #e03627;"></i>Gallery Items
                        </h6>
                        <span class="tab-count-badge" id="galleryCountBadge" runat="server">0 items</span>
                    </div>
                    <div class="p-0">
                        <div id="adminGalleryList" style="max-height: 400px; overflow-y: auto;">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeader="False" GridLines="None" CssClass="w-100" OnRowCommand="GridView2_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="p-3 border-bottom d-flex justify-content-between align-items-center bg-white" style="transition: background 0.15s ease;">
                                                <div class="d-flex align-items-center gap-3" style="max-width: 78%;">
                                                    <%# (!string.IsNullOrEmpty(Eval("GalleryImage") as string) && Eval("GalleryImage").ToString().Trim() != "" && Eval("GalleryImage").ToString() != "~/assets/GalleryImages/") ? 
                                                        "<img src='" + ResolveUrl(Eval("GalleryImage").ToString()) + "' class='company-table-logo' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" alt='Gallery' />" : "" %>
                                                    <div class="company-avatar-fallback" style='<%# (!string.IsNullOrEmpty(Eval("GalleryImage") as string) && Eval("GalleryImage").ToString().Trim() != "" && Eval("GalleryImage").ToString() != "~/assets/GalleryImages/") ? "display:none;": "display:inline-flex;" %>'>
                                                        <i class="fa-regular fa-image"></i>
                                                    </div>
                                                    <div>
                                                        <h6 class="fw-bold mb-0 text-dark font-heading" style="font-size: 0.95rem;"><%# Eval("GalleryTitle") %></h6>
                                                    </div>
                                                </div>
                                                <div class="d-flex gap-1.5">
                                                    <asp:LinkButton ID="btnGalleryEdit" runat="server" CommandName="cmd_gedt" CommandArgument='<%# Eval("GalleryTitle") %>' CssClass="btn-action-profile" ToolTip="Edit">
                                                        <i class="fa-regular fa-pen-to-square"></i>Edit
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btnGalleryDelete" runat="server" CommandName="cmd_gdel" CommandArgument='<%# Eval("GalleryTitle") %>' CssClass="btn-action-delete" ToolTip="Delete" OnClientClick="return confirm('Are you sure you want to delete this gallery item?');">
                                                        <i class="fa-regular fa-trash-can"></i>Delete
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblNoGallery" runat="server" CssClass="text-center text-muted small py-5 d-block" Text="No gallery items added yet." Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- GALLERY FORM -->
            <div class="col-xl-5 col-lg-6">
                <div class="dir-main-card" style="position: sticky; top: 20px;">
                    <div class="dir-main-card-head">
                        <h6 class="fw-bold mb-0 font-heading text-dark">
                            <i class="fa-regular fa-images me-2" style="color: #e03627;"></i>Add Gallery Image
                        </h6>
                    </div>
                    <div class="dir-main-card-body">
                        <!-- Gallery Event / Title -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Gallery Event / Title</label>
                            <asp:TextBox ID="galleryTitle" runat="server" CssClass="form-control" placeholder="e.g. Placement Batch 2026" />
                        </div>

                        <!-- Gallery Image -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Gallery Image</label>
                            <asp:FileUpload ID="galleryImage" runat="server" CssClass="form-control" accept="image/*" />
                        </div>

                        <!-- Buttons -->
                        <div class="d-grid gap-2 mt-3">
                            <asp:Button ID="gallerySubmitBtn" runat="server" Text="+ Add Gallery Item"
                                CssClass="btn btn-rku btn-sm py-2" CausesValidation="false" UseSubmitBehavior="false"
                                OnClick="gallerySubmitBtn_Click" />
                            <asp:Button ID="galleryCancelBtn" runat="server" Text="Cancel"
                                CssClass="btn btn-outline-secondary btn-sm py-2" CausesValidation="false" UseSubmitBehavior="false"
                                OnClick="galleryCancelBtn_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- =====================================================
         SECTION 4: PLACEMENT TEAM
    ====================================================== -->
    <div id="section-team" class="section-anchor">
        <div class="row g-4 mb-5">
            <!-- ALL PLACEMENT TEAM MEMBERS (GRIDVIEW) -->
            <div class="col-xl-7 col-lg-6">
                <div class="dir-main-card h-100">
                    <div class="dir-main-card-head">
                        <h6 class="fw-bold mb-0 text-dark font-heading">
                            <i class="fa-solid fa-users-gear me-2" style="color: #e03627;"></i>Our Placement Team
                        </h6>
                        <span class="tab-count-badge" id="teamCountBadge" runat="server">0 members</span>
                    </div>
                    <div class="p-0">
                        <div id="adminTeamList" style="max-height: 580px; overflow-y: auto;">
                            <asp:GridView ID="GridViewTeam" runat="server" AutoGenerateColumns="False" ShowHeader="False" GridLines="None" CssClass="w-100" OnRowCommand="GridViewTeam_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="p-3 border-bottom d-flex justify-content-between align-items-center bg-white" style="transition: background 0.15s ease;">
                                                <div class="d-flex align-items-center gap-3" style="max-width: 78%;">
                                                    <%# (!string.IsNullOrEmpty(Eval("MemberPhoto") as string) && Eval("MemberPhoto").ToString().Trim() != "" && Eval("MemberPhoto").ToString() != "~/assets/PlacmentCell_TeamImage/") ? 
                                                        "<img src='" + ResolveUrl(Eval("MemberPhoto").ToString()) + "' class='student-table-avatar' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" alt='Team Photo' />" : "" %>
                                                    <div class="student-table-avatar-fallback" style='<%# (!string.IsNullOrEmpty(Eval("MemberPhoto") as string) && Eval("MemberPhoto").ToString().Trim() != "" && Eval("MemberPhoto").ToString() != "~/assets/PlacmentCell_TeamImage/") ? "display:none;": "display:inline-flex;" %>'>
                                                        <%# Eval("MemberName") != DBNull.Value && Eval("MemberName").ToString().Trim().Length > 0 ? Eval("MemberName").ToString().Trim().Substring(0, 1).ToUpper() : "T" %>
                                                    </div>
                                                    <div>
                                                        <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                                            <span class="badge bg-rku-maroon text-white rounded-pill px-2.5 py-0.5" style="font-size: 0.68rem;"><%# Eval("MemberRole") %></span>
                                                        </div>
                                                        <h6 class="fw-bold mb-0 text-dark font-heading" style="font-size: 0.95rem;"><%# Eval("MemberName") %></h6>
                                                        <p class="mb-0 text-muted small mt-0.5"><%# Eval("MemberDesc") %></p>
                                                        <small class="text-muted"><i class="fa-solid fa-phone me-1"></i><%# Eval("MemberMobile") %> &bull; <i class="fa-solid fa-envelope me-1"></i><%# Eval("MemberEmail") %></small>
                                                    </div>
                                                </div>
                                                <div class="d-flex gap-1.5">
                                                    <asp:LinkButton ID="btnTeamEdit" runat="server" CommandName="cmd_tedt" CommandArgument='<%# Eval("MemberName") %>' CssClass="btn-action-profile" ToolTip="Edit Member">
                                                        <i class="fa-regular fa-pen-to-square"></i>Edit
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btnTeamDelete" runat="server" CommandName="cmd_tdel" CommandArgument='<%# Eval("MemberName") %>' CssClass="btn-action-delete" ToolTip="Delete Member" OnClientClick="return confirm('Are you sure you want to delete this team member?');">
                                                        <i class="fa-regular fa-trash-can"></i>Delete
                                                    </asp:LinkButton>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:Label ID="lblNoTeamMembers" runat="server" CssClass="text-center text-muted small py-5 d-block" Text="No team members added yet." Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- PLACEMENT TEAM FORM -->
            <div class="col-xl-5 col-lg-6">
                <div class="dir-main-card" style="position: sticky; top: 20px;">
                    <div class="dir-main-card-head">
                        <h6 class="fw-bold mb-0 font-heading text-dark" id="teamFormTitle" runat="server">
                            <i class="fa-solid fa-users-gear me-2" style="color: #e03627;"></i>Add Placement Team Member
                        </h6>
                    </div>
                    <div class="dir-main-card-body">
                        <!-- Member Photo -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Member Photo</label>
                            <label for="teamMemberPhoto" class="img-upload-zone d-block" style="cursor: pointer;">
                                <asp:Image ID="teamImagePreview" runat="server" ClientIDMode="Static"
                                    Style="display: none; width: 80px; height: 80px; object-fit: cover; border-radius: 10px; margin: 0 auto 10px;" />
                                <div id="teamUploadHint">
                                    <i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2 d-block"></i>
                                    <span class="text-muted small">Click to upload photo</span>
                                </div>
                            </label>
                            <asp:FileUpload ID="teamMemberPhoto" runat="server" ClientIDMode="Static"
                                CssClass="d-none" accept="image/*" onchange="previewTeamImage(this)" />
                        </div>

                        <!-- Member Name -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Member Name</label>
                            <asp:TextBox ID="teamMemberName" runat="server" ClientIDMode="Static"
                                CssClass="form-control" placeholder="e.g. Dr. Amit Lathigara" />
                        </div>

                        <!-- Role / Designation -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Role / Designation</label>
                            <asp:TextBox ID="teamMemberRole" runat="server" ClientIDMode="Static"
                                CssClass="form-control" placeholder="e.g. Lead Coordinator / Coordinator" />
                        </div>

                        <!-- Description -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Description / Responsibility</label>
                            <asp:TextBox ID="teamMemberDesc" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="2"
                                CssClass="form-control" placeholder="e.g. Planning & student coordination" />
                        </div>

                        <!-- Mobile Number -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Mobile Number</label>
                            <asp:TextBox ID="teamMemberMobile" runat="server" ClientIDMode="Static"
                                CssClass="form-control" placeholder="e.g. +91 98765 43210" />
                        </div>

                        <!-- Email ID -->
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Email ID</label>
                            <asp:TextBox ID="teamMemberEmail" runat="server" ClientIDMode="Static"
                                CssClass="form-control" placeholder="e.g. placement@rku.ac.in" />
                        </div>

                        <!-- Buttons -->
                        <div class="d-grid gap-2 mt-3">
                            <asp:Button ID="teamSubmitBtn" runat="server" ClientIDMode="Static"
                                Text="Add Team Member" CssClass="btn btn-rku btn-sm py-2"
                                CausesValidation="false" UseSubmitBehavior="false"
                                OnClick="teamSubmitBtn_Click" />

                            <asp:Button ID="teamCancelBtn" runat="server" ClientIDMode="Static"
                                Text="Cancel" CssClass="btn btn-outline-secondary btn-sm py-2"
                                CausesValidation="false" UseSubmitBehavior="false"
                                OnClick="teamCancelBtn_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const navItem = document.getElementById('nav-content');
            if (navItem) navItem.classList.add('active');

            const titleBar = document.getElementById('panelTitleBar');
            if (titleBar) titleBar.textContent = 'Manage Website Content';

        });

        // Student Photo Preview Helper
        function previewPlacementImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.getElementById('placementImagePreview');
                    if (img) {
                        img.src = e.target.result;
                        img.style.display = 'block';
                    }
                    const hint = document.getElementById('placementUploadHint');
                    if (hint) {
                        hint.style.display = 'none';
                    }
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        // Story Student Photo Preview Helper
        function previewStoryImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.getElementById('storyImagePreview');
                    if (img) {
                        img.src = e.target.result;
                        img.style.display = 'block';
                    }
                    const hint = document.getElementById('storyUploadHint');
                    if (hint) {
                        hint.style.display = 'none';
                    }
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        // Team Photo Preview Helper
        function previewTeamImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.getElementById('teamImagePreview');
                    if (img) {
                        img.src = e.target.result;
                        img.style.display = 'block';
                    }
                    const hint = document.getElementById('teamUploadHint');
                    if (hint) {
                        hint.style.display = 'none';
                    }
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        function getBase64(file) {
            return new Promise((resolve, reject) => {
                const reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = () => resolve(reader.result);
                reader.onerror = error => reject(error);
            });
        }

    </script>
</asp:Content>
