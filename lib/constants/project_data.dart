class ProjectData {
  final String title;
  final String description;
  final String detailedDescription;
  final List<String> keyFeatures;
  final List<String> technologies;
  final String? githubUrl;
  final String? projectUrl;
  final String? imageUrl;
  final bool webAvailable;
  final bool androidAvailable;
  final String category;
  final String duration;

  ProjectData({
    required this.title,
    required this.description,
    required this.detailedDescription,
    required this.keyFeatures,
    required this.technologies,
    this.githubUrl,
    this.projectUrl,
    this.imageUrl,
    this.webAvailable = false,
    this.androidAvailable = false,
    required this.category,
    required this.duration,
  });
}

// All Projects Data
final List<ProjectData> allProjects = [
  // AI & Web Automation (Most Recent)
  ProjectData(
    title: "AI Web Automation Agent (Browser Extension)",
    category: "AI & Automation",
    duration: "Aug 2025 - Oct 2025",
    description:
        "An intelligent universal Chromium extension that automates web tasks using advanced multi-agent AI system with natural language processing.",
    detailedDescription:
        "An advanced AI-powered browser extension that executes autonomous web workflows from natural language tasks. Built as a universal Chromium extension supporting Chrome, Edge, Brave, and all Chromium-based browsers including Wootzapp Browser for Android. Features a sophisticated multi-agent AI system with Task Router, Planner, Navigator, and Validator agents. Enables social media automation, e-commerce shopping, content discovery, and general web navigation with real-time task tracking and chat interface.",
    technologies: [
      "React",
      "JavaScript",
      "Chrome Extension APIs",
      "Chromium APIs",
      "Gemini AI",
      "Claude",
      "OpenAI",
      "DOM Analysis",
      "Webpack",
      "API Integration",
      "Web Development"
    ],
    keyFeatures: [
      "Multi-Agent AI System: Task Router, Planner, Navigator, and Validator agents",
      "Universal Chromium Compatibility: Works on Chrome, Edge, Brave, Opera, Vivaldi, and Wootzapp Browser",
      "Interactive Sidebar Interface: Real-time task execution and chat with AI agents",
      "Social Media Automation: Automated posting on X/Twitter, LinkedIn, Facebook",
      "E-commerce Automation: Product search, cart management, order placement",
      "Content Discovery: YouTube search, research tasks, web navigation",
      "Smart DOM Analysis: Advanced element targeting using buildDomTree engine",
      "Chat History & Persistent Storage: Full conversation management",
      "Task Status Tracking: Real-time progress updates and execution monitoring",
      "Mobile Optimized: Touch-friendly interface for desktop and mobile browsers",
      "Multi-LLM Support: Gemini, Claude, and OpenAI integration",
    ],
    githubUrl: "https://github.com/itskartike910/ai-chatting-agent",
    projectUrl: "https://github.com/itskartike910/ai-chatting-agent",
    webAvailable: true,
    androidAvailable: true,
  ),

  // Machine Learning Projects
  ProjectData(
    title: "Few-Shot Skin Cancer Classification",
    category: "Machine Learning",
    duration: "Oct 2024 - Dec 2024",
    description:
        "A Deep Learning Model for the classification of various skin cancer and diseases using few-shot learning techniques.",
    detailedDescription:
        "Developed an advanced deep learning model for skin cancer classification using PyTorch, DeepBDC, ResNet architectures, and ImageNet. The project focuses on few-shot learning with HAM10000 dataset, enabling accurate predictions with minimal labeled data. Implemented Prototypical Learning setup and Mutual Centralized Learning for enhanced performance.",
    technologies: [
      "Python",
      "Deep Learning",
      "FewShot Learning",
      "PyTorch",
      "DeepBDC",
      "ResNet",
      "ImageNet",
      "HAM10000"
    ],
    keyFeatures: [
      "Implemented an AI Model for Skin Cancer Classification",
      "Utilized ResNet architectures and ImageNet transfer learning",
      "Prototypical Learning setup with Mutual Contrastive Learning",
      "Achieved high accuracy with minimal labeled training data",
      "Comprehensive dataset handling with HAM10000",
    ],
    githubUrl: "https://github.com/itskartike910/DeepBDC_MCL",
    webAvailable: false,
    androidAvailable: false,
  ),

  ProjectData(
    title: "Handwritten Digit Recognizer",
    category: "Machine Learning",
    duration: "May 2023 - July 2023",
    description:
        "A machine learning model to recognize handwritten digits and numbers with high accuracy.",
    detailedDescription:
        "Built a robust machine learning model using Python and popular ML libraries to recognize handwritten digits from the MNIST dataset. The model achieves high accuracy through careful preprocessing, feature engineering, and neural network architecture design.",
    technologies: [
      "Python",
      "TensorFlow",
      "Keras",
      "NumPy",
      "Pandas",
      "Matplotlib",
      "Jupyter Notebook"
    ],
    keyFeatures: [
      "High accuracy digit recognition using MNIST dataset",
      "Neural network implementation with multiple layers",
      "Real-time digit prediction capabilities",
      "Data preprocessing and augmentation techniques",
      "Visualization of training progress and results",
    ],
    githubUrl: "https://github.com/itskartike910/Handwritten_digit_recogniser",
    webAvailable: false,
    androidAvailable: false,
  ),

  // Mobile Application Projects
  ProjectData(
    title: "ChatApp (ChatBox)",
    category: "Mobile Development",
    duration: "Nov 2023 - Jan 2024",
    description:
        "A real-time chat application built with Flutter and Firebase, enhanced with AI-powered conversational features.",
    detailedDescription:
        "ChatBox is a feature-rich, real-time chat application built using Flutter and Firebase with integrated AI chat capabilities. In addition to seamless real-time messaging, the application allows users to interact with an AI assistant inside chat conversations using external AI APIs. The app provides a smooth and intuitive messaging experience with real-time updates, secure authentication, AI-generated responses, and comprehensive chat management features. It demonstrates advanced Flutter concepts including state management, Firebase integration, real-time data synchronization, and API-based AI integration.",
    technologies: [
      "Flutter",
      "Dart",
      "Firebase",
      "Cloud Firestore",
      "Firebase Auth",
      "REST APIs",
      "VS Code"
    ],
    keyFeatures: [
      "User Authentication: Secure sign up and log in using email and password",
      "Real-time Messaging: Send and receive messages instantly with timestamps",
      "AI Chat Integration: Interact with an AI assistant to generate smart responses within chats",
      "Delete Messages: Remove messages from both sender and receiver ends",
      "User Profile: View and update profile information",
      "Search Users: Find and connect with other users easily",
      "Push Notifications: Get notified of new messages",
      "Online Status: See when users are active",
    ],
    githubUrl: "https://github.com/itskartike910/chat_app",
    projectUrl: "https://github.com/itskartike910/chat_app/releases",
    webAvailable: false,
    androidAvailable: true,
  ),

  // ProjectData(
  //   title: "Food Track",
  //   category: "Mobile Development",
  //   duration: "2024",
  //   description: "A comprehensive food delivery Flutter application with modern UI and complete ordering system.",
  //   detailedDescription: "Food Track is a full-featured food delivery application developed with Flutter. It provides users with a seamless experience to browse restaurants, order food, track deliveries, and manage their orders. The app features a modern, intuitive interface with smooth animations and comprehensive functionality for both users and restaurants.",
  //   technologies: ["Flutter", "Dart", "Firebase", "Google Maps API", "Payment Gateway", "State Management"],
  //   keyFeatures: [
  //     "Restaurant browsing with filters and search",
  //     "Real-time order tracking with map integration",
  //     "Secure payment processing",
  //     "User profile and order history",
  //     "Restaurant ratings and reviews",
  //     "Push notifications for order updates",
  //     "Cart management with multiple items",
  //     "Address management and delivery scheduling",
  //   ],
  //   githubUrl: "https://github.com/itskartike910/foodtrack",
  //   projectUrl: "https://github.com/itskartike910/foodtrack/releases",
  //   webAvailable: false,
  //   androidAvailable: true,
  // ),

  ProjectData(
    title: "QR Code Scanner & Generator",
    category: "Mobile Development",
    duration: "Sept 2023",
    description:
        "A Flutter application for scanning QR codes and generating custom QR codes for digital information exchange.",
    detailedDescription:
        "A feature-rich Android application built with Flutter that enables users to scan QR codes and generate custom QR codes from text or links. The app provides a seamless experience for digital information exchange, making it easy to share and access data through QR codes.",
    technologies: [
      "Flutter",
      "Dart",
      "QR Code Scanner Plugin",
      "Android Studio",
      "VS Code"
    ],
    keyFeatures: [
      "Scan QR Code: Instantly scan and decode QR codes",
      "Generate QR Code: Create QR codes from text or links",
      "Copy to Clipboard: Quick copy functionality for scanned data",
      "Share QR Code: Share generated QR codes with others",
      "History: Save and manage scanned codes",
      "Custom styling for generated QR codes",
    ],
    githubUrl: "https://github.com/itskartike910/qr_code_sg",
    projectUrl: "https://github.com/itskartike910/qr_code_sg/releases",
    webAvailable: false,
    androidAvailable: true,
  ),

  ProjectData(
    title: "Helping Hand (AlertUs)",
    category: "Mobile Development",
    duration: "July 2023",
    description:
        "A community emergency alert app enabling neighbors to request and offer help during emergencies.",
    detailedDescription:
        "Helping Hand (AlertUs) is a community-focused mobile application designed to connect neighbors during emergencies. Built for the ByteVerse Hackathon, this app allows users to quickly alert their community when they need help and enables neighbors to respond swiftly. It's designed to create safer, more connected communities through technology.",
    technologies: [
      "Flutter",
      "Dart",
      "Firebase",
      "Cloud Messaging",
      "Geolocation"
    ],
    keyFeatures: [
      "Emergency alert system with one-tap SOS",
      "Real-time notifications to nearby community members",
      "Location sharing during emergencies",
      "Community chat and coordination",
      "User verification and safety features",
      "Emergency contact management",
      "History of past alerts and responses",
    ],
    githubUrl: "https://github.com/itskartike910/Helping_hand",
    projectUrl: "https://github.com/itskartike910/Helping_hand",
    webAvailable: false,
    androidAvailable: true,
  ),

  // Game Development
  ProjectData(

    title: "Tic Tac Toe",
    category: "Game Development",
    duration: "March 2024",
    description:
        "A fun and interactive Tic Tac Toe game with AI opponent using MinMax algorithm.",
    detailedDescription:
        "An engaging implementation of the classic Tic Tac Toe game built with Flutter. The game features both multiplayer and single-player modes, where players can challenge friends or test their skills against an AI opponent powered by the MinMax algorithm. The app includes a beautiful, responsive UI and comprehensive game management features.",
    technologies: [
      "Flutter",
      "Dart",
      "MinMax Algorithm",
      "Game AI",
      "State Management"
    ],
    keyFeatures: [
      "Play with a Friend: Challenge friends in local multiplayer mode",
      "Play with Computer: AI opponent using MinMax algorithm",
      "Scoreboard: Track wins, losses, and draws",
      "Reset Game: Start fresh games instantly",
      "Smooth animations and sound effects",
      "Responsive design for all screen sizes",
      "Game history and statistics",
    ],
    githubUrl: "https://github.com/itskartike910/tic_tac_toe",
    projectUrl: "https://github.com/itskartike910/tic_tac_toe/releases",
    webAvailable: false,
    androidAvailable: true,
  ),

  // Web Development
  ProjectData(
    title: "Portfolio Web",
    category: "Web Development",
    duration: "Jan 2024",
    description:
        "A modern, animated portfolio website built with Flutter Web showcasing projects and skills.",
    detailedDescription:
        "A stunning, fully responsive portfolio website built using Flutter Web and hosted on GitHub Pages and Netlify. The website features modern design principles, smooth animations, and an intuitive user interface. It serves as a comprehensive showcase of my projects, skills, experience, and achievements with interactive elements and beautiful visual effects.",
    technologies: [
      "Flutter Web",
      "Dart",
      "GitHub Pages",
      "Responsive Design",
      "Animations"
    ],
    keyFeatures: [
      "Fully Responsive Design: Works seamlessly on all devices",
      "Modern Dark Theme: Eye-friendly dark mode interface",
      "Smooth Animations: Elegant transitions and micro-interactions",
      "Project Showcase: Detailed project cards with expandable information",
      "Contact Form: Integrated contact functionality",
      "Social Links: Direct access to professional profiles",
      "Performance Optimized: Fast loading and smooth navigation",
    ],
    githubUrl: "https://github.com/itskartike910/portfolio",
    projectUrl: "https://portfolio-kk09.netlify.app/",
    webAvailable: true,
    androidAvailable: false,
  ),

  ProjectData(
    title: "Currency Converter",
    category: "Web Development",
    duration: "Nov 2024",
    description:
        "A web-based currency converter application with real-time exchange rates and modern UI.",
    detailedDescription:
        "A practical and user-friendly currency converter web application built with modern web technologies. The app provides real-time currency conversion with up-to-date exchange rates, supporting multiple currencies from around the world. Features a clean, intuitive interface with responsive design for optimal use on any device.",
    technologies: [
      "JavaScript",
      "HTML",
      "CSS",
      "API Integration",
      "Responsive Design"
    ],
    keyFeatures: [
      "Real-time currency conversion with live exchange rates",
      "Support for 150+ global currencies",
      "Clean and intuitive user interface",
      "Responsive design for mobile and desktop",
      "Exchange rate history and trends",
      "Favorite currency pairs for quick access",
      "Offline mode with cached rates",
    ],
    githubUrl: "https://github.com/itskartike910/CurrencyConvertor",
    projectUrl: "https://itskartike910.github.io/CurrencyConvertor/",
    webAvailable: true,
    androidAvailable: false,
  ),

  // Utility Apps
  ProjectData(
    title: "Multipurpose Calculator",
    category: "Utility",
    duration: "March 2023",
    description:
        "A comprehensive calculator app with multiple calculator types including scientific, BMI, and discount calculators.",
    detailedDescription:
        "An all-in-one calculator application built with Java and XML for Android. This multipurpose app includes five different calculator types to meet various calculation needs: Normal Calculator for everyday math, Numeral System Calculator for base conversions, Discount Calculator for shopping, BMI Calculator for health tracking, and Scientific Calculator for complex mathematical operations.",
    technologies: ["Java", "XML", "Android Studio", "Material Design"],
    keyFeatures: [
      "Normal Calculator: Basic arithmetic operations",
      "Numeral System Calculator: Convert between decimal, binary, octal, and hex",
      "Discount Calculator: Calculate discounts and final prices",
      "BMI Calculator: Track body mass index and health metrics",
      "Scientific Calculator: Advanced mathematical functions",
      "Clean Material Design interface",
      "History and memory functions",
    ],
    githubUrl: "https://github.com/itskartike910/Calculator",
    projectUrl: "https://github.com/itskartike910/Calculator",
    webAvailable: false,
    androidAvailable: true,
  ),
];

// Categories for filtering
final List<String> projectCategories = [
  "All",
  "AI & Automation",
  "Machine Learning",
  "Mobile Development",
  "Web Development",
  "Game Development",
  "Utility",
];

