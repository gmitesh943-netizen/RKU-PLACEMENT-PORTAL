<%@ Page Title="My Profile | RKU Placement Portal" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-hero {
            background: #ffffff;
            border: 1px solid #eef0f3;
            border-radius: 16px;
            padding: 1.5rem 1.75rem;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.02);
            margin-bottom: 1.5rem;
        }

        .profile-hero-kicker {
            font-size: 0.75rem;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--rku-red, #ef3724);
            font-weight: 800;
            margin-bottom: 0.35rem;
            font-family: var(--font-heading, 'Outfit', sans-serif);
        }

        .profile-hero h2 {
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-weight: 800;
            color: #111827;
            margin-bottom: 0.35rem;
        }

        .profile-hero p {
            margin-bottom: 0;
            color: #64748b;
            font-size: 0.95rem;
        }

        .profile-section-header {
            font-family: var(--font-heading, 'Outfit', sans-serif);
            font-weight: 700;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: var(--rku-maroon, #a30f14);
            margin-bottom: 1.25rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid rgba(163, 15, 20, 0.1);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .locked-field-badge {
            font-size: 0.7rem;
            background: #f1f5f9;
            color: #64748b;
            padding: 2px 6px;
            border-radius: 4px;
            font-weight: 600;
        }

        .btn-rku {
            background: linear-gradient(135deg, #ef3724 0%, #a30f14 100%);
            color: #ffffff !important;
            border: none;
            font-weight: 600;
            font-family: var(--font-heading, 'Outfit', sans-serif);
            border-radius: 8px;
            padding: 0.6rem 1.5rem;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(163, 15, 20, 0.18);
        }

            .btn-rku:hover {
                box-shadow: 0 4px 14px rgba(163, 15, 20, 0.3);
                transform: translateY(-1px);
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!-- Hero Header -->
    <div class="profile-hero">
        <div class="row align-items-center g-3">
            <div class="col-lg-8">
                <div class="profile-hero-kicker">STUDENT WORKSPACE</div>
                <h2 class="mb-1">My Academic &amp; Placement Profile</h2>
                <p>Manage your academic credentials, CPI, contact information, and upload your latest resume PDF.</p>
            </div>
            <div class="col-lg-4 text-lg-end">
                <asp:Button ID="btnSaveChangesTop" runat="server" Text="Save Profile Changes" CssClass="btn btn-rku" OnClick="btnSaveChanges_Click" />
            </div>
        </div>
    </div>

    <!-- Alert / Message -->
    <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="alert alert-dismissible fade show mb-4 d-block" role="alert"></asp:Label>

    <div class="row g-4">
        <div class="col-12">
            <div class="dashboard-card p-4">

                <!-- 1. PERSONAL & REGISTRATION INFO -->
                <div class="profile-section-header">
                    <i class="fa-solid fa-user-gear"></i>Personal &amp; Registration Details
               
               
                </div>

                <div class="d-flex align-items-center gap-4 mb-4 p-3 bg-light rounded-3 border">
                    <div class="position-relative">
                        <div id="profPhotoContainer" class="rounded-circle overflow-hidden bg-rku-maroon text-white fw-bold d-flex align-items-center justify-content-center border border-2 border-white shadow-sm" style="width: 80px; height: 80px;">
                            <asp:Image ID="imgProfPhoto" runat="server" Style="width: 100%; height: 100%; object-fit: cover;" Visible="false" />
                            <asp:Label ID="profPhotoInitials" runat="server" Style="font-size: 1.4rem;">SP</asp:Label>
                        </div>
                    </div>
                    <div class="flex-grow-1">
                        <h6 class="fw-bold mb-1 text-dark">Profile Picture</h6>
                        <p class="text-muted small mb-2">Upload a formal photo for campus placements (JPG, PNG)</p>
                        <div class="d-flex gap-2 align-items-center">
                            <asp:FileUpload ID="profPhotoInput" runat="server" CssClass="form-control form-control-sm" Style="max-width: 320px;" />
                        </div>
                    </div>
                </div>

                <div class="row g-3 mb-4">
                    <div class="col-md-6">

                        <label class="form-label text-dark small fw-bold">Full Name <span class="locked-field-badge"><i class="fa-solid fa-lock me-1"></i>From Registration</span></label>
                        <asp:TextBox ID="profName" runat="server" CssClass="form-control bg-light" Enabled="false" />
                        <div class="form-text small text-muted">Registered name cannot be changed.</div>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label text-dark small fw-bold">Enrollment / Roll No. <span class="locked-field-badge"><i class="fa-solid fa-lock me-1"></i>From Registration</span></label>
                        <asp:TextBox ID="profEnroll" runat="server" CssClass="form-control bg-light font-monospace" Enabled="false" />
                        <div class="form-text small text-muted">Registered enrollment number is locked.</div>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label text-dark small fw-bold">Email Address</label>
                        <asp:TextBox ID="profEmail" runat="server" CssClass="form-control" placeholder="e.g. student@rku.ac.in" />
                    </div>

                    <div class="col-md-6">
                        <label class="form-label text-dark small fw-bold">Mobile Number</label>
                        <asp:TextBox ID="profMobile" runat="server" CssClass="form-control" placeholder="e.g. 9876543210" />
                    </div>
                </div>

                <!-- 2. ACADEMIC INFORMATION -->
                <div class="profile-section-header mt-4">
                    <i class="fa-solid fa-graduation-cap"></i>Academic Information &amp; Scores
               
               
                </div>

                <div class="row g-3 mb-4">
                    <div class="col-md-4">
                        <label class="form-label text-dark small fw-bold">Degree Program</label>
                        <asp:DropDownList ID="profDegree" runat="server" CssClass="form-select">
                            <asp:ListItem Value="BCA">BCA (Bachelor of Computer Applications)</asp:ListItem>
                            <asp:ListItem Value="MCA">MCA (Master of Computer Applications)</asp:ListItem>
                            <asp:ListItem Value="B.Tech">B.Tech (Engineering)</asp:ListItem>
                            <asp:ListItem Value="M.Tech">M.Tech (Engineering)</asp:ListItem>
                            <asp:ListItem Value="MBA">MBA (Management)</asp:ListItem>
                            <asp:ListItem Value="B.Sc">B.Sc (IT / Science)</asp:ListItem>
                            <asp:ListItem Value="Diploma">Diploma Engineering</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label text-dark small fw-bold">Branch / Specialization</label>
                        <asp:DropDownList ID="profBranch" runat="server" CssClass="form-select">
                            <asp:ListItem Value="Computer Science">Computer Science / IT</asp:ListItem>
                            <asp:ListItem Value="Information Technology">Information Technology</asp:ListItem>
                            <asp:ListItem Value="Computer Engineering">Computer Engineering</asp:ListItem>
                            <asp:ListItem Value="Mechanical Engineering">Mechanical Engineering</asp:ListItem>
                            <asp:ListItem Value="Civil Engineering">Civil Engineering</asp:ListItem>
                            <asp:ListItem Value="Electrical Engineering">Electrical Engineering</asp:ListItem>
                            <asp:ListItem Value="Marketing &amp; HR">Marketing &amp; HR</asp:ListItem>
                            <asp:ListItem Value="Finance">Finance</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label text-dark small fw-bold">Current Semester</label>
                        <asp:DropDownList ID="profSemester" runat="server" CssClass="form-select">
                            <asp:ListItem Value="1st">1st Semester</asp:ListItem>
                            <asp:ListItem Value="2nd">2nd Semester</asp:ListItem>
                            <asp:ListItem Value="3rd">3rd Semester</asp:ListItem>
                            <asp:ListItem Value="4th">4th Semester</asp:ListItem>
                            <asp:ListItem Value="5th">5th Semester</asp:ListItem>
                            <asp:ListItem Value="6th" Selected="True">6th Semester</asp:ListItem>
                            <asp:ListItem Value="7th">7th Semester</asp:ListItem>
                            <asp:ListItem Value="8th">8th Semester</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label text-dark small fw-bold">Cumulative CPI / CGPA (out of 10.0)</label>
                        <asp:TextBox ID="profCgpa" runat="server" CssClass="form-control" placeholder="e.g. 8.50" />
                        <div class="form-text small text-muted">Recruiters will evaluate your eligibility based on this CPI.</div>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label text-dark small fw-bold">Active Backlogs (if any)</label>
                        <asp:TextBox ID="profBacklogs" runat="server" CssClass="form-control" placeholder="0" />
                        <div class="form-text small text-muted">Enter 0 if all previous semester subjects are cleared.</div>
                    </div>
                </div>

                <!-- 3. SKILLS & RESUME PDF UPLOAD -->
                <div class="profile-section-header mt-4">
                    <i class="fa-solid fa-file-lines"></i>Technical Skills &amp; Resume PDF               
                </div>

                <div class="row g-3 mb-4">
                    <div class="col-md-12">
                        <label class="form-label text-dark small fw-bold">Technical Skills &amp; Proficiencies</label>
                        <asp:TextBox ID="profSkills" runat="server" CssClass="form-control" placeholder="e.g. C#, ASP.NET, SQL Server, Python, HTML5, CSS3, JavaScript, Git" />
                        <div class="form-text small text-muted">Separate multiple skills with commas.</div>
                    </div>

                    <div class="col-md-12">
                        <label class="form-label text-dark small fw-bold">Upload Resume (.PDF)</label>
                        <div class="p-3 bg-light rounded-3 border">
                            <div class="row align-items-center g-3">
                                <div class="col-md-6">
                                    <label class="form-label small text-muted mb-1">Select Resume PDF from your computer</label>
                                    <asp:FileUpload ID="fuResume" runat="server" CssClass="form-control" />
                                </div>
                                <div class="col-md-6">
                                    <asp:PlaceHolder ID="phCurrentResume" runat="server" Visible="false">
                                        <label class="form-label small text-muted mb-1">Currently Uploaded Resume</label>
                                        <div>
                                            <asp:HyperLink ID="lnkCurrentResume" runat="server" Target="_blank" CssClass="btn btn-sm btn-outline-danger px-3 py-2"><i class="fa-solid fa-file-pdf me-2"></i>View Resume (<asp:Label ID="lblCurrentResumeName" runat="server"></asp:Label>)</asp:HyperLink>
                                        </div>
                                    </asp:PlaceHolder>
                                </div>
                            </div>
                            <div class="form-text small text-muted mt-2">
                                <i class="fa-solid fa-circle-info me-1 text-primary"></i>
                                When you apply for a drive, companies will directly view and download this PDF resume.
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Action Footer -->
            <div class="d-flex justify-content-end gap-3 mt-4 pt-3 border-top">
                <asp:Button ID="btnReset" runat="server" Text="Reset Fields" CssClass="btn btn-outline-secondary px-4" OnClick="btnReset_Click" />
                <asp:Button ID="btnSaveChanges" runat="server" Text="Save Profile Changes" CssClass="btn btn-rku px-4" OnClick="btnSaveChanges_Click" />
            </div>

        </div>
    </div>
    </div>

</asp:Content>
