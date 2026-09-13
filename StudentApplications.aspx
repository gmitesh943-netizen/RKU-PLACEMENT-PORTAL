<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentApplications.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="dashboard-card">
        <h5 class="fw-bold mb-4">Track Application Status</h5>
        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th style="font-family: var(--font-heading);">Drive Details</th>
                        <th style="font-family: var(--font-heading);">Package</th>
                        <th style="font-family: var(--font-heading);">Applied Date</th>
                        <th style="font-family: var(--font-heading);">Status</th>
                        <th style="font-family: var(--font-heading); text-align: center;">Actions / Progress</th>
                    </tr>
                </thead>
                <tbody id="applicationsTableBody"></tbody>
            </table>
        </div>
        <div id="emptyApplicationsState" class="text-center py-5 d-none">
            <i class="fa-solid fa-folder-open text-muted mb-3" style="font-size: 3rem;"></i>
            <h6 class="fw-bold text-dark">No Applications Yet</h6>
            <p class="text-muted small">Go to the Campus Drives tab to apply for open job roles.</p>
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
