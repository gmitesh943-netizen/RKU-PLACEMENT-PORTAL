<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="row g-4">
        <div class="col-12">
            <div class="dashboard-card welcome-gradient-card">
                <div class="row align-items-center py-2">
                    <div class="col-lg-8">
                        <h2 class="fw-bold mb-2">Hello, <span id="helloStudentName">Student</span>!</h2>
                        <p class="mb-3 opacity-90">
                            Welcome to your RK University Placement Dashboard. Apply to active drives, update your resume, and track every step of your career journey.</p>
                        <div class="d-flex flex-wrap gap-2">
                            <span class="badge bg-white text-rku-maroon px-3 py-2 rounded-2 fw-semibold">Status: <span id="profileStatusBadge">In Progress</span></span>
                            <span class="badge bg-light text-dark px-3 py-2 rounded-2 fw-semibold"><i class="fa-solid fa-graduation-cap me-1"></i>CGPA: <span id="overviewCgpa">0.0</span></span>
                        </div>
                    </div>
                    <div class="col-lg-4 text-center d-none d-lg-block">
                        <i class="fa-solid fa-rocket opacity-20" style="font-size: 8rem; color: #fff;"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-6 col-xl-3">
            <div class="stat-widget">
                <div class="stat-widget-icon bg-icon-primary"><i class="fa-solid fa-file-invoice"></i></div>
                <div class="stat-widget-info"><h3 id="statApplied">0</h3><span>Applied Drives</span></div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="stat-widget">
                <div class="stat-widget-icon bg-icon-warning"><i class="fa-solid fa-user-clock"></i></div>
                <div class="stat-widget-info"><h3 id="statPending">0</h3><span>Shortlisted / In Process</span></div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="stat-widget">
                <div class="stat-widget-icon bg-icon-success"><i class="fa-solid fa-circle-check"></i></div>
                <div class="stat-widget-info"><h3 id="statOffers">0</h3><span>Offers Received</span></div>
            </div>
        </div>
        <div class="col-sm-6 col-xl-3">
            <div class="stat-widget">
                <div class="stat-widget-icon bg-icon-info"><i class="fa-solid fa-award"></i></div>
                <div class="stat-widget-info"><h3 id="statEligibility">0</h3><span>Eligible Drives</span></div>
            </div>
        </div>

        <div class="col-lg-7">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3 d-flex justify-content-between">
                    <span>Profile Completeness</span>
                    <span class="text-rku-maroon" id="profileCompletionPercent">0%</span>
                </h5>
                <div class="progress mb-4" style="height: 12px; border-radius: 50px;">
                    <div class="progress-bar bg-rku-red progress-bar-striped progress-bar-animated"
                         id="profileProgressBar" role="progressbar" style="width: 0%"></div>
                </div>
                <div class="list-group list-group-flush" id="profileChecklist"></div>
            </div>
        </div>

        <div class="col-lg-5">
            <div class="dashboard-card">
                <h5 class="fw-bold mb-3"><i class="fa-regular fa-bell text-rku-red me-2"></i>Latest Broadcasts</h5>
                <div class="list-group list-group-flush overflow-auto" id="announcementsList" style="max-height: 320px;"></div>
            </div>
        </div>
    </div>

    <%-- Application Progress Modal --%>
    <div class="modal fade" id="progressModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold" id="progressModalTitle" style="font-family: var(--font-heading);">Application Tracker</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body py-4">
                    <div class="text-center mb-4">
                        <h4 class="fw-bold mb-1" id="trackCompany">Company</h4>
                        <p class="text-muted" id="trackRole">Software Engineer</p>
                    </div>
                    <div class="step-progress-container">
                        <div class="position-relative">
                            <div class="step-progress-bar-fill" id="modalProgressBarFill"></div>
                            <ul class="step-progress">
                                <li class="step-progress-item" id="step-Applied">
                                    <div class="step-progress-dot">1</div>
                                    <div class="step-progress-label">Applied</div>
                                </li>
                                <li class="step-progress-item" id="step-Shortlisted">
                                    <div class="step-progress-dot">2</div>
                                    <div class="step-progress-label">Shortlisted</div>
                                </li>
                                <li class="step-progress-item" id="step-Technical">
                                    <div class="step-progress-dot">3</div>
                                    <div class="step-progress-label">Technical Round</div>
                                </li>
                                <li class="step-progress-item" id="step-HR">
                                    <div class="step-progress-dot">4</div>
                                    <div class="step-progress-label">HR Round</div>
                                </li>
                                <li class="step-progress-item" id="step-Final">
                                    <div class="step-progress-dot" id="finalDot"><i class="fa-solid fa-check"></i></div>
                                    <div class="step-progress-label" id="finalLabel">Offer Issued</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="card bg-light border-0 mt-4">
                        <div class="card-body">
                            <h6 class="fw-bold mb-2 font-heading">Current Status Description</h6>
                            <p class="mb-0 small text-muted" id="modalStatusDetails">Loading status description...</p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
