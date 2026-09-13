<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="StudentTraining.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.StudentTraining" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="row g-4">
        <div class="col-md-6 col-lg-4">
            <div class="dashboard-card">
                <div class="text-rku-maroon mb-3"><i class="fa-solid fa-laptop-code" style="font-size: 2.5rem;"></i></div>
                <h5 class="fw-bold">Aptitude &amp; Reasoning Mock Test</h5>
                <p class="text-muted small">Practice full-length aptitude tests including Quantitative Ability, Logical Reasoning, and Verbal Ability structured exactly like TCS NQT and Infosys tests.</p>
                <a href="#" class="btn btn-rku btn-sm w-100 mt-2" onclick="alert('Mock Test started! (Simulated)')">Start Test Now</a>
            </div>
        </div>
        <div class="col-md-6 col-lg-4">
            <div class="dashboard-card">
                <div class="text-success mb-3"><i class="fa-solid fa-code" style="font-size: 2.5rem;"></i></div>
                <h5 class="fw-bold">Technical Coding Challenges</h5>
                <p class="text-muted small">Prepare for system development tests by practicing DSA problems. Categories cover arrays, strings, stack/queues, search/sort, and recursion.</p>
                <a href="#" class="btn btn-rku btn-sm w-100 mt-2" onclick="alert('Coding Lab loaded! (Simulated)')">Enter Coding Lab</a>
            </div>
        </div>
        <div class="col-md-6 col-lg-4">
            <div class="dashboard-card">
                <div class="text-warning mb-3"><i class="fa-regular fa-file-pdf" style="font-size: 2.5rem;"></i></div>
                <h5 class="fw-bold">Resume Building Guide</h5>
                <p class="text-muted small">Download professional ATS-friendly resume templates approved by the RK University Placement Cell, along with standard action verbs and summaries.</p>
                <button class="btn btn-rku btn-sm w-100 mt-2" onclick="alert('Downloading ATS Resume Template (Simulated)')"><i class="fa-solid fa-download me-1"></i>Download Template</button>
            </div>
        </div>
        <div class="col-md-6 col-lg-4">
            <div class="dashboard-card">
                <div class="text-primary mb-3"><i class="fa-solid fa-headset" style="font-size: 2.5rem;"></i></div>
                <h5 class="fw-bold">Mock Interview Simulator</h5>
                <p class="text-muted small">Record and evaluate responses to common HR and technical interview questions, helping you refine your posture, tone, and sentence structure.</p>
                <a href="#" class="btn btn-rku btn-sm w-100 mt-2" onclick="alert('Mock Interview started! (Simulated)')">Launch Session</a>
            </div>
        </div>
    </div>

</asp:Content>
