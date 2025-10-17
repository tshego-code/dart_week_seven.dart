Send Money Flutter App
Overview

This Flutter application demonstrates the implementation of interactive UI elements, form validation, custom reusable widgets, and animations. It is designed as a simple "Send Money" page that can be used in a banking or financial app.

Key features include:

Input fields for recipient name and amount.

Dropdown menu for selecting payment method.

Switch to mark transactions as favorite.

Form validation with error messages for invalid inputs.

Reusable custom button for sending money.

Animated success message upon transaction completion.

Custom page transitions from login to send money page.

Features
1. Interactive Widgets

TextFields for entering recipient name and amount.

DropdownButton to select payment method.

Switch for marking a transaction as favorite.

2. Form Validation

Recipient name cannot be empty.

Amount must be a positive number.

Payment method must be selected.

Displays error messages when validation fails.

3. Custom Widgets

SendMoneyButton is a reusable button widget for consistent UI across screens.

Ensures consistent styling for colors, fonts, and spacing.

4. Animations

AnimatedOpacity for smooth success message transitions.

Custom page transitions between login and send money pages using PageRouteBuilder.

File Structure

main.dart – Main application file containing all pages and widgets.

LoginPage – Simple login page with navigation to Send Money page.

SendMoneyPage – Main page with form, validation, and animations.

SendMoneyButton – Reusable custom button widget.

How to Run

Ensure you have Flutter installed and your development environment set up.

Copy the main.dart file into your Flutter project lib folder.

Run the app using:

flutter pub get
flutter run


On the login page, press the Login button to navigate to the Send Money page.

Fill in the form and press Send Money to see the validation and animated success message.

Screenshots

(Optional: Add screenshots here showing the login page, form, and success animation.)

Author

Tshegofatso Moloto

Email: tshegofatsomoloto72@gmail.com

Location: Kagiso Extension 12, South Africa

This README explains the project clearly, highlights key features, and guides someone to run and test the app easily.
