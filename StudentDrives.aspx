<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentDrives.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentDrives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="dashboard-card drive-filter-shell mb-4">
        <div class="row g-3 align-items-center">
            <div class="col-lg-5">
                <div class="input-group">
                    <span class="input-group-text bg-white"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                    <input type="text" class="form-control" id="driveSearchInput" placeholder="Search Company or Role..." onkeyup="filterDrives()">
                </div>
            </div>
            <div class="col-lg-3">
                <select class="form-select" id="driveEligibilityFilter" onchange="filterDrives()">
                    <option value="all">All Drives</option>
                    <option value="eligible">Eligible Drives Only</option>
                </select>
            </div>
            <div class="col-lg-4 text-lg-end">
                <div class="text-muted small mb-1">Browse drives matched to your profile</div>
                <div class="fw-bold text-rku-maroon" id="driveCountLabel">All Open Drives</div>
            </div>
        </div>
    </div>

    <div class="row g-4" id="drivesGrid"></div>

</asp:Content>
