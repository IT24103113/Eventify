<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Eventify - Book Photographers & Videographers Effortlessly</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .modal-bg { background: rgba(30, 27, 75, 0.8); }
        .animate-float { animation: float 3s ease-in-out infinite; }
        @keyframes float { 0%, 100% { transform: translateY(0px);} 50% { transform: translateY(-20px);} }
        .gallery-filter-btn.active, .gallery-filter-btn:focus { background: linear-gradient(to right, #6366f1, #a21caf); color: white; border-color: #a21caf; }
        details[open] summary .faq-arrow { transform: rotate(180deg);}
        .faq-arrow { transition: transform 0.3s; }
        .review-star { color: #fbbf24; }
        .review-card { transition: box-shadow .2s; }
        .review-card:hover { box-shadow: 0 8px 32px 0 rgba(80,0,140,0.12);}
        
        /* Enhanced gallery styles */
        .gallery-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1.5rem;
        }
        .gallery-item {
            position: relative;
            overflow: hidden;
            border-radius: 1rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .gallery-item:hover, .gallery-item:focus {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
        }
        .gallery-item img {
            width: 100%;
            height: 280px;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        .gallery-item:hover img {
            transform: scale(1.08);
        }
        .gallery-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);
            padding: 1.5rem 1rem 0.75rem;
            color: white;
            transform: translateY(100%);
            transition: transform 0.3s ease;
        }
        .gallery-item:hover .gallery-overlay {
            transform: translateY(0);
        }
        .gallery-category {
            position: absolute;
            top: 1rem;
            right: 1rem;
            padding: 0.25rem 0.75rem;
            border-radius: 2rem;
            font-size: 0.75rem;
            font-weight: 600;
        }
        .videographer-badge {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 3rem;
            opacity: 0.8;
            text-shadow: 0 2px 4px rgba(0,0,0,0.5);
            transition: opacity 0.3s, transform 0.3s;
        }
        .gallery-item:hover .videographer-badge {
            opacity: 1;
            transform: translate(-50%, -50%) scale(1.2);
        }
        .package-card {
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .package-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        .service-badge {
            position: absolute;
            top: -10px;
            right: 20px;
            z-index: 10;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-indigo-100 to-fuchsia-100 text-gray-800 min-h-screen">

<!-- DateTime and User Info Bar -->
<div class="bg-gray-800 text-white py-1 px-4">
    <div class="container mx-auto flex justify-between items-center text-sm">
        <div>
            <i class="bi bi-clock"></i> 2025-05-17 14:41:52 (UTC)
        </div>
        <div>
            <i class="bi bi-person-badge"></i> User: IT24103113
        </div>
    </div>
</div>

<!-- Navigation -->
<header class="bg-white/90 shadow sticky top-0 z-50">
    <nav class="container mx-auto flex items-center justify-between py-4 px-4">
        <span class="text-2xl font-extrabold text-indigo-700 flex items-center gap-2">
            <i class="bi bi-camera2"></i> Eventify
        </span>
        <ul class="flex flex-wrap space-x-4 md:space-x-8 font-medium items-center">
            <li><a href="#about" class="hover:text-indigo-600 transition">About</a></li>
            <li><a href="#how" class="hover:text-indigo-600 transition">How It Works</a></li>
            <li><a href="#services" class="hover:text-indigo-600 transition">Services</a></li>
            <li><a href="#gallery" class="hover:text-indigo-600 transition">Gallery</a></li>
            <li><a href="#packages" class="hover:text-indigo-600 transition">Packages</a></li>
            <li><a href="#reviews" class="hover:text-indigo-600 transition">Reviews</a></li>
            <li><a href="#faq" class="hover:text-indigo-600 transition">FAQ</a></li>
            <li><a href="#contact" class="hover:text-indigo-600 transition">Contact</a></li>
        </ul>
        <!-- Navigation Buttons with Admin and User Login -->
        <div class="flex space-x-3 items-center">
            <%
                Object user = session.getAttribute("user");
                if (user == null) {
            %>
            <div class="flex space-x-2">
                <a href="WEB-INF/views/userLogin.jsp" target="_self" class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-full font-semibold shadow transition flex items-center gap-2">
                    <i class="bi bi-person"></i> User Login
                </a>
                <a href="WEB-INF/views/adminLogin.jsp" target="_self" class="bg-gray-700 hover:bg-gray-800 text-white px-4 py-2 rounded-full font-semibold shadow transition flex items-center gap-2">
                    <i class="bi bi-shield-lock"></i> Admin Login
                </a>
            </div>
            <a href="register.jsp" target="_blank" class="bg-fuchsia-600 hover:bg-fuchsia-700 text-white px-4 py-2 rounded-full font-semibold shadow transition flex items-center gap-2">
                <i class="bi bi-person-plus"></i> Sign Up
            </a>
            <%
            } else {
            %>
            <a href="account.jsp" target="_self" class="bg-emerald-600 hover:bg-emerald-700 text-white px-4 py-2 rounded-full font-semibold shadow transition flex items-center gap-2">
                <i class="bi bi-person-circle"></i> My Account
            </a>
            <a href="logout" class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-full font-semibold shadow transition flex items-center gap-2">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
            <%
                }
            %>
        </div>
    </nav>
    <div class="w-full bg-indigo-700 text-white py-2 text-center font-medium text-base">
        <span class="inline-flex items-center gap-2">
            <i class="bi bi-briefcase"></i>
            Are you a photographer or videographer? 
            <a href="WEB-INF/views/providerRegister.jsp" target="_blank" class="underline font-semibold hover:text-fuchsia-200 ml-1">Join Our Provider Network</a>
        </span>
    </div>
</header>

<!-- Hero Section -->
<section class="relative min-h-[88vh] flex items-center justify-center bg-gradient-to-r from-indigo-700 to-fuchsia-500 text-white overflow-hidden">
    <div class="container mx-auto px-4 relative z-10 text-center">
        <h1 class="text-4xl md:text-6xl font-extrabold mb-6 drop-shadow-lg">Capture Every Moment with <span class="text-fuchsia-200">Eventify</span></h1>
        <p class="text-xl md:text-2xl mb-10 max-w-2xl mx-auto drop-shadow">Book professional photographers and videographers for any occasion. Browse portfolios, compare packages, and create lasting memories with just a few clicks.</p>
        <div class="flex flex-col sm:flex-row gap-5 justify-center items-center mb-6">
            <a href="register.jsp" target="_blank" class="bg-gradient-to-r from-indigo-600 to-fuchsia-500 font-semibold py-3 px-10 rounded-full shadow-lg hover:scale-105 transition text-lg inline-block">
                <i class="bi bi-person-plus"></i> Sign Up Free
            </a>
            <a href="#services" class="bg-white/90 text-indigo-700 px-7 py-3 rounded-full shadow-md hover:bg-white transition text-lg font-semibold flex items-center gap-2">
                <i class="bi bi-camera-reels"></i> Explore Services
            </a>
        </div>
        <div class="flex flex-wrap justify-center gap-4 mt-6">
            <div class="bg-white/20 px-5 py-2 rounded-full text-lg font-medium inline-flex items-center gap-2 shadow text-white">
                <i class="bi bi-star-fill text-yellow-300"></i> 4.9/5 Rated by 1,200+ clients
            </div>
            <div class="bg-white/20 px-5 py-2 rounded-full text-lg font-medium inline-flex items-center gap-2 shadow text-white">
                <i class="bi bi-shield-check text-green-200"></i> 100% Satisfaction Guarantee
            </div>
            <div class="bg-white/20 px-5 py-2 rounded-full text-lg font-medium inline-flex items-center gap-2 shadow text-white">
                <i class="bi bi-camera"></i> 200+ Verified Professionals
            </div>
        </div>
    </div>
    <div class="absolute top-0 left-0 w-full h-full bg-no-repeat bg-center" style="background-image: url('https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=1200&q=60'); opacity:0.09"></div>
</section>

<!-- About Section -->
<section id="about" class="py-20">
    <div class="container mx-auto px-4 text-center">
        <h2 class="text-3xl md:text-4xl font-bold mb-5 text-indigo-700">About Eventify</h2>
        <p class="text-gray-700 max-w-2xl mx-auto text-lg leading-relaxed">
            Eventify is your all-in-one platform for booking professional photography and videography services. We connect clients with skilled professionals who can capture your special moments exactly how you envision them. With our secure booking system and verified providers, your memories are in safe hands.
        </p>
        <div class="mt-10 grid md:grid-cols-3 gap-6 max-w-4xl mx-auto">
            <div class="bg-white rounded-xl p-6 shadow-md">
                <div class="text-3xl text-indigo-600 mb-2"><i class="bi bi-camera"></i></div>
                <h3 class="text-xl font-bold mb-2">Professional Photography</h3>
                <p class="text-gray-600">High-quality still photography for all your events and special occasions.</p>
            </div>
            <div class="bg-white rounded-xl p-6 shadow-md">
                <div class="text-3xl text-fuchsia-600 mb-2"><i class="bi bi-camera-reels"></i></div>
                <h3 class="text-xl font-bold mb-2">Expert Videography</h3>
                <p class="text-gray-600">Cinematic video coverage to capture the full experience of your event.</p>
            </div>
            <div class="bg-white rounded-xl p-6 shadow-md">
                <div class="text-3xl text-emerald-600 mb-2"><i class="bi bi-box2-heart"></i></div>
                <h3 class="text-xl font-bold mb-2">Combined Packages</h3>
                <p class="text-gray-600">Get the best of both worlds with our photo + video service bundles.</p>
            </div>
        </div>
    </div>
</section>

<!-- How It Works -->
<section id="how" class="bg-gradient-to-b from-gray-100 to-white py-20">
    <div class="container mx-auto px-4">
        <h2 class="text-3xl md:text-4xl font-bold mb-12 text-center text-indigo-700">How It Works</h2>
        <div class="grid md:grid-cols-4 gap-8 text-center">
            <div class="bg-white bg-opacity-80 p-6 rounded-xl hover:scale-105 transition">
                <div class="text-4xl text-indigo-600 mb-3"><i class="bi bi-person-plus"></i></div>
                <h3 class="font-semibold mb-2 text-lg">1. Create an Account</h3>
                <p class="text-gray-600">Sign up for free and tell us about your event needs and preferences.</p>
            </div>
            <div class="bg-white bg-opacity-80 p-6 rounded-xl hover:scale-105 transition">
                <div class="text-4xl text-indigo-600 mb-3"><i class="bi bi-search"></i></div>
                <h3 class="font-semibold mb-2 text-lg">2. Discover Professionals</h3>
                <p class="text-gray-600">Browse photographers and videographers by style, price, and reviews.</p>
            </div>
            <div class="bg-white bg-opacity-80 p-6 rounded-xl hover:scale-105 transition">
                <div class="text-4xl text-indigo-600 mb-3"><i class="bi bi-calendar2-check"></i></div>
                <h3 class="font-semibold mb-2 text-lg">3. Book & Confirm</h3>
                <p class="text-gray-600">Select your package, schedule your date, and confirm with secure payment.</p>
            </div>
            <div class="bg-white bg-opacity-80 p-6 rounded-xl hover:scale-105 transition">
                <div class="text-4xl text-indigo-600 mb-3"><i class="bi bi-image"></i></div>
                <h3 class="font-semibold mb-2 text-lg">4. Receive & Share</h3>
                <p class="text-gray-600">Get your photos and videos through our platform and share your experience.</p>
            </div>
        </div>
    </div>
</section>

<!-- Services Section -->
<section id="services" class="py-20">
    <div class="container mx-auto px-4">
        <h2 class="text-3xl md:text-4xl font-bold mb-12 text-center text-indigo-700">Our Services</h2>
        <div class="grid gap-8 md:grid-cols-2">
            <div class="relative bg-white rounded-2xl shadow-lg p-8 border-t-4 border-indigo-600">
                <div class="service-badge bg-indigo-600 text-white px-4 py-1 rounded-full font-bold">Photography</div>
                <div class="text-5xl mb-6 text-indigo-600"><i class="bi bi-camera"></i></div>
                <h3 class="font-bold text-2xl mb-4">Photography Services</h3>
                <ul class="space-y-3 text-gray-700">
                    <li class="flex items-start">
                        <i class="bi bi-check-circle-fill text-indigo-600 mt-1 mr-2"></i>
                        <span><strong>Wedding Photography:</strong> Full-day coverage, engagement sessions, wedding albums</span>
                    </li>
                    <li class="flex items-start">
                        <i class="bi bi-check-circle-fill text-indigo-600 mt-1 mr-2"></i>
                        <span><strong>Portrait Photography:</strong> Family portraits, senior photos, professional headshots</span>
                    </li>
                    <li class="flex items-start">
                        <i class="bi bi-check-circle-fill text-indigo-600 mt-1 mr-2"></i>
                        <span><strong>Event Photography:</strong> Birthdays, corporate events, parties, graduations</span>
                    </li>
                    <li class="flex items-start">
                        <i class="bi bi-check-circle-fill text-indigo-600 mt-1 mr-2"></i>
                        <span><strong>Commercial Photography:</strong> Product photography, real estate, food photography</span>
                    </li>
                </ul>
                <div class="mt-6">
                    <a href="photography.jsp" class="inline-block bg-indigo-600 text-white px-6 py-3 rounded-lg hover:bg-indigo-700 transition">Explore Photography</a>
                </div>
            </div>
            
            <div class="relative bg-white rounded-2xl shadow-lg p-8 border-t-4 border-fuchsia-600">
                <div class="service-badge bg-fuchsia-600 text-white px-4 py-1 rounded-full font-bold">Videography</div>
                <div class="text-5xl mb-6 text-fuchsia-600"><i class="bi bi-camera-reels"></i></div>
                <h3 class="font-bold text-2xl mb-4">Videography Services</h3>
                <ul class="space-y-3 text-gray-700">
                    <li class="flex items-start">
                        <i class="bi bi-check-circle-fill text-fuchsia-600 mt-1 mr-2"></i>
                        <span><strong>Wedding Videography:</strong> Ceremony & reception, highlight reels, full-length edits</span>
                    </li>
                    <li class="flex items-start">
                        <i class="bi bi-check-circle-fill text-fuchsia-600 mt-1 mr-2"></i>
                        <span><strong>Event Videography:</strong> Corporate events, concerts, performances, conferences</span>
                    </li>
                    <li class="flex items-start">
                        <i class="bi bi-check-circle-fill text-fuchsia-600 mt-1 mr-2"></i>
                        <span><strong>Commercial Videos:</strong> Promotional videos, testimonials, product demonstrations</span>
                    </li>
                    <li class="flex items-start">
                        <i class="bi bi-check-circle-fill text-fuchsia-600 mt-1 mr-2"></i>
                        <span><strong>Aerial Videography:</strong> Drone footage for events, properties, and landscapes</span>
                    </li>
                </ul>
                <div class="mt-6">
                    <a href="videography.jsp" class="inline-block bg-fuchsia-600 text-white px-6 py-3 rounded-lg hover:bg-fuchsia-700 transition">Explore Videography</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Gallery Section -->
<section id="gallery" class="bg-gradient-to-t from-gray-100 to-white py-20">
    <div class="container mx-auto px-4">
        <h2 class="text-3xl md:text-4xl font-bold mb-8 text-center text-indigo-700">Portfolio Gallery</h2>
        
        <!-- Filter Buttons -->
        <div class="flex flex-wrap justify-center gap-4 mb-10" role="tablist" aria-label="Gallery Filter">
            <button type="button" class="gallery-filter-btn px-6 py-2 rounded-full font-semibold shadow transition border-2 border-indigo-600 bg-indigo-600 text-white active" 
                    onclick="filterGallery('all', this)" aria-selected="true" id="filterAll">All Work</button>
                    
            <button type="button" class="gallery-filter-btn px-6 py-2 rounded-full font-semibold shadow transition border-2 border-indigo-600 bg-white text-indigo-700" 
                    onclick="filterGallery('photographer', this)" aria-selected="false" id="filterPhotographers">Photography</button>
                    
            <button type="button" class="gallery-filter-btn px-6 py-2 rounded-full font-semibold shadow transition border-2 border-indigo-600 bg-white text-indigo-700" 
                    onclick="filterGallery('videographer', this)" aria-selected="false" id="filterVideographers">Videography</button>
        </div>
        
        <!-- Gallery Grid -->
        <div id="galleryGrid" class="gallery-container">
            <!-- Photographers -->
            <div class="gallery-item photographer" tabindex="0" onclick="showPortfolioModal('Emily Carter', 'Wedding photographer with 5+ years of experience', 'wedding')">
                <img src="https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=600&q=80"
                     alt="Emily Carter - Weddings" class="w-full h-full object-cover"/>
                <span class="gallery-category bg-fuchsia-100 text-fuchsia-700">Weddings</span>
                <div class="gallery-overlay">
                    <h3 class="text-xl font-bold">Emily Carter</h3>
                    <p class="text-sm text-gray-200">Specializes in capturing beautiful wedding moments</p>
                    <div class="mt-3 flex items-center">
                        <div class="flex text-yellow-400">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-half"></i>
                        </div>
                        <span class="ml-2">4.7 (89 reviews)</span>
                    </div>
                </div>
            </div>
            
            <div class="gallery-item photographer" tabindex="0" onclick="showPortfolioModal('Michael Lee', 'Event photographer specializing in birthdays', 'birthday')">
                <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=600&q=80"
                     alt="Michael Lee - Birthdays" class="w-full h-full object-cover"/>
                <span class="gallery-category bg-fuchsia-100 text-fuchsia-700">Birthdays</span>
                <div class="gallery-overlay">
                    <h3 class="text-xl font-bold">Michael Lee</h3>
                    <p class="text-sm text-gray-200">Creating wonderful birthday memories</p>
                    <div class="mt-3 flex items-center">
                        <div class="flex text-yellow-400">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>
                        <span class="ml-2">5.0 (42 reviews)</span>
                    </div>
                </div>
            </div>
            
            <div class="gallery-item photographer" tabindex="0" onclick="showPortfolioModal('Samantha Fox', 'Corporate event photographer', 'corporate')">
                <img src="https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&w=600&q=80"
                     alt="Samantha Fox - Corporate" class="w-full h-full object-cover"/>
                <span class="gallery-category bg-fuchsia-100 text-fuchsia-700">Corporate</span>
                <div class="gallery-overlay">
                    <h3 class="text-xl font-bold">Samantha Fox</h3>
                    <p class="text-sm text-gray-200">Professional corporate event photography</p>
                    <div class="mt-3 flex items-center">
                        <div class="flex text-yellow-400">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star"></i>
                        </div>
                        <span class="ml-2">4.1 (37 reviews)</span>
                    </div>
                </div>
            </div>
            
            <div class="gallery-item photographer" tabindex="0" onclick="showPortfolioModal('John Doe', 'Outdoor and nature photographer', 'outdoor')">
                <img src="https://images.unsplash.com/photo-1482062364825-616fd23b8fc1?auto=format&fit=crop&w=600&q=80"
                     alt="John Doe - Outdoor" class="w-full h-full object-cover"/>
                <span class="gallery-category bg-fuchsia-100 text-fuchsia-700">Outdoor</span>
                <div class="gallery-overlay">
                    <h3 class="text-xl font-bold">John Doe</h3>
                    <p class="text-sm text-gray-200">Capturing the beauty of outdoor events</p>
                    <div class="mt-3 flex items-center">
                        <div class="flex text-yellow-400">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-half"></i>
                        </div>
                        <span class="ml-2">4.6 (63 reviews)</span>
                    </div>
                </div>
            </div>
            
            <div class="gallery-item photographer" tabindex="0" onclick="showPortfolioModal('Anna Smith', 'Engagement and couple photographer', 'engagement')">
                <img src="https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=600&q=80"
                     alt="Anna Smith - Engagements" class="w-full h-full object-cover"/>
                <span class="gallery-category bg-fuchsia-100 text-fuchsia-700">Engagements</span>
                <div class="gallery-overlay">
                    <h3 class="text-xl font-bold">Anna Smith</h3>
                    <p class="text-sm text-gray-200">Specializing in engagement photoshoots</p>
                    <div class="mt-3 flex items-center">
                        <div class="flex text-yellow-400">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>
                        <span class="ml-2">4.9 (104 reviews)</span>
                    </div>
                </div>
            </div>
            
            <!-- Videographers -->
            <div class="gallery-item videographer" tabindex="0" onclick="showPortfolioModal('Alex Brown', 'Wedding videographer', 'wedding-video')">
                <img src="https://img.youtube.com/vi/bTqVqk7FSmY/hqdefault.jpg"
                     alt="Alex Brown - Wedding Highlights" class="w-full h-full object-cover"/>
                <i class="bi bi-play-circle-fill videographer-badge"></i>
                <span class="gallery-category bg-indigo-100 text-indigo-700">Wedding</span>
                <div class="gallery-overlay">
                    <h3 class="text-xl font-bold">Alex Brown</h3>
                    <p class="text-sm text-gray-200">Creating cinematic wedding videos</p>
                    <div class="mt-3 flex items-center">
                        <div class="flex text-yellow-400">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star"></i>
                        </div>
                        <span class="ml-2">4.2 (51 reviews)</span>
                    </div>
                </div>
            </div>
            
            <div class="gallery-item videographer" tabindex="0" onclick="showPortfolioModal('Priya Desai', 'Concert videographer', 'concert-video')">
                <img src="https://img.youtube.com/vi/K4TOrB7at0Y/hqdefault.jpg"
                     alt="Priya Desai - Concert Videography" class="w-full h-full object-cover"/>
                <i class="bi bi-play-circle-fill videographer-badge"></i>
                <span class="gallery-category bg-indigo-100 text-indigo-700">Concert</span>
                <div class="gallery-overlay">
                    <h3 class="text-xl font-bold">Priya Desai</h3>
                    <p class="text-sm text-gray-200">Capturing the energy of live concerts</p>
                    <div class="mt-3 flex items-center">
                        <div class="flex text-yellow-400">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-half"></i>
                        </div>
                        <span class="ml-2">4.7 (83 reviews)</span>
                    </div>
                </div>
            </div>
            
            <div class="gallery-item videographer" tabindex="0" onclick="showPortfolioModal('Chris Park', 'Birthday videographer', 'birthday-video')">
                <img src="https://img.youtube.com/vi/V5QPXhStb5I/hqdefault.jpg"
                     alt="Chris Park - Birthday Highlights" class="w-full h-full object-cover"/>
                <i class="bi bi-play-circle-fill videographer-badge"></i>
                <span class="gallery-category bg-indigo-100 text-indigo-700">Birthday</span>
                <div class="gallery-overlay">
                    <h3 class="text-xl font-bold">Chris Park</h3>
                    <p class="text-sm text-gray-200">Creating memorable birthday videos</p>
                    <div class="mt-3 flex items-center">
                        <div class="flex text-yellow-400">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star"></i>
                        </div>
                        <span class="ml-2">4.0 (45 reviews)</span>
                    </div>
                </div>
            </div>
            
            <div class="gallery-item videographer" tabindex="0" onclick="showPortfolioModal('Liam Wang', 'Music video producer', 'music-video')">
                <img src="https://img.youtube.com/vi/rDjbZMW-fUI/hqdefault.jpg"
                     alt="Liam Wang - Music Video" class="w-full h-full object-cover"/>
                <i class="bi bi-play-circle-fill videographer-badge"></i>
                <span class="gallery-category bg-indigo-100 text-indigo-700">Music</span>
                <div class="gallery-overlay">
                    <h3 class="text-xl font-bold">Liam Wang</h3>
                    <p class="text-sm text-gray-200">Professional music video production</p>
                    <div class="mt-3 flex items-center">
                        <div class="flex text-yellow-400">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                        </div>
                        <span class="ml-2">4.8 (92 reviews)</span>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="flex justify-center mt-10">
            <a href="register.jsp" class="bg-gradient-to-r from-fuchsia-600 to-indigo-600 text-white px-8 py-3 rounded-full font-bold shadow-lg hover:scale-105 transition text-lg flex items-center gap-2">
                <i class="bi bi-calendar-check"></i> Find Your Perfect Match
            </a>
        </div>
        <p class="text-center text-gray-500 mt-5">
            Register to see our full range of talented professionals and their complete portfolios!
        </p>
    </div>
    
    <!-- Portfolio Modal -->
    <div id="portfolioModal" class="fixed inset-0 bg-black bg-opacity-75 z-50 hidden flex items-center justify-center p-4">
        <div class="bg-white rounded-2xl max-w-4xl w-full max-h-90vh overflow-auto shadow-2xl relative">
            <button onclick="closePortfolioModal()" class="absolute top-4 right-4 text-gray-500 hover:text-gray-800 text-2xl">
                <i class="bi bi-x-circle-fill"></i>
            </button>
            <div class="p-6">
                <div id="modalContent" class="flex flex-col md:flex-row gap-6">
                    <!-- Content will be dynamically inserted here -->
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Service Packages -->
<section id="packages" class="py-20 bg-gradient-to-b from-indigo-50 to-white">
    <div class="container mx-auto px-4">
        <h2 class="text-3xl md:text-4xl font-bold mb-4 text-center text-indigo-700">Service Packages</h2>
        <p class="text-center text-gray-600 mb-12 max-w-2xl mx-auto">Choose from our wide range of photography and videography packages, or customize one to fit your specific needs.</p>
        
        <div class="grid md:grid-cols-3 gap-8">
            <!-- Photography Package -->
            <div class="package-card bg-white rounded-xl shadow-lg overflow-hidden border-t-4 border-indigo-500">
                <div class="p-6">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-xl font-bold text-indigo-700">Photography Essential</h3>
                        <span class="bg-indigo-100 text-indigo-700 text-sm py-1 px-3 rounded-full font-semibold">Photos</span>
                    </div>
                    <div class="text-3xl font-bold mb-4">$499<span class="text-gray-500 text-lg font-normal">/event</span></div>
                    <ul class="space-y-2 mb-6">
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> 4 hours of coverage</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> 1 professional photographer</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> 100+ digital edited images</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> Online gallery delivery</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> Print release included</li>
                    </ul>
                    <div class="mt-auto">
                        <a href="booking.jsp?package=photo-essential" class="block text-center bg-indigo-600 text-white py-2 px-4 rounded-lg hover:bg-indigo-700 transition">Book Now</a>
                    </div>
                </div>
            </div>
            
            <!-- Combined Package -->
            <div class="package-card bg-white rounded-xl shadow-xl overflow-hidden border-t-4 border-purple-500 transform scale-105">
                <div class="bg-gradient-to-r from-indigo-600 to-fuchsia-600 text-white text-center py-2 font-semibold text-sm">
                    MOST POPULAR
                </div>
                <div class="p-6">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-xl font-bold text-purple-700">Ultimate Combo</h3>
                        <span class="bg-purple-100 text-purple-700 text-sm py-1 px-3 rounded-full font-semibold">Photo + Video</span>
                    </div>
                    <div class="text-3xl font-bold mb-4">$1,199<span class="text-gray-500 text-lg font-normal">/event</span></div>
                    <ul class="space-y-2 mb-6">
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> 8 hours of coverage</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> 1 photographer + 1 videographer</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> 250+ digital edited images</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> 5-minute highlight video</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> Full ceremony video coverage</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> Online gallery & video delivery</li>
                    </ul>
                    <div class="mt-auto">
                        <a href="booking.jsp?package=combo-ultimate" class="block text-center bg-gradient-to-r from-indigo-600 to-fuchsia-600 text-white py-2 px-4 rounded-lg hover:opacity-90 transition">Book Now</a>
                    </div>
                </div>
            </div>
            
            <!-- Videography Package -->
            <div class="package-card bg-white rounded-xl shadow-lg overflow-hidden border-t-4 border-fuchsia-500">
                <div class="p-6">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-xl font-bold text-fuchsia-700">Videography Essential</h3>
                        <span class="bg-fuchsia-100 text-fuchsia-700 text-sm py-1 px-3 rounded-full font-semibold">Video</span>
                    </div>
                    <div class="text-3xl font-bold mb-4">$699<span class="text-gray-500 text-lg font-normal">/event</span></div>
                    <ul class="space-y-2 mb-6">
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> 4 hours of coverage</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> 1 professional videographer</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> 3-minute highlight video</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> Professional editing</li>
                        <li class="flex items-center"><i class="bi bi-check-circle-fill text-green-500 mr-2"></i> Digital delivery</li>
                    </ul>
                    <div class="mt-auto">
                        <a href="booking.jsp?package=video-essential" class="block text-center bg-fuchsia-600 text-white py-2 px-4 rounded-lg hover:bg-fuchsia-700 transition">Book Now</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="text-center mt-10">
            <a href="packages.jsp" class="inline-block bg-white border-2 border-indigo-600 text-indigo-600 px-6 py-3 rounded-lg hover:bg-indigo-50 transition font-semibold">
                View All Packages
            </a>
            <p class="mt-2 text-gray-600">Custom packages also available. <a href="#contact" class="text-indigo-600 underline">Contact us</a> for details.</p>
        </div>
    </div>
</section>

<!-- Reviews Section -->
<section id="reviews" class="py-20 bg-gradient-to-t from-white to-fuchsia-50">
    <div class="container mx-auto px-4">
        <h2 class="text-3xl md:text-4xl font-bold mb-8 text-center text-indigo-700">Client Testimonials</h2>
        <div class="grid md:grid-cols-3 gap-8">
            <!-- Review 1 -->
            <div class="review-card bg-white rounded-2xl shadow p-7">
                <div class="flex items-center mb-2">
                    <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Sarah J." class="w-12 h-12 rounded-full mr-3 shadow">
                    <div>
                        <div class="font-bold text-indigo-700">Sarah Johnson</div>
                        <div class="flex gap-1 text-yellow-400 text-lg mt-1">
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-fill review-star"></i>
                        </div>
                    </div>
                </div>
                <div class="text-gray-700 mt-3">"We booked both photography and videography services for our wedding through Eventify. The team was incredible—capturing moments we didn't even realize were happening. Having both photos and videos gives us different ways to relive our special day!"</div>
                <div class="mt-4 text-xs text-gray-500">Services: Photo + Video | Wedding | April 2025</div>
            </div>
            
            <!-- Review 2 -->
            <div class="review-card bg-white rounded-2xl shadow p-7">
                <div class="flex items-center mb-2">
                    <img src="https://randomuser.me/api/portraits/men/52.jpg" alt="Michael L." class="w-12 h-12 rounded-full mr-3 shadow">
                    <div>
                        <div class="font-bold text-indigo-700">Michael Lee</div>
                        <div class="flex gap-1 text-yellow-400 text-lg mt-1">
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-half review-star"></i>
                        </div>
                    </div>
                </div>
                <div class="text-gray-700 mt-3">"The videographer we booked for my daughter's birthday captured everything so beautifully! The video quality was amazing and they delivered the edited highlights faster than promised. Will definitely use again!"</div>
                <div class="mt-4 text-xs text-gray-500">Services: Videography | Birthday Party | March 2025</div>
            </div>
            
            <!-- Review 3 -->
            <div class="review-card bg-white rounded-2xl shadow p-7">
                <div class="flex items-center mb-2">
                    <img src="https://randomuser.me/api/portraits/women/65.jpg" alt="Priya D." class="w-12 h-12 rounded-full mr-3 shadow">
                    <div>
                        <div class="font-bold text-indigo-700">Jennifer Davis</div>
                        <div class="flex gap-1 text-yellow-400 text-lg mt-1">
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-fill review-star"></i>
                            <i class="bi bi-star-fill review-star"></i>
                        </div>
                    </div>
                </div>
                <div class="text-gray-700 mt-3">"Our corporate event needed both photography and videography. Eventify made it so simple to book both services through one platform. The professionals worked seamlessly together and delivered fantastic results for our marketing materials."</div>
                <div class="mt-4 text-xs text-gray-500">Services: Photo + Video | Corporate Event | February 2025</div>
            </div>
        </div>
        <div class="text-center mt-8">
            <a href="testimonials.jsp" class="text-indigo-600 hover:underline font-semibold">View More Testimonials <i class="bi bi-arrow-right"></i></a>
        </div>
    </div>
</section>

<!-- FAQ Section -->
<section id="faq" class="py-20 bg-gradient-to-t from-gray-100 to-white">
    <div class="container mx-auto px-4">
        <h2 class="text-3xl md:text-4xl font-bold mb-8 text-center text-indigo-700">Frequently Asked Questions</h2>
        <div class="max-w-3xl mx-auto space-y-6">
            <details class="bg-white rounded-xl shadow p-5 group" open>
                <summary class="flex items-center cursor-pointer text-lg font-semibold text-indigo-700 group-hover:underline">
                    <i class="bi bi-question-circle mr-2"></i>
                    What's the difference between booking a photographer and a videographer?
                    <i class="bi bi-chevron-down faq-arrow ml-auto text-indigo-500"></i>
                </summary>
                <div class="mt-2 text-gray-700">
                    <p>Photographers capture still images that freeze specific moments in time, providing high-quality photographs you can print and frame. Videographers record moving footage that captures the sounds, movements, and atmosphere of your event. Many clients choose both services to get the complete documentation of their event—photos for displaying and sharing specific moments, and video for reliving the experience with sound and motion.</p>
                </div>
            </details>
            
            <details class="bg-white rounded-xl shadow p-5 group">
                <summary class="flex items-center cursor-pointer text-lg font-semibold text-indigo-700 group-hover:underline">
                    <i class="bi bi-credit-card mr-2"></i>
                    Is it more cost-effective to book both services through Eventify?
                    <i class="bi bi-chevron-down faq-arrow ml-auto text-indigo-500"></i>
                </summary>
                <div class="mt-2 text-gray-700">
                    <p>Yes! Our combo packages offer significant savings compared to booking photography and videography separately. Additionally, professionals who work together often create better results as they can coordinate their coverage strategies. Check out our "Ultimate Combo" package for our most popular photo+video option.</p>
                </div>
            </details>
            
            <details class="bg-white rounded-xl shadow p-5 group">
                <summary class="flex items-center cursor-pointer text-lg font-semibold text-indigo-700 group-hover:underline">
                    <i class="bi bi-person-badge mr-2"></i>
                    How do you select your photographers and videographers?
                    <i class="bi bi-chevron-down faq-arrow ml-auto text-indigo-500"></i>
                </summary>
                <div class="mt-2 text-gray-700">
                    <p>All professionals on our platform go through a rigorous vetting process. We verify their experience, review their portfolio quality, check their references, and ensure they have the proper equipment and backup systems. Only about 20% of applicants are accepted to maintain our high-quality standards.</p>
                </div>
            </details>
            
            <details class="bg-white rounded-xl shadow p-5 group">
                <summary class="flex items-center cursor-pointer text-lg font-semibold text-indigo-700 group-hover:underline">
                    <i class="bi bi-clock-history mr-2"></i>
                    What happens if I need to reschedule or cancel my booking?
                    <i class="bi bi-chevron-down faq-arrow ml-auto text-indigo-500"></i>
                </summary>
                <div class="mt-2 text-gray-700">
                    <p>You can reschedule or cancel your booking through your Eventify account. Our policy allows free rescheduling up to 30 days before your event. Cancellations made more than 30 days in advance receive a full refund minus a small processing fee. For changes with less notice, please refer to our detailed cancellation policy or contact our customer service team.</p>
                </div>
            </details>
            
            <details class="bg-white rounded-xl shadow p-5 group">
                <summary class="flex items-center cursor-pointer text-lg font-semibold text-indigo-700 group-hover:underline">
                    <i class="bi bi-file-earmark mr-2"></i>
                    How and when will I receive my photos and videos?
                    <i class="bi bi-chevron-down faq-arrow ml-auto text-indigo-500"></i>
                </summary>
                <div class="mt-2 text-gray-700">
                    <p>For photography, you'll typically receive a preview selection within 3-5 days after your event, with the complete edited gallery delivered within 2-3 weeks. For videography, highlight reels are usually delivered within 3-4 weeks, while full-length videos may take 4-6 weeks depending on complexity. All files are delivered through our secure digital platform, where you can download, share, and even order prints directly.</p>
                </div>
            </details>
            
            <details class="bg-white rounded-xl shadow p-5 group">
                <summary class="flex items-center cursor-pointer text-lg font-semibold text-indigo-700 group-hover:underline">
                    <i class="bi bi-camera-reels mr-2"></i>
                    Can I request specific shots or editing styles?
                    <i class="bi bi-chevron-down faq-arrow ml-auto text-indigo-500"></i>
                </summary>
                <div class="mt-2 text-gray-700">
                    <p>Absolutely! After booking, you'll have access to our planning tools where you can create shot lists, share inspiration, and communicate your style preferences. You can specify whether you prefer candid documentary-style coverage or more posed formal shots. For videography, you can indicate music preferences and highlight what aspects of your event are most important to feature.</p>
                </div>
            </details>
            
            <details class="bg-white rounded-xl shadow p-5 group">
                <summary class="flex items-center cursor-pointer text-lg font-semibold text-indigo-700 group-hover:underline">
                    <i class="bi bi-gear mr-2"></i>
                    What equipment do your professionals use?
                    <i class="bi bi-chevron-down faq-arrow ml-auto text-indigo-500"></i>
                </summary>
                <div class="mt-2 text-gray-700">
                    <p>Our professionals use high-end professional equipment including full-frame DSLR and mirrorless cameras, professional lenses, lighting equipment, stabilizers, and drones (where permitted). All professionals carry backup equipment to ensure your event is captured without technical issues. You can view specific equipment details on each provider's profile page.</p>
                </div>
            </details>
        </div>
    </div>
</section>

<!-- Contact Us Section -->
<section id="contact" class="py-20 bg-gradient-to-b from-gray-100 to-white">
    <div class="container mx-auto px-4">
        <div class="max-w-2xl mx-auto bg-white rounded-2xl shadow-lg p-8">
            <h2 class="text-3xl font-extrabold text-indigo-700 mb-3 text-center">Contact Us</h2>
            <p class="text-gray-600 text-lg mb-6 text-center">Have questions about our photography or videography services? Need help planning your event coverage? We're here to assist you!</p>
            <form id="contactForm" onsubmit="handleContactSubmit(event)" class="space-y-5">
                <div>
                    <label for="name" class="block text-gray-700 mb-1 font-semibold">Your Name</label>
                    <input type="text" id="name" name="name" required autocomplete="name"
                           class="w-full border border-indigo-200 px-3 py-2 rounded focus:border-indigo-500 bg-indigo-50 focus:bg-white transition"/>
                </div>
                <div>
                    <label for="email" class="block text-gray-700 mb-1 font-semibold">Your Email</label>
                    <input type="email" id="email" name="email" required autocomplete="email"
                           class="w-full border border-indigo-200 px-3 py-2 rounded focus:border-indigo-500 bg-indigo-50 focus:bg-white transition"/>
                </div>
                <div>
                    <label for="service" class="block text-gray-700 mb-1 font-semibold">Service Interest</label>
                    <select id="service" name="service" class="w-full border border-indigo-200 px-3 py-2 rounded focus:border-indigo-500 bg-indigo-50 focus:bg-white transition">
                        <option value="photography">Photography</option>
                        <option value="videography">Videography</option>
                        <option value="both" selected>Both Photography & Videography</option>
                        <option value="other">Other Inquiry</option>
                    </select>
                </div>
                <div>
                    <label for="message" class="block text-gray-700 mb-1 font-semibold">Message</label>
                    <textarea id="message" name="message" rows="4" required
                              class="w-full border border-indigo-200 px-3 py-2 rounded focus:border-indigo-500 bg-indigo-50 focus:bg-white transition" placeholder="Tell us about your event or inquiry..."></textarea>
                </div>
                <button type="submit"
                        class="bg-gradient-to-r from-indigo-600 to-fuchsia-500 w-full py-2 rounded-full font-semibold shadow transition text-lg text-white hover:scale-105 active:scale-95 flex items-center justify-center gap-2">
                    <i class="bi bi-send"></i> Send Message
                </button>
                <p id="contactFeedback" class="text-green-600 text-center mt-2 hidden">
                    <i class="bi bi-check-circle-fill mr-2"></i>
                    Thank you for your message! We'll get in touch soon.
                </p>
            </form>
            <div class="mt-8 text-center">
                <div class="mb-2 text-gray-700 font-semibold">Or reach us via:</div>
                <div class="flex justify-center gap-4">
                    <a href="mailto:support@eventify.com" class="hover:text-indigo-700" aria-label="Email"><i class="bi bi-envelope-fill text-2xl"></i></a>
                    <a href="tel:+94771234567" class="hover:text-indigo-700" aria-label="Phone"><i class="bi bi-telephone-fill text-2xl"></i></a>
                    <a href="#" class="hover:text-indigo-700" aria-label="Facebook"><i class="bi bi-facebook text-2xl"></i></a>
                    <a href="#" class="hover:text-fuchsia-600" aria-label="Instagram"><i class="bi bi-instagram text-2xl"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 text-gray-300 py-10">
    <div class="container mx-auto px-4">
        <div class="grid md:grid-cols-4 gap-8 mb-8">
            <div>
                <h3 class="text-xl font-bold mb-4 text-white">Eventify</h3>
                <p class="mb-4">Your trusted platform for booking professional photography and videography services for any occasion.</p>
                <div class="flex space-x-4">
                    <a href="#" class="text-gray-300 hover:text-white"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="text-gray-300 hover:text-white"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="text-gray-300 hover:text-white"><i class="bi bi-twitter-x"></i></a>
                    <a href="#" class="text-gray-300 hover:text-white"><i class="bi bi-youtube"></i></a>
                </div>
            </div>
            <div>
                <h4 class="font-semibold mb-4 text-white">Services</h4>
                <ul class="space-y-2">
                    <li><a href="photography.jsp" class="text-gray-400 hover:text-white">Photography