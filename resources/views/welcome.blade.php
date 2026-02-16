<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sutariya Infotec</title>
     <!-- SVG Favicon -->
    <link rel="icon" type="image/svg+xml" href="{{ asset('images/logo.svg') }}">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>

/* Hero Background */
.hero-section {
    min-height: 90vh;
    background: linear-gradient(135deg, #0f172a, #1e3a8a, #312e81);
    padding: 120px 0;
    overflow: hidden;
}

/* Gradient Text */
.text-gradient {
    background: linear-gradient(90deg, #3b82f6, #6366f1);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* Glass Card */
.hero-card {
    background: rgba(255, 255, 255, 0.08);
    backdrop-filter: blur(15px);
    border: 1px solid rgba(255, 255, 255, 0.15);
}

/* Button Hover */
.btn-primary {
    background: linear-gradient(90deg, #3b82f6, #6366f1);
    border: none;
}

.btn-primary:hover {
    opacity: 0.9;
}
/* feature section */
/* Feature Card (White Corporate Style) */
.feature-card {
    background: #ffffff;
    border: 1px solid #e5e7eb;
    transition: all 0.4s ease;
}

/* Hover Effect */
.feature-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0,0,0,0.08);
    border-color: #3b82f6;
}

/* Icon Style Matching Hero Gradient */
.feature-icon {
    font-size: 28px;
    background: linear-gradient(135deg, #3b82f6, #6366f1);
    width: 70px;
    height: 70px;
    border-radius: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    color: white;
}
/* Footer Background Matching Hero */
.custom-footer {
    background: linear-gradient(135deg, #0f172a, #1e3a8a);
}

/* Gradient Text Same as Hero */
.text-gradient {
    background: linear-gradient(90deg, #3b82f6, #6366f1);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.custom-footer ul li {
    transition: 0.3s ease;
}

.custom-footer ul li:hover {
    color: #ffffff;
    transform: translateX(5px);
}

</style>

<body class="bg-light">

    <!-- Modern Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-transparent fixed-top py-3" style="backdrop-filter: blur(12px); background: linear-gradient(90deg, #111827cc, #1e3a8acc);">
    <div class="container">

        <a class="navbar-brand d-flex align-items-center gap-2 fw-bold fs-4" href="#">
    
    <img src="{{ asset('images/SG-white.png') }}" 
         alt="Sutariya Logo" 
         height="40"
         class="rounded">
</a>


        <!-- Mobile Toggle -->
        <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Links -->
        <div class="collapse navbar-collapse justify-content-end" id="mainNavbar">
            <ul class="navbar-nav align-items-lg-center gap-lg-4">

                <li class="nav-item">
                    <a class="nav-link nav-hover" href="{{ url('/employee/login') }}">Employe Login</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link nav-hover" href="{{ url('/hr/login') }}">HR Login</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link nav-hover" href="{{ url('/admin/login') }}">Admin Login</a>
                </li>
            </ul>
        </div>

    </div>
</nav>


   
    <!-- Modern Hero Section -->
<section class="hero-section d-flex align-items-center text-white position-relative">

    <div class="container text-center text-lg-start">

        <div class="row align-items-center">

            <!-- LEFT CONTENT -->
            <div class="col-lg-6 mb-5 mb-lg-0">

                <h1 class="display-3 fw-bold mb-4">
                    Smart HR Attendance <br>
                    <span class="text-gradient">Management System</span>
                </h1>

                <p class="lead text-light opacity-75 mb-4">
                    Secure • Real-Time • Intelligent Workforce Tracking for Modern Enterprises
                </p>

                <div class="d-flex flex-column flex-sm-row gap-3 justify-content-center justify-content-lg-start">
                    <button class="btn btn-primary btn-lg px-4 rounded-pill shadow">
                        Get Started
                    </button>

                    <button class="btn btn-outline-light btn-lg px-4 rounded-pill">
                        Learn More
                    </button>
                </div>

            </div>

            <!-- RIGHT CONTENT -->
            <div class="col-lg-6 text-center">

                <div class="hero-card p-4 rounded-4 shadow-lg">
                    <h5 class="mb-3 text-white-50">Live System Status</h5>

                    <div class="display-5 fw-bold mb-3" id="liveClock">
                        00:00:00
                    </div>

                    <div class="small text-white-50">
                        Real-Time Monitoring Enabled
                    </div>
                </div>

            </div>

        </div>

    </div>

</section>


    <!-- Features -->
   <!-- Professional Department Section -->
<section class="features-section py-5 bg-white">

    <div class="container">

        <!-- Section Heading -->
        <div class="text-center mb-5">
            <h2 class="fw-bold display-5 text-dark">
                Workforce & Department Management
            </h2>
            <p class="text-muted">
                Smart Digital Solutions for Employee, HR & Operations Management
            </p>
        </div>

        <div class="row g-4">

            <!-- Employee Management -->
            <div class="col-md-4">
                <div class="feature-card h-100 p-4 text-center rounded-4">
                    <div class="feature-icon mb-4">
                        👨‍💼
                    </div>
                    <h5 class="fw-bold mb-3">
                        Employee Management
                    </h5>
                    <p class="text-muted">
                        Manage employee records, attendance tracking, performance evaluation,
                        and departmental assignments efficiently.
                    </p>
                </div>
            </div>

            <!-- HR Department -->
            <div class="col-md-4">
                <div class="feature-card h-100 p-4 text-center rounded-4">
                    <div class="feature-icon mb-4">
                        🏢
                    </div>
                    <h5 class="fw-bold mb-3">
                        HR Operations
                    </h5>
                    <p class="text-muted">
                        Automate HR processes including leave approvals, payroll coordination,
                        compliance monitoring, and workforce planning.
                    </p>
                </div>
            </div>

            <!-- Operations Department -->
            <div class="col-md-4">
                <div class="feature-card h-100 p-4 text-center rounded-4">
                    <div class="feature-icon mb-4">
                        ⚙️
                    </div>
                    <h5 class="fw-bold mb-3">
                        Operations Department
                    </h5>
                    <p class="text-muted">
                        Monitor daily operations, streamline workflow processes,
                        and improve productivity across organizational units.
                    </p>
                </div>
            </div>

        </div>
    </div>
</section>



  <!-- Modern Corporate Footer -->
<footer class="custom-footer text-white pt-5 pb-4">

    <div class="container">

        <div class="row align-items-start">

            <!-- Company Info -->
            <div class="col-md-4 mb-4">
                <h5 class="fw-bold mb-3">
                    Sutariya <span class="text-gradient">Infotech</span>
                </h5>
                <p class="text-light opacity-75">
                    Empowering businesses with smart HR management,
                    employee tracking, and enterprise workforce solutions.
                </p>
            </div>

            <!-- Departments -->
            <div class="col-md-4 mb-4">
                <h6 class="fw-semibold mb-3">Departments</h6>
                <ul class="list-unstyled text-light opacity-75">
                    <li class="mb-2">Employee Management</li>
                    <li class="mb-2">HR Operations</li>
                    <li class="mb-2">Operations Department</li>
                </ul>
            </div>

            <!-- System Info -->
            <div class="col-md-4 mb-4">
                <h6 class="fw-semibold mb-3">System</h6>
                <ul class="list-unstyled text-light opacity-75">
                    <li class="mb-2">Real-Time Attendance</li>
                    <li class="mb-2">Smart Reporting</li>
                    <li class="mb-2">Secure Access Control</li>
                </ul>
            </div>

        </div>

        <hr class="border-light opacity-25">

        <div class="text-center small text-light opacity-75">
            © {{ date('Y') }} Sutariya Infotech. All Rights Reserved.
        </div>

    </div>

</footer>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
function updateClock() {
    const now = new Date();
    const options = { timeZone: 'Asia/Kolkata', hour12: true };
    document.getElementById('liveClock').innerText =
        now.toLocaleTimeString('en-IN', options);
}

setInterval(updateClock, 1000);
updateClock();
</script>

</body>
</html>
