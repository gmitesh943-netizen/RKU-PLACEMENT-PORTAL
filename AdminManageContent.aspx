<%@ Page Title="Manage Web Content | RKU Placement Portal" Language="C#" MasterPageFile="~/Admin-panel.Master" AutoEventWireup="true" CodeBehind="AdminManageContent.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.AdminManageContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- =====================================================
         SECTION 0: PLACED STUDENTS (NEW FORM)
    ====================================================== -->
    <div class="section-header mb-4">
        <div class="section-header-icon" style="background: rgba(163,15,20,0.1); color: var(--rku-maroon);">
            <i class="fa-solid fa-user-graduate"></i>
        </div>
        <div>
            <h5>Placed Students</h5>
            <p>Manage students who have been placed in companies</p>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <!-- ==================== ALL PLACED STUDENTS ==================== -->
        <div class="col-xl-7 col-lg-6">
            <div class="content-section h-100">
                <div class="content-section-head">
                    <div class="fw-bold font-heading" style="font-size: 0.9rem;">
                        <i class="fa-solid fa-users me-2 text-muted"></i>All Placed Students
                    </div>
                    <span class="badge bg-light text-muted border" id="placementCountBadge" runat="server">0 students</span>
                </div>
                <div class="content-section-body no-pad">
                    <div id="adminPlacementList" style="max-height: 580px; overflow-y: auto;">

<%--  =======================Gridview Show for plced student =======================--%>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" GridLines="None" CssClass="w-100" OnRowCommand="GridView1_RowCommand1">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center">
                                            <div class="d-flex align-items-center" style="max-width: 80%;">
                                                <%# (!string.IsNullOrEmpty(Eval("StudentImage") as string) && Eval("StudentImage").ToString().Trim() != "" && Eval("StudentImage").ToString() != "~/assets/PlacmentStudentImage/") ? "<img src='" + ResolveUrl(Eval("StudentImage").ToString()) + "' style='width:40px;height:40px;object-fit:cover;border-radius:50%;' class='me-3' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" /><span class='me-3' style='display:none;width:40px;height:40px;border-radius:50%;background:#f1f5f9;color:var(--rku-maroon);align-items:center;justify-content:center;font-weight:700;'><i class='fa-solid fa-user-graduate'></i></span>" : "<span class='me-3' style='width:40px;height:40px;border-radius:50%;background:#f1f5f9;color:var(--rku-maroon);display:inline-flex;align-items:center;justify-content:center;font-weight:700;'><i class='fa-solid fa-user-graduate'></i></span>" %>
                                                <div>
                                                    <div class="d-flex align-items-center gap-2 mb-1">
                                                        <span class="badge bg-secondary text-white rounded-pill px-2" style="font-size:0.65rem;">Batch <%# Eval("PlacementYear") %></span>
                                                        <span class="fw-bold text-rku-maroon font-monospace small"><i class="fa-solid fa-building me-1"></i><%# Eval("CompanyName") %></span>
                                                    </div>
                                                    <h6 class="fw-bold mb-0 text-dark font-heading"><%# Eval("StudentName") %></h6>
                                                    <p class="mb-0 text-muted small"><%# Eval("Department") %> &bull; Placed at <strong><%# Eval("CompanyName") %></strong> (<%# Eval("PlacementYear") %>)</p>
                                                </div>
                                            </div>
                                            <div class="d-flex gap-1">
                                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="cmd_edt" CommandArgument='<%# Eval("StudentName") %>' CssClass="btn btn-outline-primary btn-sm border-0" ToolTip="Edit Placement">
                                                    <i class="fa-regular fa-pen-to-square"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("StudentName") %>' CssClass="btn btn-outline-danger btn-sm border-0" ToolTip="Delete Placement" OnClientClick="return confirm('Are you sure you want to delete this placed student?');">
                                                    <i class="fa-regular fa-trash-can"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="lblNoPlacedStudents" runat="server" CssClass="text-center text-muted small py-4 d-block" Text="No placed students added yet." Visible="false"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <!-- ==================== PLACEMENT FORM ==================== -->
        <div class="col-xl-5 col-lg-6">
            <div class="form-panel" style="position: sticky; top: 20px;">
                <!-- FORM HEADER -->
                <div class="form-panel-head">
                    <h6 class="fw-bold mb-0 font-heading" id="placementFormTitle">
                        <i class="fa-solid fa-user-graduate me-2 text-rku-maroon"></i>Add Placed Student
                    </h6>
                </div>

                <!-- FORM BODY (ASP.NET CONTROLS) -->
                <div class="form-panel-body">
                    <asp:HiddenField ID="editPlacementId" runat="server" ClientIDMode="Static" Value="" />

                    <!-- ================= STUDENT IMAGE ================= -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Student Image</label>
                        <label for="placementImage" class="img-upload-zone d-block" style="cursor: pointer;">
                            <asp:Image ID="placementImagePreview" runat="server" ClientIDMode="Static"
                                Style="display:none; width:80px; height:80px; object-fit:cover; border-radius:10px; margin:0 auto 10px;" />
                            <div id="placementUploadHint">
                                <i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2 d-block"></i>
                                <span class="text-muted small">Click to upload student photo</span>
                            </div>
                        </label>
                        <asp:FileUpload ID="placementImage" runat="server" ClientIDMode="Static"
                            CssClass="d-none" accept="image/*" onchange="previewPlacementImage(this)" />
                    </div>

                    <!-- ================= STUDENT NAME ================= -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Student Name</label>
                        <asp:TextBox ID="placementStudentName" runat="server" ClientIDMode="Static"
                            CssClass="form-control" placeholder="e.g. Krishna Patel" />
                    </div>

                    <!-- ================= DEPARTMENT ================= -->
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

                    <!-- ================= COMPANY NAME ================= -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Company Name</label>
                        <asp:TextBox ID="placementCompanyName" runat="server" ClientIDMode="Static"
                            CssClass="form-control" placeholder="e.g. TCS" />
                    </div>

                    <!-- ================= PLACEMENT YEAR ================= -->
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

                    <!-- ================= BUTTONS ================= -->
                    <div class="d-grid gap-2 mt-3">
                        <asp:Button ID="placementSubmitBtn" runat="server" ClientIDMode="Static"
                            Text="Add Placed Student" CssClass="btn btn-rku btn-sm"
                            CausesValidation="false" UseSubmitBehavior="false"
                            OnClick="placementSubmitBtn_Click" />

                        <asp:Button ID="placementCancelBtn" runat="server" ClientIDMode="Static"
                            Text="Cancel" CssClass="btn btn-outline-secondary btn-sm"
                            CausesValidation="false" UseSubmitBehavior="false"
                            OnClick="placementCancelBtn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- SECTION 1: SUCCESS STORIES -->
    <div class="section-header mb-4">
        <div class="section-header-icon" style="background: rgba(163,15,20,0.1); color: var(--rku-maroon);">
            <i class="fa-solid fa-trophy"></i>
        </div>
        <div>
            <h5>Success Stories</h5>
            <p>Manage placed student stories shown on the website</p>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <!-- ==================== ALL SUCCESS STORIES ==================== -->
        <div class="col-xl-7 col-lg-6">
            <div class="content-section h-100">
                <div class="content-section-head">
                    <div class="fw-bold font-heading" style="font-size: 0.9rem;"><i class="fa-solid fa-list me-2 text-muted"></i>All Stories</div>
                    <span class="badge bg-light text-muted border" id="storyCountBadge" runat="server">0 stories</span>
                </div>
                <div class="content-section-body no-pad">
                    <div id="adminStoriesList" style="max-height: 580px; overflow-y: auto;">

<%--  ======================= GridView for Success Stories =======================--%>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" ShowHeader="False" GridLines="None" CssClass="w-100" OnRowCommand="GridView3_RowCommand">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center">
                                            <div class="d-flex align-items-center" style="max-width: 80%;">
                                                <%# (!string.IsNullOrEmpty(Eval("StudentPhoto") as string) && Eval("StudentPhoto").ToString().Trim() != "" && Eval("StudentPhoto").ToString() != "~/assets/PlacmentStudentImage/") ? "<img src='" + ResolveUrl(Eval("StudentPhoto").ToString()) + "' style='width:40px;height:40px;object-fit:cover;border-radius:50%;' class='me-3' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" /><span class='me-3' style='display:none;width:40px;height:40px;border-radius:50%;background:#f1f5f9;color:var(--rku-maroon);align-items:center;justify-content:center;font-weight:700;'><i class='fa-solid fa-user-graduate'></i></span>" : "<span class='me-3' style='width:40px;height:40px;border-radius:50%;background:#f1f5f9;color:var(--rku-maroon);display:inline-flex;align-items:center;justify-content:center;font-weight:700;'><i class='fa-solid fa-user-graduate'></i></span>" %>
                                                <div>
                                                    <div class="d-flex align-items-center gap-2 mb-1">
                                                        <%# (Eval("IsHallOfFame") != null && (Eval("IsHallOfFame").ToString() == "1" || Eval("IsHallOfFame").ToString().ToLower() == "true")) ? "<span class='badge bg-warning text-dark rounded-pill px-2' style='font-size:0.65rem;'>Hall of Fame (Rank " + Eval("PodiumRank") + ")</span>" : "<span class='badge bg-secondary text-white rounded-pill px-2' style='font-size:0.65rem;'>Standard</span>" %>
                                                        <span class="fw-bold text-rku-maroon font-monospace small"><%# Eval("Package") %></span>
                                                    </div>
                                                    <h6 class="fw-bold mb-0 text-dark font-heading"><%# Eval("StudentName") %></h6>
                                                    <p class="mb-0 text-muted small"><%# Eval("DegreeBranch") %> &bull; Placed at <strong><%# Eval("Recruiter") %></strong> (<%# Eval("JobDesignation") %>)</p>
                                                </div>
                                            </div>
                                            <div class="d-flex gap-1">
                                                <asp:LinkButton ID="btnStoryEdit" runat="server" CommandName="cmd_sedt" CommandArgument='<%# Eval("StoryId") %>' CssClass="btn btn-outline-primary btn-sm border-0" ToolTip="Edit Story">
                                                    <i class="fa-regular fa-pen-to-square"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnStoryDelete" runat="server" CommandName="cmd_sdel" CommandArgument='<%# Eval("StoryId") %>' CssClass="btn btn-outline-danger btn-sm border-0" ToolTip="Delete Story" OnClientClick="return confirm('Are you sure you want to delete this success story?');">
                                                    <i class="fa-regular fa-trash-can"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="lblNoStories" runat="server" CssClass="text-center text-muted small py-4 d-block" Text="No success stories added yet." Visible="false"></asp:Label>

                    </div>
                </div>
            </div>
        </div>

        <!-- ==================== STORY FORM ==================== -->
        <div class="col-xl-5 col-lg-6">
            <div class="form-panel" style="position: sticky; top: 20px;">
                <div class="form-panel-head">
                    <h6 class="fw-bold mb-0 font-heading" id="storyFormTitle" runat="server">
                        <i class="fa-solid fa-user-graduate me-2 text-rku-maroon"></i>Add Placed Student Story
                    </h6>
                </div>
                <div class="form-panel-body">
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
                                Style="display:none; width:80px; height:80px; object-fit:cover; border-radius:10px; margin:0 auto 10px;" />
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
                            Text="Publish Success Story" CssClass="btn btn-rku btn-sm"
                            CausesValidation="false" UseSubmitBehavior="false"
                            OnClick="storySubmitBtn_Click" />

                        <asp:Button ID="storyCancelBtn" runat="server" ClientIDMode="Static"
                            Text="Cancel" CssClass="btn btn-outline-secondary btn-sm"
                            CausesValidation="false" UseSubmitBehavior="false"
                            OnClick="storyCancelBtn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- SECTION 2: PLACEMENT GALLERY -->
    <div class="section-header mb-4">
        <div class="section-header-icon" style="background: rgba(23,162,184,0.1); color: #17a2b8;">
            <i class="fa-solid fa-images"></i>
        </div>
        <div>
            <h5>Placement Gallery</h5>
            <p>Upload photos shown in the gallery section of the website</p>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <!-- ==================== ALL GALLERY ITEMS ==================== -->
        <div class="col-xl-7 col-lg-6">
            <div class="content-section h-100">
                <div class="content-section-head">
                    <div class="fw-bold font-heading" style="font-size: 0.9rem;">
                        <i class="fa-regular fa-images me-2 text-muted"></i>Gallery Items
                    </div>
                    <span class="badge bg-light text-muted border" id="galleryCountBadge" runat="server">0 items</span>
                </div>
                <div class="content-section-body no-pad">
                    <div id="adminGalleryList" style="max-height: 400px; overflow-y: auto;">

                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeader="False" GridLines="None" CssClass="w-100" OnRowCommand="GridView2_RowCommand">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center">
                                            <div class="d-flex align-items-center" style="max-width: 80%;">
                                                <%# (!string.IsNullOrEmpty(Eval("GalleryImage") as string) && Eval("GalleryImage").ToString().Trim() != "" && Eval("GalleryImage").ToString() != "~/assets/GalleryImages/") ? "<img src='" + ResolveUrl(Eval("GalleryImage").ToString()) + "' style='width:48px;height:48px;object-fit:cover;border-radius:8px;' class='me-3' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" /><span class='me-3' style='display:none;width:48px;height:48px;border-radius:8px;background:#f1f5f9;color:#17a2b8;align-items:center;justify-content:center;font-weight:700;'><i class='fa-solid fa-image'></i></span>" : "<span class='me-3' style='width:48px;height:48px;border-radius:8px;background:#f1f5f9;color:#17a2b8;display:inline-flex;align-items:center;justify-content:center;font-weight:700;'><i class='fa-solid fa-image'></i></span>" %>
                                                <div>
                                                    <h6 class="fw-bold mb-0 text-dark font-heading"><%# Eval("GalleryTitle") %></h6>
                                                </div>
                                            </div>
                                            <div class="d-flex gap-1">
                                                <asp:LinkButton ID="btnGalleryEdit" runat="server" CommandName="cmd_gedt" CommandArgument='<%# Eval("GalleryTitle") %>' CssClass="btn btn-outline-primary btn-sm border-0" ToolTip="Edit">
                                                    <i class="fa-regular fa-pen-to-square"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnGalleryDelete" runat="server" CommandName="cmd_gdel" CommandArgument='<%# Eval("GalleryTitle") %>' CssClass="btn btn-outline-danger btn-sm border-0" ToolTip="Delete" OnClientClick="return confirm('Are you sure you want to delete this gallery item?');">
                                                    <i class="fa-regular fa-trash-can"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="lblNoGallery" runat="server" CssClass="text-center text-muted small py-4 d-block" Text="No gallery items added yet." Visible="false"></asp:Label>

                    </div>
                </div>
            </div>
        </div>

        <!-- ==================== GALLERY FORM ==================== -->
        <div class="col-xl-5 col-lg-6">
            <div class="form-panel" style="position: sticky; top: 20px;">
                <div class="form-panel-head">
                    <h6 class="fw-bold mb-0 font-heading">
                        <i class="fa-solid fa-plus-circle me-2" style="color: #17a2b8;"></i>Add Gallery Image
                    </h6>
                </div>
                <div class="form-panel-body">

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
                            CssClass="btn btn-rku btn-sm" CausesValidation="false" UseSubmitBehavior="false"
                            OnClick="gallerySubmitBtn_Click" />
                        <asp:Button ID="galleryCancelBtn" runat="server" Text="Cancel"
                            CssClass="btn btn-outline-secondary btn-sm" CausesValidation="false" UseSubmitBehavior="false"
                            OnClick="galleryCancelBtn_Click" />
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- SECTION 3: COMPANIES DIRECTORY -->
    <div class="section-header mb-4">
        <div class="section-header-icon" style="background: rgba(40,167,69,0.1); color: #28a745;">
            <i class="fa-solid fa-building"></i>
        </div>
        <div>
            <h5>Companies Directory</h5>
            <p>Add and manage recruiting companies shown on the Companies page</p>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-xl-7 col-lg-6">
            <div class="content-section h-100">
                <div class="content-section-head">
                    <div class="fw-bold font-heading" style="font-size: 0.9rem;"><i class="fa-solid fa-list me-2 text-muted"></i>Companies List</div>
                    <span class="badge bg-light text-muted border" id="companyCountBadge">0 companies</span>
                </div>
                <div class="content-section-body no-pad">
                    <div id="adminCompaniesList" style="max-height: 620px; overflow-y: auto;">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-5 col-lg-6">
            <div class="form-panel" style="position: sticky; top: 20px;">
                <div class="form-panel-head">
                    <h6 class="fw-bold mb-0 font-heading" id="companyFormTitle"><i class="fa-solid fa-plus-circle me-2" style="color: #28a745;"></i>Add Company</h6>
                </div>
                <div class="form-panel-body">
                    <div id="companyForm">
                        <input type="hidden" id="editCompanyId" value="">

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Company Name</label>
                            <input type="text" class="form-control" id="compName" placeholder="e.g. Wipro Technologies">
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Industry / Category</label>
                            <select class="form-select" id="compIndustry">
                                <option value="">-- Select Industry --</option>
                                <option value="it">IT / Software</option>
                                <option value="mnc">MNC</option>
                                <option value="consulting">Consulting</option>
                                <option value="finance">Finance</option>
                                <option value="fmcg">FMCG</option>
                                <option value="manufacturing">Manufacturing</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Tagline</label>
                            <input type="text" class="form-control" id="compTagline" placeholder="e.g. Apply thought">
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Description</label>
                            <textarea class="form-control" id="compDesc" rows="2" placeholder="Brief description of the company..."></textarea>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Location</label>
                                <input type="text" class="form-control" id="compLocation" placeholder="e.g. Bangalore">
                            </div>
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Package Range</label>
                                <input type="text" class="form-control" id="compPackage" placeholder="e.g. 3.5 - 8 LPA">
                            </div>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Open Roles</label>
                                <input type="text" class="form-control" id="compRoles" placeholder="e.g. 15 Open Roles">
                            </div>
                            <div class="col-6">
                                <label class="form-label text-muted small fw-bold">Website</label>
                                <input type="url" class="form-control" id="compWebsite" placeholder="https://wipro.com">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Company Logo (Optional)</label>
                            <input type="file" class="form-control" id="compLogo" accept="image/*">
                        </div>

                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Tags <span class="text-muted fw-normal">(comma-separated)</span></label>
                            <input type="text" class="form-control" id="compTags" placeholder="Java, Python, React">
                        </div>

                        <div class="d-grid gap-2 mt-3">
                            <button type="button" class="btn btn-rku btn-sm" id="companySubmitBtn" onclick="saveCompany(event)"><i class="fa-solid fa-plus me-1"></i>Add Company</button>
                            <button type="button" class="btn btn-outline-secondary btn-sm" id="companyCancelBtn" style="display: none;" onclick="cancelEditCompany()"><i class="fa-solid fa-xmark me-1"></i>Cancel Edit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- =====================================================
         SECTION 4: PLACEMENT TEAM
    ====================================================== -->
    <div class="section-header mb-4 mt-5">
        <div class="section-header-icon" style="background: rgba(163,15,20,0.1); color: var(--rku-maroon);">
            <i class="fa-solid fa-users-gear"></i>
        </div>
        <div>
            <h5>Placement Team</h5>
            <p>Manage placement team members shown on website</p>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <!-- ==================== ALL PLACEMENT TEAM MEMBERS (GRIDVIEW) ==================== -->
        <div class="col-xl-7 col-lg-6">
            <div class="content-section h-100">
                <div class="content-section-head">
                    <div class="fw-bold font-heading" style="font-size: 0.9rem;">
                        <i class="fa-solid fa-users me-2 text-muted"></i>Our Placement Team
                    </div>
                    <span class="badge bg-light text-muted border" id="teamCountBadge" runat="server">0 members</span>
                </div>
                <div class="content-section-body no-pad">
                    <div id="adminTeamList" style="max-height: 580px; overflow-y: auto;">
                        <asp:GridView ID="GridViewTeam" runat="server" AutoGenerateColumns="False" ShowHeader="False" GridLines="None" CssClass="w-100" OnRowCommand="GridViewTeam_RowCommand">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center">
                                            <div class="d-flex align-items-center" style="max-width: 80%;">
                                                <%# (!string.IsNullOrEmpty(Eval("MemberPhoto") as string) && Eval("MemberPhoto").ToString().Trim() != "" && Eval("MemberPhoto").ToString() != "~/assets/PlacmentCell_TeamImage/") ? "<img src='" + ResolveUrl(Eval("MemberPhoto").ToString()) + "' style='width:45px;height:45px;object-fit:cover;border-radius:50%;' class='me-3' onerror=\"this.style.display='none';this.nextElementSibling.style.display='inline-flex';\" /><span class='me-3' style='display:none;width:45px;height:45px;border-radius:50%;background:#f1f5f9;color:var(--rku-maroon);align-items:center;justify-content:center;font-weight:700;'><i class='fa-solid fa-user-tie'></i></span>" : "<span class='me-3' style='width:45px;height:45px;border-radius:50%;background:#f1f5f9;color:var(--rku-maroon);display:inline-flex;align-items:center;justify-content:center;font-weight:700;'><i class='fa-solid fa-user-tie'></i></span>" %>
                                                <div>
                                                    <div class="d-flex align-items-center gap-2 mb-1">
                                                        <span class="badge bg-rku-maroon text-white rounded-pill px-2" style="font-size:0.65rem;"><%# Eval("MemberRole") %></span>
                                                    </div>
                                                    <h6 class="fw-bold mb-0 text-dark font-heading"><%# Eval("MemberName") %></h6>
                                                    <p class="mb-0 text-muted small"><%# Eval("MemberDesc") %></p>
                                                    <small class="text-muted"><i class="fa-solid fa-phone me-1"></i><%# Eval("MemberMobile") %> &bull; <i class="fa-solid fa-envelope me-1"></i><%# Eval("MemberEmail") %></small>
                                                </div>
                                            </div>
                                            <div class="d-flex gap-1">
                                                <asp:LinkButton ID="btnTeamEdit" runat="server" CommandName="cmd_tedt" CommandArgument='<%# Eval("MemberName") %>' CssClass="btn btn-outline-primary btn-sm border-0" ToolTip="Edit Member">
                                                    <i class="fa-regular fa-pen-to-square"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="btnTeamDelete" runat="server" CommandName="cmd_tdel" CommandArgument='<%# Eval("MemberName") %>' CssClass="btn btn-outline-danger btn-sm border-0" ToolTip="Delete Member" OnClientClick="return confirm('Are you sure you want to delete this team member?');">
                                                    <i class="fa-regular fa-trash-can"></i>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="lblNoTeamMembers" runat="server" CssClass="text-center text-muted small py-4 d-block" Text="No team members added yet." Visible="false"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <!-- ==================== PLACEMENT TEAM FORM ==================== -->
        <div class="col-xl-5 col-lg-6">
            <div class="form-panel" style="position: sticky; top: 20px;">
                <!-- FORM HEADER -->
                <div class="form-panel-head">
                    <h6 class="fw-bold mb-0 font-heading" id="teamFormTitle" runat="server">
                        <i class="fa-solid fa-user-plus me-2 text-rku-maroon"></i>Add Placement Team Member
                    </h6>
                </div>

                <!-- FORM BODY (ASP.NET CONTROLS) -->
                <div class="form-panel-body">
                    <!-- ================= MEMBER PHOTO ================= -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Member Photo</label>
                        <label for="teamMemberPhoto" class="img-upload-zone d-block" style="cursor: pointer;">
                            <asp:Image ID="teamImagePreview" runat="server" ClientIDMode="Static"
                                Style="display:none; width:80px; height:80px; object-fit:cover; border-radius:10px; margin:0 auto 10px;" />
                            <div id="teamUploadHint">
                                <i class="fa-solid fa-cloud-arrow-up fa-2x text-muted mb-2 d-block"></i>
                                <span class="text-muted small">Click to upload photo</span>
                            </div>
                        </label>
                        <asp:FileUpload ID="teamMemberPhoto" runat="server" ClientIDMode="Static"
                            CssClass="d-none" accept="image/*" onchange="previewTeamImage(this)" />
                    </div>

                    <!-- ================= MEMBER NAME ================= -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Member Name</label>
                        <asp:TextBox ID="teamMemberName" runat="server" ClientIDMode="Static"
                            CssClass="form-control" placeholder="e.g. Dr. Amit Lathigara" />
                    </div>

                    <!-- ================= DESIGNATION / ROLE ================= -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Role / Designation</label>
                        <asp:TextBox ID="teamMemberRole" runat="server" ClientIDMode="Static"
                            CssClass="form-control" placeholder="e.g. Lead Coordinator / Coordinator" />
                    </div>

                    <!-- ================= RESPONSIBILITY / DESC ================= -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Description / Responsibility</label>
                        <asp:TextBox ID="teamMemberDesc" runat="server" ClientIDMode="Static" TextMode="MultiLine" Rows="2"
                            CssClass="form-control" placeholder="e.g. Planning & student coordination" />
                    </div>

                    <!-- ================= MOBILE NUMBER ================= -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Mobile Number</label>
                        <asp:TextBox ID="teamMemberMobile" runat="server" ClientIDMode="Static"
                            CssClass="form-control" placeholder="e.g. +91 98765 43210" />
                    </div>

                    <!-- ================= EMAIL ID ================= -->
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-bold">Email ID</label>
                        <asp:TextBox ID="teamMemberEmail" runat="server" ClientIDMode="Static"
                            CssClass="form-control" placeholder="e.g. placement@rku.ac.in" />
                    </div>

                    <!-- ================= BUTTONS ================= -->
                    <div class="d-grid gap-2 mt-3">
                        <asp:Button ID="teamSubmitBtn" runat="server" ClientIDMode="Static"
                            Text="Add Team Member" CssClass="btn btn-rku btn-sm"
                            CausesValidation="false" UseSubmitBehavior="false"
                            OnClick="teamSubmitBtn_Click" />

                        <asp:Button ID="teamCancelBtn" runat="server" ClientIDMode="Static"
                            Text="Cancel" CssClass="btn btn-outline-secondary btn-sm"
                            CausesValidation="false" UseSubmitBehavior="false"
                            OnClick="teamCancelBtn_Click" />
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

            renderCompaniesList();
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

        // 3. Companies Directory Management
        function renderCompaniesList() {
            const companies = PortalDB.getCompanies();
            const list = document.getElementById('adminCompaniesList');
            const countBadge = document.getElementById('companyCountBadge');
            if (countBadge) countBadge.textContent = `${companies.length} companies`;
            if (!list) return;
            list.innerHTML = '';

            if (companies.length === 0) {
                list.innerHTML = `<p class="text-center text-muted small py-4">No companies added yet.</p>`;
                return;
            }

            companies.forEach(c => {
                const div = document.createElement('div');
                div.className = 'list-group-item border-0 border-bottom p-3 d-flex justify-content-between align-items-center';
                const logoHtml = c.logoBase64 ? `<img src="${c.logoBase64}" alt="${c.name}" style="height: 36px; width: 36px; object-fit: contain;" class="me-2 rounded">` : `<span class="me-2" style="width:36px;height:36px;border-radius:6px;background:#eee;display:inline-flex;align-items:center;justify-content:center;"><i class="fa-solid fa-building text-muted"></i></span>`;
                div.innerHTML = `
                    <div class="d-flex align-items-center" style="max-width: 80%;">
                        ${logoHtml}
                        <div>
                            <h6 class="fw-bold mb-0 text-dark font-heading">${c.name}</h6>
                            <p class="mb-0 text-muted small">${c.industry} &bull; ${c.location || '-'} &bull; ${c.packageRange || '-'}</p>
                        </div>
                    </div>
                    <div class="d-flex gap-1">
                        <button type="button" class="btn btn-outline-primary btn-sm border-0" onclick="editCompany('${c.id}')" title="Edit Company"><i class="fa-regular fa-pen-to-square"></i></button>
                        <button type="button" class="btn btn-outline-danger btn-sm border-0" onclick="deleteCompany('${c.id}')" title="Delete Company"><i class="fa-regular fa-trash-can"></i></button>
                    </div>
                `;
                list.appendChild(div);
            });
        }

        async function saveCompany(e) {
            if (e) e.preventDefault();
            const editId = document.getElementById('editCompanyId').value;
            const name = document.getElementById('compName').value.trim();
            const industry = document.getElementById('compIndustry').value.trim();
            const tagline = document.getElementById('compTagline').value.trim();
            const description = document.getElementById('compDesc').value.trim();
            const location = document.getElementById('compLocation').value.trim();
            const packageRange = document.getElementById('compPackage').value.trim();
            const openRoles = document.getElementById('compRoles').value.trim();
            const website = document.getElementById('compWebsite').value.trim();
            const tagsInput = document.getElementById('compTags').value.trim();
            const tags = tagsInput ? tagsInput.split(',').map(t => t.trim()) : [];

            if (!name) {
                alert('Please enter Company Name.');
                document.getElementById('compName').focus();
                return;
            }
            if (!industry) {
                alert('Please select Industry.');
                document.getElementById('compIndustry').focus();
                return;
            }

            const fileInput = document.getElementById('compLogo');
            let logoBase64 = editId ? (PortalDB.getCompanies().find(c => c.id === editId)?.logoBase64 || '') : '';
            if (fileInput && fileInput.files.length > 0) {
                try {
                    logoBase64 = await getBase64(fileInput.files[0]);
                } catch (error) {
                    alert('Error reading logo file.');
                    return;
                }
            }

            const companyData = { name, industry, tagline, description, location, packageRange, openRoles, website, logoBase64, tags };

            if (editId) {
                PortalDB.updateCompany(editId, companyData);
                alert('Company updated successfully!');
            } else {
                PortalDB.addCompany(companyData);
                alert('Company added successfully!');
            }

            cancelEditCompany();
            renderCompaniesList();
        }

        function deleteCompany(id) {
            if (confirm('Are you sure you want to delete this company?')) {
                PortalDB.deleteCompany(id);
                renderCompaniesList();
            }
        }

        function editCompany(id) {
            const c = PortalDB.getCompanies().find(x => x.id === id);
            if (!c) return;
            document.getElementById('editCompanyId').value = c.id;
            document.getElementById('compName').value = c.name;
            document.getElementById('compIndustry').value = c.industry;
            document.getElementById('compTagline').value = c.tagline || '';
            document.getElementById('compDesc').value = c.description || '';
            document.getElementById('compLocation').value = c.location || '';
            document.getElementById('compPackage').value = c.packageRange || '';
            document.getElementById('compRoles').value = c.openRoles || '';
            document.getElementById('compWebsite').value = c.website || '';
            document.getElementById('compTags').value = c.tags ? c.tags.join(', ') : '';
            document.getElementById('companyFormTitle').textContent = 'Edit Company';
            document.getElementById('companySubmitBtn').innerHTML = '<i class="fa-solid fa-floppy-disk me-1"></i> Save Changes';
            document.getElementById('companyCancelBtn').style.display = 'block';
            document.getElementById('companyForm').scrollIntoView({ behavior: 'smooth', block: 'start' });
        }

        function cancelEditCompany() {
            document.getElementById('editCompanyId').value = '';
            document.getElementById('compName').value = '';
            document.getElementById('compIndustry').value = '';
            document.getElementById('compTagline').value = '';
            document.getElementById('compDesc').value = '';
            document.getElementById('compLocation').value = '';
            document.getElementById('compPackage').value = '';
            document.getElementById('compRoles').value = '';
            document.getElementById('compWebsite').value = '';
            document.getElementById('compLogo').value = '';
            document.getElementById('compTags').value = '';
            document.getElementById('companyFormTitle').textContent = 'Add Company';
            document.getElementById('companySubmitBtn').innerHTML = '<i class="fa-solid fa-plus me-1"></i> Add Company';
            document.getElementById('companyCancelBtn').style.display = 'none';
        }
    </script>
</asp:Content>
