<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="navbar.jsp" %>
<html>
<head>
    <title>CompanyWebAppNew - Landing Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 5rem 0;
            text-align: center;
        }
        
        .hero-section h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
        }
        
        .hero-btn {
            background: white;
            color: #667eea;
            border: none;
            padding: 12px 32px;
            font-size: 1.1rem;
            font-weight: 700;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .hero-btn:hover {
            background: #ffc107;
            color: #333;
            transform: translateY(-2px);
        }
        
        .consultation-card {
            background: linear-gradient(135deg, #5a6ba0 0%, #6a4190 100%);
            color: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }
        
        .section-title {
            color: #333;
            font-weight: 700;
            margin-bottom: 2rem;
        }
        
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .contact-card, .newsletter-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 2rem;
        }
        
        .contact-card h2, .newsletter-card h2 {
            color: #333;
            font-weight: 700;
            margin-bottom: 1.5rem;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 12px 24px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            background: linear-gradient(135deg, #5a6ba0 0%, #6a4190 100%);
            transform: translateY(-2px);
        }
        
        .footer {
            background: #232a3b;
            color: white;
            padding: 3rem 0 1rem 0;
        }
        
        .footer a {
            color: white;
            text-decoration: none;
            transition: color 0.2s;
        }
        
        .footer a:hover {
            color: #ffc107;
        }
        
        .footer-social a {
            margin: 0 10px;
            font-size: 1.2rem;
        }
    </style>
    <script>
        var contextPath = '<%= request.getContextPath() %>';
    </script>
</head>
<body>
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1>Learn more about our listing process, as well as our additional staging and design work.</h1>
                    <button class="hero-btn">LEARN MORE</button>
                </div>
            </div>
        </div>
    </section>
    
    <div class="container my-5">
        <!-- Consultation Card -->
        <section class="consultation-card p-4 mb-5">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <h2 class="text-center mb-4">Get a Free Consultation</h2>
                    <form class="consultation-form">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <input type="text" class="form-control" placeholder="Full Name" required>
                            </div>
                            <div class="col-md-6">
                                <input type="email" class="form-control" placeholder="Enter Email Address" required>
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control" placeholder="Mobile Number" required>
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control" placeholder="Area, City" required>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-warning w-100">Get Quick Quote</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        
        <!-- Projects Section -->
        <section class="mb-5">
            <h2 class="section-title text-center">Our Projects</h2>
            <div class="row" id="projects">
                <!-- Projects will be loaded here via JavaScript -->
            </div>
        </section>
        
        <!-- Clients Section -->
        <section class="mb-5">
            <h2 class="section-title text-center">Happy Clients</h2>
            <div class="row" id="clients">
                <!-- Clients will be loaded here via JavaScript -->
            </div>
        </section>
        
        <!-- Contact Section -->
        <section class="mb-5">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="contact-card">
                        <h2 class="text-center">
                            <i class="bi bi-envelope me-2"></i>Contact Us
                        </h2>
                        <form action="ContactServlet" method="post">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <input type="text" name="name" class="form-control" placeholder="Full Name" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="text" name="phone" class="form-control" placeholder="Mobile Number" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="text" name="city" class="form-control" placeholder="City" required>
                                </div>
                                <div class="col-12">
                                    <textarea name="message" class="form-control" rows="3" placeholder="Your Message" required></textarea>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary w-100">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Newsletter Section -->
        <section class="mb-5">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="newsletter-card">
                        <h2 class="text-center">
                            <i class="bi bi-envelope-paper me-2"></i>Subscribe to our Newsletter
                        </h2>
                        <form action="NewsletterServlet" method="post">
                            <div class="input-group">
                                <input type="email" name="email" class="form-control" placeholder="Enter your email address" required>
                                <button type="submit" class="btn btn-primary">Subscribe</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="text-center mb-4">
                        <a href="#" class="me-4">Home</a>
                        <a href="#" class="me-4">Services</a>
                        <a href="#" class="me-4">Projects</a>
                        <a href="#" class="me-4">Testimonials</a>
                        <a href="#" class="me-4">Contact</a>
                    </div>
                    <div class="text-center mb-3">
                        <div class="input-group justify-content-center" style="max-width: 400px; margin: 0 auto;">
                            <input type="email" class="form-control" placeholder="Enter Email Address">
                            <button class="btn btn-warning">Subscribe</button>
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col-md-6 text-center text-md-start">
                            <span>All Rights Reserved 2023</span>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-social">
                                <a href="#" title="Facebook"><i class="bi bi-facebook"></i></a>
                                <a href="#" title="Twitter"><i class="bi bi-twitter"></i></a>
                                <a href="#" title="Instagram"><i class="bi bi-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    <script>
        // Prevent consultation form from auto-submitting and reloading the page
        document.addEventListener('DOMContentLoaded', function() {
            var forms = document.querySelectorAll('form');
            forms.forEach(function(form) {
                var action = form.getAttribute('action');
                if (!action || (action !== 'ContactServlet' && action !== 'NewsletterServlet')) {
                    form.addEventListener('submit', function(e) {
                        e.preventDefault();
                    });
                }
            });
        });
    </script>
</body>
</html> 