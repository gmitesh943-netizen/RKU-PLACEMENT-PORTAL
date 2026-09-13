<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="row g-4">
        <div class="col-12">
            <div class="dashboard-card">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="fw-bold mb-0">Update Academic &amp; Contact Details</h5>
                    <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" CssClass="btn btn-rku btn-sm" OnClick="btnSaveChanges_Click" />
                </div>

                <asp:Label ID="lblMsg" runat="server" CssClass="alert alert-success d-block mb-4" Visible="false"></asp:Label>

                <div id="studentProfileForm">
                    <h6 class="text-rku-maroon fw-bold mb-3 border-bottom pb-2">Profile Photo &amp; Personal Info</h6>
                    <div class="d-flex align-items-center gap-4 mb-4 p-3 bg-light rounded-3 border">
                        <div class="position-relative">
                            <div id="profPhotoContainer" class="rounded-circle overflow-hidden bg-rku-maroon text-white fw-bold d-flex align-items-center justify-content-center border border-2 border-white shadow-sm profile-photo-shell" style="width:75px; height:75px;">
                                <asp:Image ID="imgProfPhoto" runat="server" Style="width:100%; height:100%; object-fit:cover;" Visible="false" />
                                <span id="profPhotoInitials" runat="server">SP</span>
                            </div>
                        </div>
                        <div>
                            <h6 class="fw-bold mb-1">Profile Photo</h6>
                            <p class="text-muted small mb-2">Upload your formal profile picture (JPG, PNG)</p>
                            <div class="d-flex gap-2">
                                <label for="profPhotoInput" class="btn btn-outline-primary btn-sm mb-0"><i class="fa-solid fa-camera me-1"></i>Choose Photo</label>
                                <asp:FileUpload ID="profPhotoInput" runat="server" CssClass="d-none" ClientIDMode="Static" onchange="previewPhoto(this);" />
                                <asp:LinkButton ID="btnRemovePhoto" runat="server" CssClass="btn btn-outline-danger btn-sm" OnClientClick="removeStudentPhoto(); return false;">
                                    <i class="fa-solid fa-trash-can"></i>Remove
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <div class="row g-3 mb-4">
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold">Full Name</label>
                            <asp:TextBox ID="profName" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold">Enrollment / Roll No.</label>
                            <asp:TextBox ID="profEnroll" runat="server" CssClass="form-control" Enabled="false" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold">Email Address</label>
                            <asp:TextBox ID="profEmail" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold">Mobile Number</label>
                            <asp:TextBox ID="profMobile" runat="server" CssClass="form-control" />
                        </div>
                    </div>

                    <h6 class="text-rku-maroon fw-bold mb-3 border-bottom pb-2">Academic Information</h6>
                    <div class="row g-3 mb-4">
                        <div class="col-md-4">
                            <label class="form-label text-muted small fw-bold">Degree Program</label>
                            <asp:DropDownList ID="profDegree" runat="server" CssClass="form-select">
                                <asp:ListItem Value="B.Tech">B.Tech</asp:ListItem>
                                <asp:ListItem Value="M.Tech">M.Tech</asp:ListItem>
                                <asp:ListItem Value="BCA">BCA</asp:ListItem>
                                <asp:ListItem Value="MCA">MCA</asp:ListItem>
                                <asp:ListItem Value="MBA">MBA</asp:ListItem>
                                <asp:ListItem Value="B.Sc">B.Sc</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label text-muted small fw-bold">Branch / Specialization</label>
                            <asp:DropDownList ID="profBranch" runat="server" CssClass="form-select">
                                <asp:ListItem Value="Computer Engineering">Computer Engineering</asp:ListItem>
                                <asp:ListItem Value="Information Technology">Information Technology</asp:ListItem>
                                <asp:ListItem Value="Mechanical Engineering">Mechanical Engineering</asp:ListItem>
                                <asp:ListItem Value="Civil Engineering">Civil Engineering</asp:ListItem>
                                <asp:ListItem Value="Marketing">Marketing</asp:ListItem>
                                <asp:ListItem Value="Finance">Finance</asp:ListItem>
                                <asp:ListItem Value="Human Resources">Human Resources</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label text-muted small fw-bold">Current Semester</label>
                            <asp:DropDownList ID="profSemester" runat="server" CssClass="form-select">
                                <asp:ListItem Value="1st">1st Sem</asp:ListItem>
                                <asp:ListItem Value="2nd">2nd Sem</asp:ListItem>
                                <asp:ListItem Value="3rd">3rd Sem</asp:ListItem>
                                <asp:ListItem Value="4th">4th Sem</asp:ListItem>
                                <asp:ListItem Value="5th">5th Sem</asp:ListItem>
                                <asp:ListItem Value="6th">6th Sem</asp:ListItem>
                                <asp:ListItem Value="7th">7th Sem</asp:ListItem>
                                <asp:ListItem Value="8th">8th Sem</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold">Cumulative GPA (CGPA)</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Number" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label text-muted small fw-bold">Active Backlogs</label>
                            <asp:TextBox ID="profBacklogs" runat="server" CssClass="form-control" TextMode="Number" />
                        </div>
                    </div>

                    <h6 class="text-rku-maroon fw-bold mb-3 border-bottom pb-2">Skills &amp; Resume</h6>
                    <div class="row g-3 mb-4">
                        <div class="col-md-12">
                            <label class="form-label text-muted small fw-bold">Skills (comma-separated, e.g. Java, HTML, SEO)</label>
                            <asp:TextBox ID="profSkills" runat="server" CssClass="form-control" placeholder="Enter skills separated by commas" />
                        </div>
                        <div class="col-md-12">
                            <label class="form-label text-muted small fw-bold">Uploaded Resume PDF Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa-solid fa-file-pdf text-rku-red"></i></span>
                                <asp:TextBox ID="profResume" runat="server" CssClass="form-control" placeholder="Resume_Filename.pdf" />
                                <asp:Button ID="btnMockResumeUpload" runat="server" Text="Upload Mock PDF" CssClass="btn btn-outline-secondary" OnClientClick="mockResumeUpload(); return false;" />
                            </div>
                            <div class="form-text">For template demonstration, type a dummy filename or click the upload mock button.</div>
                        </div>
                    </div>

                    <h6 class="text-rku-maroon fw-bold mb-3 border-bottom pb-2 d-flex justify-content-between align-items-center">
                        <span><i class="fa-solid fa-certificate me-2"></i>Certificates &amp; Achievements</span>
                        <asp:LinkButton ID="btnAddCertificate" runat="server" CssClass="btn btn-outline-primary btn-sm" OnClientClick="toggleCertificateForm(); return false;">
                            <i class="fa-solid fa-plus me-1"></i>Add Certificate
                        </asp:LinkButton>
                    </h6>
                    <div id="certFormContainer" class="p-3 bg-light rounded-3 border mb-4" style="display: none;">
                        <h6 class="fw-bold small mb-3 text-dark">Add New Certificate</h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label text-muted small fw-bold">Certificate Title</label>
                                <asp:TextBox ID="certTitle" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. AWS Certified Cloud Practitioner" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label text-muted small fw-bold">Issuing Organization</label>
                                <asp:TextBox ID="certIssuer" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. Coursera / Udemy / RKU" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label text-muted small fw-bold">Issue Date</label>
                                <asp:TextBox ID="certDate" runat="server" CssClass="form-control form-control-sm" TextMode="Date" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label text-muted small fw-bold">Upload Certificate File / Image</label>
                                <asp:FileUpload ID="certFile" runat="server" CssClass="form-control form-control-sm" />
                            </div>
                            <div class="col-12 text-end mt-3">
                                <asp:Button ID="btnCancelCertificate" runat="server" Text="Cancel" CssClass="btn btn-sm btn-secondary me-1" OnClientClick="toggleCertificateForm(); return false;" />
                                <asp:Button ID="btnSaveCertificate" runat="server" Text="Save Certificate" CssClass="btn btn-sm btn-rku" OnClick="btnSaveCertificate_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="row g-3" id="certificatesList"></div>

                    <h6 class="text-rku-maroon fw-bold mt-5 mb-3 border-bottom pb-2 d-flex justify-content-between align-items-center">
                        <span><i class="fa-solid fa-file-lines me-2"></i>Results &amp; Mark Sheets</span>
                        <asp:Button ID="btnAddResult" runat="server" Text="Add Result" CssClass="btn btn-outline-primary btn-sm" OnClientClick="toggleResultForm(); return false;" />
                    </h6>
                    <div id="resultFormContainer" class="p-3 bg-light rounded-3 border mb-4" style="display: none;">
                        <h6 class="fw-bold small mb-3 text-dark">Add New Result</h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label text-muted small fw-bold">Semester / Subject</label>
                                <asp:TextBox ID="txtResultTitle" runat="server" CssClass="form-control form-control-sm" placeholder="e.g. Semester 5 / Java Programming" />
                            </div>
                            <div class="col-md-6">
                                <label class="form-label text-muted small fw-bold">Upload Mark Sheet Image</label>
                                <asp:FileUpload ID="fuResult" runat="server" CssClass="form-control form-control-sm" />
                            </div>
                            <div class="col-12 text-end mt-3">
                                <asp:Button ID="btnCancelResult" runat="server" Text="Cancel" CssClass="btn btn-sm btn-secondary me-1" OnClientClick="toggleResultForm(); return false;" />
                                <asp:Button ID="btnSaveResult" runat="server" Text="Save Result" CssClass="btn btn-sm btn-rku" OnClick="btnSaveResult_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="row g-3" id="resultsList"></div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function previewPhoto(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var container = document.getElementById('profPhotoContainer');
                    container.innerHTML = '<img src="' + e.target.result + '" style="width:100%; height:100%; object-fit:cover;" />';
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        function removeStudentPhoto() {
            var container = document.getElementById('profPhotoContainer');
            container.innerHTML = '<span id="profPhotoInitials">SP</span>';
            var input = document.getElementById('profPhotoInput');
            if (input) input.value = '';
        }
    </script>

</asp:Content>
