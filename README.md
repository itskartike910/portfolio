# Portfolio

Welcome to my personal portfolio app! This project showcases my skills, projects, and contact information in a responsive and interactive manner. 

## Live Demo

Check out the live version of the app [here](https://portfolio-kk09.netlify.app/).

## Features

- **Responsive Design**: Works seamlessly on desktop and mobile devices.
- **Contact Form**: Allows users to send messages directly through the app.
- **Social Media Integration**: Quick links to social media profiles.

## Technologies Used

- **Flutter**: The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Dart**: The programming language used with Flutter.
- **Mailer**: A Dart package for sending emails.

## Getting Started

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter.

### Installation

1. **Clone the repository**:

    ```bash
    git clone https://github.com/yourusername/portfolio-app.git
    cd portfolio-app
    ```

2. **Install dependencies**:

    ```bash
    flutter pub get
    ```

3. **Run the app**:

    ```bash
    flutter run
    ```

## Configuration

### Email Setup

To enable the contact form functionality, you need to set up the SMTP server configuration in your Dart code.

1. **SMTP Configuration**:
   Update the `sendEmail` function in `contact_me.dart` with your email and app-specific password.

    ```dart
    final String username = 'your_email@gmail.com'; // Your email
    final String password = 'your_app_password'; // Your email App Password
    ```

2. **Google Account Setup**:
   - Enable 2FA on your Google account.
   - Generate an App Password for the email account.

## Deployment

### Netlify

1. **Create a Netlify Account**: [Netlify Signup](https://www.netlify.com/)
2. **New Site from Git**:
   - Connect your GitHub repository.
   - Select the `main` branch.
3. **Build Settings**:
   - Build Command: `flutter build web`
   - Publish Directory: `build/web`

### Flutter Web Build

To deploy the Flutter web app:

1. **Build the app**:

    ```bash
    flutter build web
    ```

2. **Deploy to Netlify**:
   - Drag and drop the `build/web` folder into Netlify.

## Usage

### Contact Form

Users can fill out the contact form to send messages directly to your email. Ensure your SMTP settings are correctly configured as mentioned above.

### Social Media Links

Quick links to your social media profiles are available for easy access. Update the URLs in `contact_me.dart` to point to your profiles.

## Contributing

Feel free to submit issues and enhancement requests.

1. Fork the repository.
2. Create your feature branch: `git checkout -b feature/YourFeature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/YourFeature`
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Flutter](https://flutter.dev/)
- [Netlify](https://www.netlify.com/)
- [Google Fonts](https://fonts.google.com/)
- [Mailer](https://pub.dev/packages/mailer)
