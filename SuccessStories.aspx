<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="SuccessStories.aspx.cs" Inherits="RKU_PLACEMENT_PORTAL.SuccessStories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Success Stories | Placement Portal | RK University</title>

        <!-- Meta Tags for SEO -->
        <meta name="description" content="Read inspiring placement success stories of RK University students. View top package achievers, student testimonials, and video interviews.">
        <meta name="keywords" content="RK University Success Stories, Top Placements, Hall of Fame RKU, Student Testimonials, TPO Rajkot">
        <meta name="author" content="RK University">

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- FontAwesome Icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/style.css" rel="stylesheet">

        <style>
            /* Hero Section Custom Overlay */
            .stories-hero {
                position: relative;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                padding: 10rem 0 8rem 0;
                color: #fff;
                z-index: 1;
            }

                .stories-hero::before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: linear-gradient(135deg, rgba(17,17,17,0.9) 0%, rgba(17,17,17,0.45) 60%, rgba(17,17,17,0.85) 100%);
                    z-index: -1;
                }

            .success-badge {
                background-color: var(--rku-red-light);
                color: var(--rku-red);
                border: 1px solid rgba(239, 55, 36, 0.25);
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 0.8rem;
                padding: 0.35rem 0.85rem;
                border-radius: 50px;
                text-transform: uppercase;
                letter-spacing: 1px;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                margin-bottom: 1.25rem;
            }

            /* Stats Strip */
            .floating-stats-strip {
                background-color: #fff;
                border-radius: 12px;
                padding: 1.8rem;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
                border: 1px solid #eef0f3;
                margin-top: -3.5rem;
                position: relative;
                z-index: 10;
            }

            .floating-stat-item {
                text-align: center;
                border-right: 1px solid #eef0f3;
            }

                .floating-stat-item:last-child {
                    border-right: none;
                }

            .floating-stat-num {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.8rem;
                color: var(--rku-dark);
                margin-bottom: 0.2rem;
                line-height: 1;
            }

            .floating-stat-label {
                font-size: 0.8rem;
                color: #6c757d;
                text-transform: uppercase;
                font-weight: 700;
                letter-spacing: 0.5px;
            }

            /* Featured Story Panel */
            .featured-story-panel {
                background-color: #fff;
                border-radius: 16px;
                border: 1px solid #eef0f3;
                box-shadow: 0 4px 24px rgba(0, 0, 0, 0.04);
                padding: 2.25rem 2.5rem;
                position: relative;
                overflow: hidden;
            }

            .featured-avatar-box {
                border-radius: 14px;
                overflow: hidden;
                border: 1px solid #eef0f3;
                background-color: #f8f9fa;
                height: 460px;
                max-width: 100%;
                margin: 0 auto;
                width: 100%;
            }

                .featured-avatar-box svg,
                .featured-avatar-box img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    object-position: top center;
                    display: block;
                }

            @media (max-width: 991.98px) {
                .featured-avatar-box {
                    height: 380px;
                }

                .featured-story-panel {
                    padding: 1.5rem;
                }
            }

            @media (max-width: 575.98px) {
                .featured-avatar-box {
                    height: 300px;
                }
            }

            .quote-icon {
                font-size: 2.4rem;
                color: #fca5a5;
                line-height: 1;
                margin-bottom: 0.5rem;
            }

            .featured-quote-text {
                font-style: italic;
                color: #475569;
                font-size: 0.95rem;
                line-height: 1.7;
                margin-bottom: 1.25rem;
            }

            .skill-badge {
                background-color: #f1f5f9;
                color: #334155;
                border: 1px solid #e2e8f0;
                padding: 0.35rem 0.75rem;
                border-radius: 6px;
                font-size: 0.78rem;
                font-weight: 600;
                font-family: var(--font-heading);
                display: inline-block;
                margin-right: 0.4rem;
                margin-bottom: 0.4rem;
            }

            /* Success Cards */
            .story-grid-card {
                background-color: #fff;
                border: 1px solid #eef0f3;
                border-radius: 12px;
                overflow: hidden;
                text-align: center;
                transition: all 0.25s ease;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.02);
                height: 100%;
                display: flex;
                flex-direction: column;
            }

                .story-grid-card:hover {
                    transform: translateY(-5px);
                    box-shadow: 0 12px 30px rgba(163, 15, 20, 0.08);
                    border-color: rgba(239, 55, 36, 0.15);
                }

            /* Full-bleed image area at top of card */
            .story-card-img {
                width: 100%;
                height: 250px;
                overflow: hidden;
                background-color: #f1f3f5;
                flex-shrink: 0;
            }

                .story-card-img img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    object-position: top center;
                    display: block;
                }

                .story-card-img svg {
                    width: 100%;
                    height: 100%;
                }

            /* Info area below image */
            .story-card-body {
                padding: 1.25rem 1rem 1.25rem;
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            /* Legacy - keep for fallback */
            .story-card-avatar {
                width: 90px;
                height: 90px;
                border-radius: 50%;
                overflow: hidden;
                margin: 0 auto 1.25rem auto;
                border: 3px solid #eef0f3;
                background-color: #f8f9fa;
            }

                .story-card-avatar svg,
                .story-card-avatar img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

            .story-card-name {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 0.98rem;
                color: #1e293b;
                margin-bottom: 0.2rem;
            }

            .story-card-course {
                font-size: 0.8rem;
                color: #64748b;
                margin-bottom: 0.6rem;
                font-weight: 500;
            }

            .story-card-recruiter {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 0.95rem;
                color: var(--rku-maroon);
                margin-bottom: 0.25rem;
            }

            .story-card-pkg {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.05rem;
                color: var(--rku-red);
                margin-bottom: 0.2rem;
            }

            .story-card-desg {
                font-size: 0.78rem;
                color: #888;
                font-weight: 500;
                margin-bottom: 0;
            }

            /* Top Recruiters 3-Row Sliding Board */
            .success-recruiters-board {
                display: flex;
                flex-direction: column;
                gap: 1rem;
                overflow: hidden;
                padding-top: 0.25rem;
            }

            .success-recruiters-row {
                display: flex;
                align-items: center;
                gap: 1rem;
                width: max-content;
                will-change: transform;
            }

                .success-recruiters-row .recruiter-logo-card {
                    width: 190px;
                    height: 74px;
                    margin: 0;
                }

            .success-recruiters-right {
                animation: recruitersRightToLeft 45s linear infinite;
            }

            .success-recruiters-left {
                animation: recruitersLeftToRight 45s linear infinite;
                margin-left: -12rem;
            }

            @keyframes recruitersRightToLeft {
                0% {
                    transform: translateX(0);
                }

                100% {
                    transform: translateX(-50%);
                }
            }

            @keyframes recruitersLeftToRight {
                0% {
                    transform: translateX(-50%);
                }

                100% {
                    transform: translateX(0);
                }
            }

            @media (max-width: 767.98px) {
                .success-recruiters-row {
                    gap: 0.75rem;
                }

                    .success-recruiters-row .recruiter-logo-card {
                        width: 150px;
                        height: 68px;
                    }

                .success-recruiters-left {
                    margin-left: -6rem;
                }
            }

            /* Video Testimonial Cards */
            .video-testimonial-card {
                background-color: #fff;
                border-radius: 14px;
                border: 1px solid #eef0f3;
                overflow: hidden;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
                transition: all 0.25s ease;
            }

                .video-testimonial-card:hover {
                    transform: translateY(-4px);
                    box-shadow: 0 10px 25px rgba(0,0,0,0.06);
                }

            .video-thumbnail-box {
                position: relative;
                height: 190px;
                background-color: #1a1a1a;
                display: flex;
                align-items: center;
                justify-content: center;
                overflow: hidden;
            }

            .video-thumbnail-link {
                position: relative;
                display: block;
                color: inherit;
            }

            .video-thumbnail-box svg,
            .video-thumbnail-box img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                opacity: 0.75;
                transition: transform 0.3s ease;
            }

            .video-testimonial-card:hover .video-thumbnail-box svg,
            .video-testimonial-card:hover .video-thumbnail-box img {
                transform: scale(1.05);
            }

            .video-play-btn {
                position: absolute;
                width: 44px;
                height: 44px;
                border-radius: 50%;
                background-color: var(--rku-red);
                color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1rem;
                box-shadow: 0 4px 15px rgba(239, 55, 36, 0.4);
                transition: all 0.25s ease;
                cursor: pointer;
                padding-left: 3px; /* visual alignment of play arrow */
            }

            .video-testimonial-card:hover .video-play-btn {
                background-color: var(--rku-maroon);
                transform: scale(1.1);
            }

            .video-duration {
                position: absolute;
                bottom: 10px;
                right: 10px;
                background-color: rgba(0,0,0,0.7);
                color: #fff;
                font-size: 0.72rem;
                padding: 0.2rem 0.5rem;
                border-radius: 4px;
                font-weight: 600;
            }

            .video-card-body {
                padding: 1.5rem;
            }

            .video-card-title {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 1.05rem;
                color: var(--rku-dark);
                margin-bottom: 0.5rem;
            }

            /* Timeline Journey */
            .journey-step-box {
                text-align: center;
                position: relative;
                z-index: 2;
            }

            .journey-step-circle {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                background-color: #fff;
                border: 3px solid #f1f3f5;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                font-size: 1.3rem;
                color: var(--rku-red);
                margin-bottom: 1rem;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
                transition: all 0.25s ease;
            }

            .journey-step-box:hover .journey-step-circle {
                border-color: var(--rku-red);
                color: #fff;
                background-color: var(--rku-red);
                transform: translateY(-2px);
            }

            .journey-step-num {
                font-size: 0.72rem;
                font-weight: 700;
                color: #aaa;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 0.25rem;
            }

            .journey-step-lbl {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 0.9rem;
                color: var(--rku-dark);
                margin-bottom: 0.4rem;
            }

            .journey-step-desc {
                font-size: 0.78rem;
                color: #777;
                line-height: 1.4;
                max-width: 140px;
                margin: 0 auto;
            }

            .journey-line-row {
                position: relative;
            }

                .journey-line-row::before {
                    content: '';
                    position: absolute;
                    top: 30px;
                    left: 5%;
                    width: 90%;
                    height: 3px;
                    background-color: #f1f3f5;
                    z-index: 1;
                }

            /* Testimonials DataList */
            .testimonial-card-slide {
                background-color: #fff;
                border-radius: 14px;
                border: 1px solid #eef0f3;
                padding: 1.8rem 1.5rem;
                height: 100%;
                min-height: 260px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                transition: transform 0.25s ease, box-shadow 0.25s ease;
                word-break: break-word;
                overflow-wrap: anywhere;
            }

            .testimonial-card-slide:hover {
                transform: translateY(-4px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.06);
            }

            .testimonials-datalist-table {
                width: 100% !important;
                table-layout: fixed !important;
                border-collapse: separate !important;
                border-spacing: 16px 0 !important;
            }

            .testimonials-datalist-table td {
                width: 50% !important;
                max-width: 50% !important;
                vertical-align: top !important;
                padding: 0 !important;
            }

            .testimonial-rating {
                color: #f59e0b;
                font-size: 0.85rem;
                margin-bottom: 0.85rem;
                display: flex;
                gap: 3px;
            }

            .testimonial-text {
                font-size: 0.88rem;
                color: #475569;
                line-height: 1.6;
                margin-bottom: 1.5rem;
                font-style: italic;
                word-break: break-word;
                overflow-wrap: anywhere;
            }

            .testimonial-user-box {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                margin-top: auto;
            }

            .testimonial-user-avatar {
                width: 44px;
                height: 44px;
                border-radius: 50%;
                overflow: hidden;
                background-color: #f1f5f9;
                border: 1px solid #e2e8f0;
                flex-shrink: 0;
            }

                .testimonial-user-avatar svg,
                .testimonial-user-avatar img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    display: block;
                }

            .testimonial-user-name {
                font-family: var(--font-heading);
                font-weight: 700;
                font-size: 0.92rem;
                color: #1e293b;
                margin-bottom: 0.15rem;
            }

            .testimonial-user-company {
                font-size: 0.78rem;
                color: #888;
                font-weight: 500;
                margin-bottom: 0;
            }

            /* Hall of Fame DataList */
            .hall-of-fame-datalist-table {
                width: 100% !important;
                table-layout: fixed !important;
                border-collapse: separate !important;
                border-spacing: 12px 0 !important;
            }

            .hall-of-fame-datalist-table td {
                width: 33.333% !important;
                max-width: 33.333% !important;
                vertical-align: bottom !important;
                padding: 0 !important;
            }

            .podium-card {
                background-color: #fff;
                border-radius: 14px;
                padding: 1.8rem 0.75rem 1.4rem;
                text-align: center;
                position: relative;
                margin-top: 15px;
                transition: transform 0.25s ease, box-shadow 0.25s ease;
                width: 100%;
                min-height: 260px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                word-break: break-word;
                overflow-wrap: anywhere;
            }

            .podium-card:hover {
                transform: translateY(-4px);
            }

            .podium-rank-badge {
                width: 28px;
                height: 28px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 0.88rem;
                color: #fff;
                position: absolute;
                top: -14px;
                left: 50%;
                transform: translateX(-50%);
                box-shadow: 0 3px 8px rgba(0,0,0,0.15);
                background-color: #ef3724;
            }

            /* Rank 1 (Gold - Center - Elevated) */
            .podium-card.rank-1 {
                background: linear-gradient(180deg, #fffdf0 0%, #ffffff 100%);
                border: 2px solid #facc15;
                box-shadow: 0 8px 24px rgba(234, 179, 8, 0.12);
                padding-top: 2.2rem;
                padding-bottom: 1.6rem;
                min-height: 285px;
            }

            .podium-card.rank-1 .podium-rank-badge {
                background-color: #f59e0b; /* Gold */
                box-shadow: 0 3px 8px rgba(245, 158, 11, 0.4);
            }

            .podium-card.rank-1 .podium-avatar {
                border: 2px solid #facc15;
            }

            /* Rank 2 (Silver - Left) */
            .podium-card.rank-2 {
                background: linear-gradient(180deg, #f8fafc 0%, #ffffff 100%);
                border: 1px solid #e2e8f0;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
            }

            .podium-card.rank-2 .podium-rank-badge {
                background-color: #94a3b8; /* Silver */
                box-shadow: 0 3px 8px rgba(148, 163, 184, 0.35);
            }

            .podium-card.rank-2 .podium-avatar {
                border: 2px solid #cbd5e1;
            }

            /* Rank 3 (Bronze - Right) */
            .podium-card.rank-3 {
                background: linear-gradient(180deg, #fffaf5 0%, #ffffff 100%);
                border: 1px solid #fed7aa;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.02);
            }

            .podium-card.rank-3 .podium-rank-badge {
                background-color: #ea580c; /* Bronze */
                box-shadow: 0 3px 8px rgba(234, 88, 12, 0.35);
            }

            .podium-card.rank-3 .podium-avatar {
                border: 2px solid #fdba74;
            }

            .podium-avatar {
                width: 62px;
                height: 62px;
                border-radius: 50%;
                overflow: hidden;
                margin: 0 auto 0.85rem auto;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
                background-color: #e2e8f0;
                flex-shrink: 0;
            }

                .podium-avatar svg,
                .podium-avatar img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    display: block;
                }

            .podium-pkg {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 1.25rem;
                color: var(--rku-maroon);
                margin-bottom: 0.25rem;
            }

            .podium-name {
                font-family: var(--font-heading);
                font-weight: 800;
                font-size: 0.95rem;
                color: #1e293b;
                margin-bottom: 0.2rem;
            }

            .podium-course {
                font-size: 0.78rem;
                color: #64748b;
                font-weight: 500;
                margin-bottom: 0;
            }

            /* Success Stories DataList */
            .stories-datalist-table {
                width: 100% !important;
                table-layout: fixed !important;
                border-collapse: separate !important;
                border-spacing: 20px 24px !important;
            }

            .stories-datalist-table td {
                width: 33.333% !important;
                max-width: 33.333% !important;
                vertical-align: top !important;
                padding: 0 !important;
            }

            @media (max-width: 991.98px) {
                .stories-datalist-table,
                .stories-datalist-table tbody,
                .stories-datalist-table tr,
                .stories-datalist-table td {
                    display: block !important;
                    width: 100% !important;
                    max-width: 100% !important;
                }
            }

            /* Placement Gallery DataList */
            .gallery-datalist-table {
                width: 100% !important;
                table-layout: fixed !important;
                border-collapse: separate !important;
                border-spacing: 16px !important;
            }

            .gallery-datalist-table td {
                width: 33.333% !important;
                max-width: 33.333% !important;
                vertical-align: top !important;
                padding: 0 !important;
            }

            @media (max-width: 767.98px) {
                .gallery-datalist-table,
                .gallery-datalist-table tbody,
                .gallery-datalist-table tr,
                .gallery-datalist-table td {
                    display: block !important;
                    width: 100% !important;
                    max-width: 100% !important;
                }
            }

            .gallery-grid-img {
                border-radius: 12px;
                overflow: hidden;
                height: 220px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
                border: 1px solid #eef0f3;
                background-color: #f1f3f5;
            }

                .gallery-grid-img svg,
                .gallery-grid-img img {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                    transition: transform 0.3s ease;
                    display: block;
                }

                .gallery-grid-img:hover svg,
                .gallery-grid-img:hover img {
                    transform: scale(1.03);
                }

            /* Banner styling */
            .success-banner-box {
                background: linear-gradient(135deg, var(--rku-maroon) 0%, #6e080b 100%);
                border-radius: 16px;
                padding: 3.5rem;
                color: #fff;
                position: relative;
                overflow: hidden;
                box-shadow: 0 15px 35px rgba(163, 15, 20, 0.2);
            }

                .success-banner-box::after {
                    content: '';
                    position: absolute;
                    top: -50%;
                    right: -20%;
                    width: 50%;
                    height: 200%;
                    background: radial-gradient(circle, rgba(255, 255, 255, 0.05) 0%, transparent 70%);
                    transform: rotate(30deg);
                }

            .banner-student-mock {
                width: 100%;
                max-width: 250px;
                border-radius: 12px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            }

            @media (max-width: 991.98px) {
                .floating-stat-item {
                    border-right: none;
                    border-bottom: 1px solid #eef0f3;
                    padding-bottom: 1rem;
                    margin-bottom: 1rem;
                }

                    .floating-stat-item:last-child {
                        border-bottom: none;
                        padding-bottom: 0;
                        margin-bottom: 0;
                    }

                .journey-line-row::before {
                    display: none;
                }

                .journey-step-box {
                    margin-bottom: 2rem;
                }

                .hall-of-fame-podium {
                    flex-direction: column;
                    align-items: center;
                    gap: 2rem;
                }

                .podium-card {
                    width: 100%;
                    max-width: 320px;
                }

                    .podium-card.rank-1 {
                        order: 1;
                    }

                    .podium-card.rank-2 {
                        order: 2;
                    }

                    .podium-card.rank-3 {
                        order: 3;
                    }
            }
        </style>
    </head>
    <body>

        <!-- ==========================================
         1. HEADER / NAVBAR
         ========================================== -->
        <nav class="navbar navbar-expand-lg sticky-top">
            <div class="container-fluid px-lg-5">
                <!-- Brand Logo -->
                <a class="navbar-brand d-flex align-items-center" href="Index.aspx" id="navbarBrandLink">
                    <img src="assets/images/RKU LOGO.png" alt="RK University Placement Portal" class="me-2" style="height: 48px; width: auto; max-width: 240px; object-fit: contain;">
                </a>

                <!-- Mobile Toggle -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation" id="navbarToggleButton">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Navigation Links -->
                <div class="collapse navbar-collapse" id="mainNavbar">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="Index.aspx" id="navHome">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="About.aspx" id="navAbout">About Us</a>
                        </li>
                        <li class="nav-item dropdown" id="navItemPlacement">
                            <a class="nav-link nav-placement-btn dropdown-toggle" href="#" id="navDrives" data-bs-toggle="dropdown" aria-expanded="false">Placement <i class="fa-solid fa-chevron-down placement-caret"></i>
                            </a>
                            <ul class="dropdown-menu nav-placement-dropdown" aria-labelledby="navDrives">
                            <li><a class="dropdown-item" href="PlacementAbout.aspx" id="navPlacementAbout">About Us</a></li>
                                <li><a class="dropdown-item" href="PlacementCampusDrives.aspx" id="navPlacementCampus">Campus Drives</a></li>
                                <li><a class="dropdown-item" href="PlacementStudentSelection.aspx" id="navPlacementSelection">Student Selection</a></li>
                                <li><a class="dropdown-item" href="PlacementLiaisonOfficers.aspx" id="navPlacementLiaison">Liaison Officers</a></li>
                                <li><a class="dropdown-item" href="PlacmentProminentRecruiters.aspx" id="navPlacementRecruiters">Prominent Recruiters</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Companies.aspx" id="navCompanies">Companies</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="SuccessStories.aspx" id="navStories">Success Stories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Contact.aspx" id="navContact">Contact</a>
                        </li>
                    </ul>

                    <!-- User Actions -->
                    <div class="navbar-actions d-flex align-items-center">
                        <a href="#" class="icon-btn" title="Search" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></a>
                        <a href="#" class="icon-btn position-relative" title="Notifications" id="btnNotifications">
                            <i class="fa-regular fa-bell"></i>
                            <span class="position-absolute top-0 start-100 translate-middle p-1 bg-rku-red border border-light rounded-circle"></span>
                        </a>
                        <a href="Login.aspx" class="btn btn-login" id="btnLogin">Login</a>
                        <a href="Register.aspx" class="btn btn-register" id="btnRegister">Register</a>
                    </div>
                </div>
            </div>
        </nav>
</asp:Content>



<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">

    <!-- ==========================================
         11. FOOTER
         ========================================== -->
    <footer class="footer pt-5" id="siteFooter">
        <div class="container px-lg-5">
            <div class="row g-4 pb-5">

                <!-- Column 1: About Info -->
                <div class="col-lg-3 col-md-6">
                    <div class="footer-logo d-flex align-items-center mb-3">
                        <img src="assets/images/RKU LOGO.png" alt="RK University" class="me-2" style="height: 36px; width: auto; max-width: 220px; object-fit: contain;">
                    </div>
                    <p class="mb-4">Empowering students by bridging the gap between academia and corporate world. Providing quality training and dream placements.</p>
                    <div class="footer-social-links" id="footerSocials">
                        <a href="#" title="Facebook" id="socialFb"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" title="Twitter" id="socialTw"><i class="fa-brands fa-x-twitter"></i></a>
                        <a href="#" title="LinkedIn" id="socialLi"><i class="fa-brands fa-linkedin-in"></i></a>
                        <a href="#" title="Instagram" id="socialIg"><i class="fa-brands fa-instagram"></i></a>
                    </div>
                </div>

                <!-- Column 2: Quick Links -->
                <div class="col-lg-3 col-md-6">
                    <h5>Quick Links</h5>
                    <ul class="footer-links" id="footerQuickLinks">
                        <li><a href="About.aspx">About Us</a></li>
                        <li><a href="#">Placement Drives</a></li>
                        <li><a href="#">Companies</a></li>

                        <li><a href="Contact.aspx">Contact Us</a></li>
                    </ul>
                </div>

                <!-- Column 3: Students Links -->
                <div class="col-lg-3 col-md-6">
                    <h5>Students</h5>
                    <ul class="footer-links" id="footerStudentLinks">
                        <li><a href="Register.aspx">Student Registration</a></li>
                        <li><a href="#">Student Login</a></li>
                        <li><a href="#">Available Jobs</a></li>
                        <li><a href="#">Applied Jobs</a></li>
                        <li><a href="#">Interview Schedule</a></li>
                        <li><a href="#">Resume Builder</a></li>
                    </ul>
                </div>

                <!-- Column 4: Contact Placement Cell -->
                <div class="col-lg-3 col-md-6">
                    <h5>Placement Cell</h5>
                    <div class="footer-contact-info" id="footerContactInfo">
                        <p>
                            <i class="fa-solid fa-location-dot"></i>
                            <span>RK University, Rajkot - 360020,<br>
                                Gujarat, India</span>
                        </p>
                        <p>
                            <i class="fa-solid fa-phone"></i>
                            <span>+91 97124 89122</span>
                        </p>
                        <p>
                            <i class="fa-solid fa-envelope"></i>
                            <a href="mailto:placement@rku.ac.in" class="text-white-50" id="linkFooterEmail">placement@rku.ac.in</a>
                        </p>
                    </div>
                </div>

            </div>
        </div>

        <!-- Bottom Copyright -->
        <div class="footer-bottom">
            <div class="container px-lg-5">
                <div class="row align-items-center">
                    <div class="col-md-6 text-center text-md-start mb-2 mb-md-0">
                        <p class="mb-0" id="copyrightText">&copy; 2026 RK University Placement Portal. All Rights Reserved.</p>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div class="footer-links d-inline-flex gap-3 mb-0" id="footerBottomLinks">
                            <a href="#" class="text-white-50" style="font-size: 0.8rem;">Privacy Policy</a>
                            <span class="text-white-50">|</span>
                            <a href="#" class="text-white-50" style="font-size: 0.8rem;">Terms of Service</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap 5 Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JS -->
    <script src="js/portal-db.js"></script>
    <script src="js/main.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            renderDynamicSuccessStories();
        });

        function renderDynamicSuccessStories() {
            const stories = PortalDB.getStories();
            const gallery = PortalDB.getGallery();

            // 1. Render Featured Story
            const featuredStory = stories.find(s => s.isFeatured);
            const featuredPanel = document.getElementById('featuredStoryPanel');
            if (featuredPanel) {
                if (featuredStory) {
                    const skillsBadges = featuredStory.skills
                        ? featuredStory.skills.split(',').map(sk => `<span class="skill-badge">${sk.trim()}</span>`).join('')
                        : '';

                    featuredPanel.innerHTML = `
                        <div class="row g-4 align-items-center">
                            <!-- Left: Profile picture -->
                            <div class="col-lg-5">
                                <div class="featured-avatar-box">
                                    ${featuredStory.studentPhoto
                            ? `<img src="${featuredStory.studentPhoto}" alt="${featuredStory.studentName}">`
                            : `<svg viewBox="0 0 100 120" width="100%" height="100%" fill="#bbb">
                                            <rect width="100" height="120" fill="#f1f3f5" />
                                            <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                            <path d="M15,105 C15,85 30,75 50,75 C70,75 85,85 85,105 Z" fill="#d0d4dc" />
                                           </svg>`
                        }
                                </div>
                            </div>

                            <!-- Right: Quotes and Details -->
                            <div class="col-lg-7">
                                <span class="text-rku-maroon fw-bold" style="font-size: 0.8rem; letter-spacing: 1px; text-transform: uppercase;">FEATURED STORY</span>
                                <h2 class="fw-bold mt-1 mb-2" style="font-family: var(--font-heading); font-size: 2.2rem; color: var(--rku-dark);">${featuredStory.studentName}</h2>
                                <p class="text-muted fw-semibold mb-3" style="font-size: 0.88rem;">${featuredStory.degreeBranch}</p>
                                
                                <div class="d-flex align-items-center gap-3 mb-4">
                                    <div>
                                        <span class="d-block text-muted small fw-bold">Placed at</span>
                                        <div class="fw-extrabold text-dark" style="font-size: 1.15rem; font-family: var(--font-heading);">${featuredStory.recruiterName}</div>
                                    </div>
                                    <div class="ms-4 p-2 bg-light-subtle border border-light-subtle rounded px-3">
                                        <span class="d-block text-muted small fw-bold">Package</span>
                                        <span class="fw-extrabold text-rku-maroon" style="font-size: 1.25rem;">${featuredStory.packageLpa}</span>
                                    </div>
                                </div>

                                <div class="quote-icon"><i class="fa-solid fa-quote-left"></i></div>
                                <p class="featured-quote-text">
                                    "${featuredStory.quote}"
                                </p>

                                <div class="mb-4">
                                    ${skillsBadges}
                                </div>

                                <div class="d-flex gap-2">
                                    <button class="btn btn-rku" style="padding: 0.5rem 1.4rem;" onclick="alert('Viewing full profile of ${featuredStory.studentName} (Simulated)')">View Profile</button>
                                    <button class="btn btn-rku-outline" style="padding: 0.5rem 1.2rem;" onclick="alert('Opening LinkedIn profile (Simulated)')"><i class="fa-brands fa-linkedin me-2"></i>LinkedIn</button>
                                </div>
                            </div>
                        </div>
                    `;
                    document.getElementById('featuredStorySection').style.display = 'block';
                } else {
                    // Hide if none
                    document.getElementById('featuredStorySection').style.display = 'none';
                }
            }

            // 3. Render Hall of Fame (Podium)
            const podiumContainer = document.getElementById('hallOfFamePodium');
            if (podiumContainer) {
                podiumContainer.innerHTML = '';
                const hofStories = stories.filter(s => s.isHallOfFame).sort((a, b) => parseInt(a.rank) - parseInt(b.rank));

                if (hofStories.length === 0) {
                    // Hide podium card parent section if none
                    podiumContainer.innerHTML = `<p class="text-center text-muted small py-4">No achievers in the Hall of Fame podium.</p>`;
                } else {
                    const rank1 = hofStories.find(s => s.rank === '1');
                    const rank2 = hofStories.find(s => s.rank === '2');
                    const rank3 = hofStories.find(s => s.rank === '3');

                    if (rank2) {
                        podiumContainer.innerHTML += `
                            <div class="podium-card rank-2">
                                <div class="podium-rank-badge">2</div>
                                <div class="podium-avatar">
                                    ${rank2.studentPhoto ? `<img src="${rank2.studentPhoto}" alt="${rank2.studentName}">` : `<svg viewBox="0 0 100 100" fill="#bbb"><circle cx="50" cy="38" r="18" fill="#d0d4dc"/><path d="M20,85 C20,68 32,60 50,60 C68,60 80,68 80,85 Z" fill="#d0d4dc"/></svg>`}
                                </div>
                                <div class="podium-pkg">${rank2.packageLpa}</div>
                                <p class="podium-desg">${rank2.studentName}</p>
                                <p class="podium-course">${rank2.degreeBranch.split('|')[0].trim()} (${rank2.recruiterName})</p>
                            </div>
                        `;
                    }
                    if (rank1) {
                        podiumContainer.innerHTML += `
                            <div class="podium-card rank-1">
                                <div class="podium-rank-badge">1</div>
                                <div class="podium-avatar">
                                    ${rank1.studentPhoto ? `<img src="${rank1.studentPhoto}" alt="${rank1.studentName}">` : `<svg viewBox="0 0 100 100" fill="#bbb"><circle cx="50" cy="38" r="18" fill="#d0d4dc"/><path d="M20,85 C20,68 32,60 50,60 C68,60 80,68 80,85 Z" fill="#d0d4dc"/></svg>`}
                                </div>
                                <div class="podium-pkg" style="font-size: 1.5rem;">${rank1.packageLpa}</div>
                                <p class="podium-desg">${rank1.studentName}</p>
                                <p class="podium-course">${rank1.degreeBranch.split('|')[0].trim()} (${rank1.recruiterName})</p>
                            </div>
                        `;
                    }
                    if (rank3) {
                        podiumContainer.innerHTML += `
                            <div class="podium-card rank-3">
                                <div class="podium-rank-badge">3</div>
                                <div class="podium-avatar">
                                    ${rank3.studentPhoto ? `<img src="${rank3.studentPhoto}" alt="${rank3.studentName}">` : `<svg viewBox="0 0 100 100" fill="#bbb"><circle cx="50" cy="38" r="18" fill="#d0d4dc"/><path d="M20,85 C20,68 32,60 50,60 C68,60 80,68 80,85 Z" fill="#d0d4dc"/></svg>`}
                                </div>
                                <div class="podium-pkg">${rank3.packageLpa}</div>
                                <p class="podium-desg">${rank3.studentName}</p>
                                <p class="podium-course">${rank3.degreeBranch.split('|')[0].trim()} (${rank3.recruiterName})</p>
                            </div>
                        `;
                    }
                }
            }

            // 5. Render Top Recruiters as 3 alternating marquee rows
            const companies = PortalDB.getCompanies();
            const row1 = document.getElementById('successStoriesRecruitersRow1');
            const row2 = document.getElementById('successStoriesRecruitersRow2');
            const row3 = document.getElementById('successStoriesRecruitersRow3');
            if (row1 && row2 && row3 && companies.length > 0) {
                const displayCompanies = companies.slice(0, 9);
                const createLogoCard = (c) => `
                    <div class="recruiter-logo-card d-flex align-items-center justify-content-center">
                        ${c.logoBase64
                        ? `<img src="${c.logoBase64}" alt="${c.name}" style="max-width:100%; max-height:100%; object-fit:contain;">`
                        : `<span style="font-family: var(--font-heading); font-weight:bold; font-size:1rem; color: var(--rku-dark); text-align:center;">${c.name}</span>`
                    }
                    </div>
                `;
                const laneMarkup = displayCompanies.map(createLogoCard).join('') + displayCompanies.map(createLogoCard).join('');
                row1.innerHTML = laneMarkup;
                row2.innerHTML = laneMarkup;
                row3.innerHTML = laneMarkup;
            }
        }
    </script>
    <!-- Code injected by live-server -->
    <script>
        // <![CDATA[  <-- For SVG support
        if ('WebSocket' in window) {
            (function () {
                function refreshCSS() {
                    var sheets = [].slice.call(document.getElementsByTagName("link"));
                    var head = document.getElementsByTagName("head")[0];
                    for (var i = 0; i < sheets.length; ++i) {
                        var elem = sheets[i];
                        var parent = elem.parentElement || head;
                        parent.removeChild(elem);
                        var rel = elem.rel;
                        if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
                            var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
                            elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
                        }
                        parent.appendChild(elem);
                    }
                }
                var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
                var address = protocol + window.location.host + window.location.pathname + '/ws';
                var socket = new WebSocket(address);
                socket.onmessage = function (msg) {
                    if (msg.data == 'reload') window.location.reload();
                    else if (msg.data == 'refreshcss') refreshCSS();
                };
                if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
                    console.log('Live reload enabled.');
                    sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
                }
            })();
        }
        else {
            console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
        }
        // ]]>
    </script>
    </body>
</html>
</asp:Content>




<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">


    <!-- ==========================================
         2. STORIES HERO SECTION
         ========================================== -->
    <section class="stories-hero" style="background-image: url('assets/images/Galary-img-1 RKU.jpeg');" id="storiesHeroSection">
        <div class="container px-lg-5">
            <div class="row">
                <div class="col-lg-8">

                    <!-- Badge -->
                    <div class="success-badge">
                        <i class="fa-solid fa-trophy"></i>SUCCESS STORIES
                    </div>

                    <h1 class="hero-title" id="storiesHeroTitle" style="font-size: 3.5rem; line-height: 1.15;">Inspiring Journeys.<br>
                        <span class="text-rku-red">Real Success.</span></h1>
                    <p class="hero-subtitle" id="storiesHeroSubtitle" style="font-size: 1.15rem; margin-top: 1rem; color: rgba(255,255,255,0.8); max-width: 550px;">
                        Discover how RK University students transformed their dreams into successful careers.
                    </p>
                    <div class="d-flex flex-wrap gap-3">
                        <button class="btn btn-rku" id="btnHeroRecords">View Placement Records <i class="fa-solid fa-arrow-right ms-2"></i></button>
                        <button class="hero-btn-outline" id="btnHeroDrives">Explore Placement Drives</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         3. FLOATING STATS STRIP
         ========================================== -->
    <section class="container px-lg-5" id="floatingStatsSection">
        <div class="floating-stats-strip shadow-sm">
            <div class="row g-3">
                <!-- Stat 1 -->
                <div class="col-lg-3 col-6">
                    <div class="floating-stat-item">
                        <div class="floating-stat-num">5000+</div>
                        <div class="floating-stat-label">Students Placed</div>
                    </div>
                </div>
                <!-- Stat 2 -->
                <div class="col-lg-3 col-6">
                    <div class="floating-stat-item">
                        <div class="floating-stat-num">300+</div>
                        <div class="floating-stat-label">Recruiting Companies</div>
                    </div>
                </div>
                <!-- Stat 3 -->
                <div class="col-lg-3 col-6">
                    <div class="floating-stat-item">
                        <div class="floating-stat-num">20 LPA</div>
                        <div class="floating-stat-label">Highest Package</div>
                    </div>
                </div>
                <!-- Stat 4 -->
                <div class="col-lg-3 col-6">
                    <div class="floating-stat-item">
                        <div class="floating-stat-num">85%</div>
                        <div class="floating-stat-label">Placement Rate</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         4. FEATURED STORY PANEL
         ========================================== -->
    <section class="py-5 bg-white" id="featuredStorySection">
        <div class="container px-lg-5">
            <div class="featured-story-panel" id="featuredStoryPanel">
                <div class="row g-4 align-items-center">

                    <!-- Left: Profile picture -->
                    <div class="col-lg-5">
                        <div class="featured-avatar-box">
                            <asp:Image ID="imgFeatured" runat="server" ImageUrl="~/assets/PlacmentStudentImage/WhatsApp Image 2026-05-27 at 12.58.45 PM.jpeg" AlternateText="Featured Student" onerror="this.style.display='none';this.nextElementSibling.style.display='flex';" />
                            <div style="display:none;width:100%;height:100%;align-items:center;justify-content:center;background:#f1f3f5;">
                                <svg viewBox="0 0 100 120" width="100%" height="100%" fill="#bbb">
                                    <rect width="100" height="120" fill="#f1f3f5" />
                                    <circle cx="50" cy="45" r="22" fill="#d0d4dc" />
                                    <path d="M15,105 C15,85 30,75 50,75 C70,75 85,85 85,105 Z" fill="#d0d4dc" />
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Right: Quotes and Details -->
                    <div class="col-lg-7 ps-lg-4">
                        <span style="color: #ef3724; font-weight: 800; font-size: 0.78rem; letter-spacing: 0.8px; text-transform: uppercase; font-family: var(--font-heading);">FEATURED STORY</span>
                        <h2 class="fw-bold mt-1 mb-1" style="font-family: var(--font-heading); font-size: 2.2rem; color: #1e293b;">
                            <asp:Label ID="lblFeaturedName" runat="server" Text="Mitesh Gauswami"></asp:Label>
                        </h2>
                        <p class="text-muted fw-semibold mb-3" style="font-size: 0.88rem;">
                            <asp:Label ID="lblFeaturedDegree" runat="server" Text="MCA"></asp:Label>
                        </p>

                        <div class="d-flex align-items-center gap-4 mb-3">
                            <div>
                                <span class="d-block text-muted small fw-bold" style="font-size: 0.75rem;">Placed at</span>
                                <span class="fw-bold" style="color: #1e293b; font-size: 1.05rem; font-family: var(--font-heading);">
                                    <asp:Label ID="lblFeaturedCompany" runat="server" Text="TCS"></asp:Label>
                                </span>
                            </div>
                            <div class="border rounded px-3 py-1 bg-white" style="border-color: #e2e8f0 !important;">
                                <span class="d-block text-muted small fw-bold" style="font-size: 0.7rem;">Package</span>
                                <span class="fw-bold" style="color: #ef3724; font-size: 1.05rem; font-family: var(--font-heading);">
                                    <asp:Label ID="lblFeaturedPackage" runat="server" Text="12 LPA"></asp:Label>
                                </span>
                            </div>
                        </div>

                        <div class="quote-icon"><i class="fa-solid fa-quote-left"></i></div>
                        <p class="featured-quote-text">
                            "<asp:Label ID="lblFeaturedQuote" runat="server" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."></asp:Label>"
                        </p>

                        <div class="mb-4">
                            <asp:Literal ID="litFeaturedSkills" runat="server" Text="<span class='skill-badge'>c#</span><span class='skill-badge'>css</span><span class='skill-badge'>html</span><span class='skill-badge'>react</span>"></asp:Literal>
                        </div>

                        <div class="d-flex gap-3">
                            <a href="#" class="btn btn-rku" style="background: #ef3724; border-color: #ef3724; color: #fff; font-weight: 600; padding: 0.5rem 1.4rem; border-radius: 6px; font-size: 0.9rem; text-decoration: none;">View Profile</a>
                            <a href="#" class="btn btn-outline-rku" style="background: #fff; border: 1.5px solid #ef3724; color: #ef3724; font-weight: 600; padding: 0.5rem 1.2rem; border-radius: 6px; font-size: 0.9rem; text-decoration: none; display: inline-flex; align-items: center;"><i class="fa-brands fa-linkedin me-2"></i>LinkedIn</a>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         5. SUCCESS STORIES GRID
         ========================================== -->
    <section class="py-5" style="background-color: var(--rku-bg-light);" id="successStoriesGridSection">
        <div class="container px-lg-5">

            <div class="section-title-wrapper mb-4">
                <h2 class="section-title">Success Stories</h2>
                <a href="#" class="section-link">View All Stories <i class="fa-solid fa-arrow-right ms-1"></i></a>
            </div>

            <!-- Success Stories DataList (3 columns per row) -->
            <asp:DataList ID="DataListStories" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%" CssClass="stories-datalist-table">
                <ItemStyle Width="33.33%" VerticalAlign="Top" />
                <ItemTemplate>
                    <div class="story-grid-card shadow-sm">
                        <div class="story-card-img">
                            <%# (!string.IsNullOrEmpty(Eval("StudentPhoto") as string) && Eval("StudentPhoto").ToString().Trim() != "" && Eval("StudentPhoto").ToString() != "~/assets/PlacmentStudentImage/") ? "<img src='" + ResolveUrl(Eval("StudentPhoto").ToString()) + "' alt='" + Eval("StudentName") + "' onerror=\"this.style.display='none';this.nextElementSibling.style.display='flex';\" />" : "" %>
                            <div style='<%# (!string.IsNullOrEmpty(Eval("StudentPhoto") as string) && Eval("StudentPhoto").ToString().Trim() != "" && Eval("StudentPhoto").ToString() != "~/assets/PlacmentStudentImage/") ? "display:none;" : "display:flex;" %>width:100%;height:100%;align-items:center;justify-content:center;background:#e2e8f0;'>
                                <svg viewBox="0 0 100 120" fill="#94a3b8" style="width: 50%; height: 50%;">
                                    <rect width="100" height="120" fill="#e2e8f0"/>
                                    <circle cx="50" cy="45" r="22" fill="#cbd5e1"/>
                                    <path d="M15,105 C15,85 30,75 50,75 C70,75 85,85 85,105 Z" fill="#cbd5e1"/>
                                </svg>
                            </div>
                        </div>
                        <div class="story-card-body">
                            <h5 class="story-card-name"><%# Eval("StudentName") %></h5>
                            <p class="story-card-course"><%# Eval("DegreeBranch") %></p>
                            <div class="story-card-recruiter"><%# Eval("Recruiter") %></div>
                            <div class="story-card-pkg"><%# (!Eval("Package").ToString().Contains("&#8377;") && !Eval("Package").ToString().StartsWith("₹") ? "&#8377; " : "") + Eval("Package").ToString().Replace("₹", "&#8377; ") %></div>
                            <p class="story-card-desg"><%# Eval("JobDesignation") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </section>

    <!-- ==========================================
         6. VIDEO TESTIMONIALS & RECRUITERS
         ========================================== -->
    <section class="py-5 bg-white" id="videoRecruitersSection">
        <div class="container px-lg-5">
            <div class="row g-5">

                <!-- Left: Video Testimonials -->
                <div class="col-lg-6">
                    <div class="section-title-wrapper mb-4">
                        <h2 class="section-title" style="font-size: 1.5rem;">Video Testimonials</h2>
                        <a href="#" class="section-link" style="font-size: 0.85rem;">View All Videos <i class="fa-solid fa-arrow-right ms-1"></i></a>
                    </div>

                    <div class="row g-3">
                        <!-- Video Card 1 -->
                        <div class="col-12">
                            <div class="video-testimonial-card d-flex gap-4 align-items-center p-3">
                                <a class="video-thumbnail-link rounded flex-shrink-0" href="https://youtu.be/RuA445QknKw?si=n0PVQliZiNpmgnfV" target="_blank" rel="noopener noreferrer">
                                    <div class="video-thumbnail-box rounded" style="width: 180px; height: 120px;">
                                        <img src="https://i.ytimg.com/vi/RuA445QknKw/hqdefault.jpg" alt="My Placement Journey thumbnail">
                                        <div class="video-play-btn" style="width: 48px; height: 48px; font-size: 1rem;"><i class="fa-solid fa-play"></i></div>
                                        <span class="video-duration">03:45</span>
                                    </div>
                                </a>
                                <div class="video-card-body p-0 flex-grow-1">
                                    <h4 class="video-card-title mb-1">My Placement Journey</h4>
                                    <p class="mb-0 text-muted small">Success talk by placed students sharing their prep strategy.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Video Card 2 -->
                        <div class="col-12">
                            <div class="video-testimonial-card d-flex gap-4 align-items-center p-3">
                                <a class="video-thumbnail-link rounded flex-shrink-0" href="https://youtu.be/EJisAItv8bo?si=APJ7D-FCsSu7ElFt" target="_blank" rel="noopener noreferrer">
                                    <div class="video-thumbnail-box rounded" style="width: 180px; height: 120px;">
                                        <img src="https://i.ytimg.com/vi/EJisAItv8bo/hqdefault.jpg" alt="Placement Experience thumbnail">
                                        <div class="video-play-btn" style="width: 48px; height: 48px; font-size: 1rem;"><i class="fa-solid fa-play"></i></div>
                                        <span class="video-duration">04:12</span>
                                    </div>
                                </a>
                                <div class="video-card-body p-0 flex-grow-1">
                                    <h4 class="video-card-title mb-1">Placement Experience</h4>
                                    <p class="mb-0 text-muted small">Learn about assessment rounds and campus environment.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Video Card 3 -->
                        <div class="col-12">
                            <div class="video-testimonial-card d-flex gap-4 align-items-center p-3">
                                <a class="video-thumbnail-link rounded flex-shrink-0" href="https://youtu.be/DD1O-yX9dik?si=wDwZET26imwtXqMc" target="_blank" rel="noopener noreferrer">
                                    <div class="video-thumbnail-box rounded" style="width: 180px; height: 120px;">
                                        <img src="https://i.ytimg.com/vi/DD1O-yX9dik/hqdefault.jpg" alt="Corporate Interview Tips thumbnail">
                                        <div class="video-play-btn" style="width: 48px; height: 48px; font-size: 1rem;"><i class="fa-solid fa-play"></i></div>
                                        <span class="video-duration">05:00</span>
                                    </div>
                                </a>
                                <div class="video-card-body p-0 flex-grow-1">
                                    <h4 class="video-card-title mb-1">Corporate Interview Tips</h4>
                                    <p class="mb-0 text-muted small">Useful advice from HR recruiters visiting RK University.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right: Top Recruiters -->
                <div class="col-lg-6">
                    <div class="section-title-wrapper mb-4">
                        <h2 class="section-title" style="font-size: 1.5rem;">Our Top Recruiters</h2>
                        <a href="#" class="section-link" style="font-size: 0.85rem;">View All Companies <i class="fa-solid fa-arrow-right ms-1"></i></a>
                    </div>

                    <div class="success-recruiters-board" id="successStoriesRecruitersBoard">
                        <div class="success-recruiters-row success-recruiters-right" id="successStoriesRecruitersRow1"></div>
                        <div class="success-recruiters-row success-recruiters-left" id="successStoriesRecruitersRow2"></div>
                        <div class="success-recruiters-row success-recruiters-right" id="successStoriesRecruitersRow3"></div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- ==========================================
         7. PLACEMENT JOURNEY TIMELINE
         ========================================== -->
    <section class="py-5" style="background-color: var(--rku-bg-light);" id="placementJourneyTimelineSection">
        <div class="container px-lg-5">
            <h2 class="section-title text-center mb-5" style="display: table; margin: 0 auto;">Placement Journey</h2>

            <div class="journey-line-row mt-4">
                <div class="row g-0 justify-content-between">
                    <!-- Step 1 -->
                    <div class="col-lg-1 col-md-3 col-6 mb-4 mb-lg-0">
                        <div class="journey-step-box">
                            <div class="journey-step-circle"><i class="fa-regular fa-clipboard"></i></div>
                            <div class="journey-step-num">01</div>
                            <div class="journey-step-lbl">Registration</div>
                            <p class="journey-step-desc">Sign up on the placement portal</p>
                        </div>
                    </div>
                    <!-- Step 2 -->
                    <div class="col-lg-1 col-md-3 col-6 mb-4 mb-lg-0">
                        <div class="journey-step-box">
                            <div class="journey-step-circle"><i class="fa-solid fa-laptop-code"></i></div>
                            <div class="journey-step-num">02</div>
                            <div class="journey-step-lbl">Training</div>
                            <p class="journey-step-desc">Aptitude, technical &amp; soft skills</p>
                        </div>
                    </div>
                    <!-- Step 3 -->
                    <div class="col-lg-1 col-md-3 col-6 mb-4 mb-lg-0">
                        <div class="journey-step-box">
                            <div class="journey-step-circle"><i class="fa-solid fa-user-tie"></i></div>
                            <div class="journey-step-num">03</div>
                            <div class="journey-step-lbl">Mock Interview</div>
                            <p class="journey-step-desc">Practice with expert mentors</p>
                        </div>
                    </div>
                    <!-- Step 4 -->
                    <div class="col-lg-1 col-md-3 col-6 mb-4 mb-lg-0">
                        <div class="journey-step-box">
                            <div class="journey-step-circle"><i class="fa-regular fa-building"></i></div>
                            <div class="journey-step-num">04</div>
                            <div class="journey-step-lbl">Placement Drive</div>
                            <p class="journey-step-desc">Apply and appear for drives</p>
                        </div>
                    </div>
                    <!-- Step 5 -->
                    <div class="col-lg-1 col-md-3 col-6">
                        <div class="journey-step-box">
                            <div class="journey-step-circle"><i class="fa-regular fa-comments"></i></div>
                            <div class="journey-step-num">05</div>
                            <div class="journey-step-lbl">HR Interview</div>
                            <p class="journey-step-desc">Face real interview rounds</p>
                        </div>
                    </div>
                    <!-- Step 6 -->
                    <div class="col-lg-1 col-md-3 col-6">
                        <div class="journey-step-box">
                            <div class="journey-step-circle"><i class="fa-regular fa-envelope-open"></i></div>
                            <div class="journey-step-num">06</div>
                            <div class="journey-step-lbl">Offer Letter</div>
                            <p class="journey-step-desc">Get selected and receive offer</p>
                        </div>
                    </div>
                    <!-- Step 7 -->
                    <div class="col-lg-1 col-md-3 col-6">
                        <div class="journey-step-box">
                            <div class="journey-step-circle"><i class="fa-solid fa-circle-check"></i></div>
                            <div class="journey-step-num">07</div>
                            <div class="journey-step-lbl">Joining</div>
                            <p class="journey-step-desc">Begin your professional journey</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         8. STUDENT TESTIMONIALS & HALL OF FAME
         ========================================== -->
    <section class="py-5 bg-white" id="testimonialsHallSection">
        <div class="container px-lg-5">
            <div class="row g-5">

                <!-- Left: Student Testimonials -->
                <div class="col-lg-6">
                    <div class="section-title-wrapper mb-4">
                        <h2 class="section-title" style="font-size: 1.5rem;">Student Testimonials</h2>
                        <a href="#" class="section-link" style="font-size: 0.85rem;">View All Testimonials <i class="fa-solid fa-arrow-right ms-1"></i></a>
                    </div>

                    <asp:DataList ID="DataListTestimonials" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%" CssClass="testimonials-datalist-table">
                        <ItemStyle Width="50%" VerticalAlign="Top" />
                        <ItemTemplate>
                            <div class="testimonial-card-slide">
                                <div>
                                    <div class="testimonial-rating">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                    <p class="testimonial-text">
                                        "<%# Eval("Testimonial") %>"
                                    </p>
                                </div>
                                <div class="testimonial-user-box">
                                    <div class="testimonial-user-avatar">
                                        <%# (!string.IsNullOrEmpty(Eval("StudentPhoto") as string) && Eval("StudentPhoto").ToString().Trim() != "" && Eval("StudentPhoto").ToString() != "~/assets/PlacmentStudentImage/") ? "<img src='" + ResolveUrl(Eval("StudentPhoto").ToString()) + "' alt='" + Eval("StudentName") + "' onerror=\"this.style.display='none';this.nextElementSibling.style.display='flex';\" />" : "" %>
                                        <div style='<%# (!string.IsNullOrEmpty(Eval("StudentPhoto") as string) && Eval("StudentPhoto").ToString().Trim() != "" && Eval("StudentPhoto").ToString() != "~/assets/PlacmentStudentImage/") ? "display:none;" : "display:flex;" %>width:100%;height:100%;align-items:center;justify-content:center;background:#e2e8f0;'>
                                            <svg viewBox="0 0 100 100" fill="#94a3b8" style="width: 70%; height: 70%;">
                                                <circle cx="50" cy="38" r="18" fill="#cbd5e1" />
                                                <path d="M20,85 C20,68 32,60 50,60 C68,60 80,68 80,85 Z" fill="#cbd5e1" />
                                            </svg>
                                        </div>
                                    </div>
                                    <div>
                                        <h5 class="testimonial-user-name"><%# Eval("StudentName") %></h5>
                                        <p class="testimonial-user-company"><%# Eval("Recruiter") %> Placed</p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>

                <!-- Right: Hall of Fame Podium -->
                <div class="col-lg-6">
                    <div class="section-title-wrapper mb-4">
                        <h2 class="section-title" style="font-size: 1.5rem;">Hall of Fame</h2>
                        <a href="#" class="section-link" style="font-size: 0.85rem;">View All Achievers <i class="fa-solid fa-arrow-right ms-1"></i></a>
                    </div>

                    <asp:DataList ID="DataListHallOfFame" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%" CssClass="hall-of-fame-datalist-table">
                        <ItemStyle Width="33.33%" VerticalAlign="Top" />
                        <ItemTemplate>
                            <div class='<%# "podium-card rank-" + (string.IsNullOrEmpty(Eval("PodiumRank") as string) || Eval("PodiumRank").ToString() == "0" ? "2" : Eval("PodiumRank").ToString()) %>'>
                                <div class="podium-rank-badge"><%# (string.IsNullOrEmpty(Eval("PodiumRank") as string) || Eval("PodiumRank").ToString() == "0" ? "<i class='fa-solid fa-award'></i>" : Eval("PodiumRank").ToString()) %></div>
                                <div class="podium-avatar">
                                    <%# (!string.IsNullOrEmpty(Eval("StudentPhoto") as string) && Eval("StudentPhoto").ToString().Trim() != "" && Eval("StudentPhoto").ToString() != "~/assets/PlacmentStudentImage/") ? "<img src='" + ResolveUrl(Eval("StudentPhoto").ToString()) + "' alt='" + Eval("StudentName") + "' onerror=\"this.style.display='none';this.nextElementSibling.style.display='flex';\" />" : "" %>
                                    <div style='<%# (!string.IsNullOrEmpty(Eval("StudentPhoto") as string) && Eval("StudentPhoto").ToString().Trim() != "" && Eval("StudentPhoto").ToString() != "~/assets/PlacmentStudentImage/") ? "display:none;" : "display:flex;" %>width:100%;height:100%;align-items:center;justify-content:center;background:#e2e8f0;'>
                                        <svg viewBox="0 0 100 100" fill="#94a3b8" style="width: 70%; height: 70%;">
                                            <circle cx="50" cy="38" r="18" fill="#cbd5e1" />
                                            <path d="M20,85 C20,68 32,60 50,60 C68,60 80,68 80,85 Z" fill="#cbd5e1" />
                                        </svg>
                                    </div>
                                </div>
                                <div class="podium-pkg"><%# (!Eval("Package").ToString().Contains("&#8377;") && !Eval("Package").ToString().StartsWith("₹") ? "&#8377; " : "") + Eval("Package").ToString().Replace("₹", "&#8377; ") %></div>
                                <h5 class="podium-name mb-1"><%# Eval("StudentName") %></h5>
                                <p class="podium-course"><%# Eval("DegreeBranch") %> (<%# Eval("Recruiter") %>)</p>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>

            </div>
        </div>
    </section>

    <!-- ==========================================
         9. PLACEMENT GALLERY
         ========================================== -->
    <section class="py-5" style="background-color: var(--rku-bg-light);" id="placementGallerySection">
        <div class="container px-lg-5">
            <h2 class="section-title text-center mb-5" style="display: table; margin: 0 auto;">Placement Gallery</h2>

            <!-- Placement Gallery DataList (3 columns in a row) -->
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%" CssClass="gallery-datalist-table">
                <ItemStyle Width="33.33%" VerticalAlign="Top" />
                <ItemTemplate>
                    <div class="gallery-grid-img">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("GalleryImage") %>'
                            AlternateText='<%# Eval("GalleryTitle") %>'
                            onerror="this.style.display='none';this.nextElementSibling.style.display='inline-flex';" />
                        <span style="display:none;width:100%;height:100%;align-items:center;justify-content:center;background:#cbd5e1;">
                            <svg viewBox="0 0 300 200" fill="#bbb" style="width: 100%; height: 100%;">
                                <rect width="300" height="200" fill="#cbd5e1" />
                                <text x="150" y="105" text-anchor="middle" font-size="13" font-weight="bold" fill="#475569"><%# Eval("GalleryTitle") %></text>
                            </svg>
                        </span>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </section>

    <!-- ==========================================
         10. CALL TO ACTION BANNER
         ========================================== -->
    <section class="py-5 bg-white" id="ctaBannerSection">
        <div class="container px-lg-5">
            <div class="success-banner-box">
                <div class="row g-4 align-items-center">
                    <div class="col-lg-8">
                        <h2 class="fw-bold mb-2" style="font-family: var(--font-heading); font-size: 2.2rem;">Your Success Story Starts Here!</h2>
                        <p class="mb-0 text-white-50" style="font-size: 1rem;">
                            Join RK University Placement Portal and unlock exciting career opportunities.
                        </p>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <div class="d-flex flex-wrap gap-3 justify-content-lg-end">
                            <a href="Register.aspx" class="btn btn-light fw-bold text-rku-maroon" style="padding: 0.65rem 1.6rem; border-radius: 8px; text-decoration: none; display: inline-flex; align-items: center;">Register Now <i class="fa-solid fa-arrow-right ms-2"></i></a>
                            <a href="PlacementCampusDrives.aspx" class="btn btn-outline-light fw-bold" style="padding: 0.65rem 1.4rem; border-radius: 8px; text-decoration: none; display: inline-flex; align-items: center;">Explore Jobs</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>





