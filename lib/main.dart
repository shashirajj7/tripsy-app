import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/forgot-password': (context) => ForgotPasswordPage(),
        '/signup': (context) => SignupPage(), // Added SignupPage route
      },
    );
  }
}

// LoginPage

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    // Gmail validation regex
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    // Password validation regex: At least 8 characters and one symbol
    final passwordRegex = RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');

    if (!emailRegex.hasMatch(username)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid Gmail address!')),
      );
      return;
    }

    if (!passwordRegex.hasMatch(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Password must be at least 8 characters long and include at least one symbol!'),
        ),
      );
      return;
    }

    // Simulate successful login
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 93, 113, 142), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          // Added to prevent overflow on smaller screens
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80), // Added spacing for better layout
              const Text(
                'TRIPSYY',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive',
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Find Your Escape !!!',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 40),
              const Icon(
                Icons.person,
                size: 60,
                color: Colors.black,
              ),
              const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Username or email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => login(context),
                style: ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/forgot-password');
                },
                child: const Text(
                  'Forgot Your Password? Click here',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Divider(
                color: Colors.grey[400],
                thickness: 1,
                indent: 50,
                endIndent: 50,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// SignupPage

class SignupPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signup(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Gmail validation regex
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
    // Password validation regex: At least 8 characters and one symbol
    final passwordRegex = RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');

    if (!emailRegex.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid Gmail address!')),
      );
      return;
    }

    if (!passwordRegex.hasMatch(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Password must be at least 8 characters long and include at least one symbol!'),
        ),
      );
      return;
    }

    // Simulate successful signup
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: const Color.fromARGB(255, 93, 113, 142),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 93, 113, 142), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          // Prevents overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Icon(
                Icons.person_add,
                size: 60,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              const Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => signup(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 93, 113, 142),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Navigate back to LoginPage
                },
                child: const Text(
                  'Already have an account? Login',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// ForgotPasswordPage

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  void resetPassword(BuildContext context) {
    if (emailController.text.isNotEmpty) {
      // You can add email format validation here if needed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset link sent to email!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Enter your email to reset your password:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => resetPassword(context),
              child: const Text('Send Reset Link'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 93, 113, 142),
                padding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRIPSYY'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade700, Colors.purple.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field with rounded corners
            _buildSearchField(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildOptionCard(
                    context,
                    'Top Destinations',
                    'Explore popular tourist spots around the globe.',
                    Icons.place,
                    Colors.blue,
                    TopDestinationsPage(),
                  ),
                  _buildOptionCard(
                    context,
                    'Tourist Places',
                    'Discover, Explore, and Experience the World – Your Next Adventure Awaits.',
                    Icons.beach_access,
                    Colors.pink,
                    TouristSpots(),
                  ),
                  _buildOptionCard(
                    context,
                    'Holiday Packages',
                    'Exciting holiday deals and bundles.',
                    Icons.card_travel,
                    Colors.green,
                    HolidayPackagesPage(),
                  ),
                  _buildOptionCard(
                    context,
                    'Special Packages',
                    'Exclusive and limited-time offers.',
                    Icons.star,
                    Colors.amber,
                    SpecialPackagesPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality for FAB (e.g., quick action)
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }

  // Search Field with rounded corners
  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(76, 128, 128, 128), // 30% transparency
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          prefixIcon: Icon(Icons.search, color: Colors.blue),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  // Function to build option cards
  Widget _buildOptionCard(
      BuildContext context,
      String title,
      String subtitle,
      IconData icon,
      Color color,
      Widget page,
      ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(51, 128, 128, 128), // 20% transparency
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.zero,
        child: ListTile(
          leading: Icon(icon, color: color, size: 40),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 14),
          ),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
        ),
      ),
    );
  }
}

// Add the other destination pages (TopDestinationsPage, HoneymoonSpotsPage, etc.) as defined earlier
class TopDestinationsPage extends StatelessWidget {
  final List<String> destinations = [
    'Paris, France',
    'Tokyo, Japan',
    'New York City, USA',
    'Sydney, Australia',
    'Cape Town, South Africa',
    'London, England',
    'Bangkok, Thailand',
    'Berlin, Germany',
    'Miami, USA',
    'Rome, Italy',
    'Cairo, USA',
    'Los Angeles, USA',
    'Istanbul, Turkey',
    'Dubai, United Arab Emirates',
    'Mexico City, Mexico',
    'Beijing, China',
    'India, Hyderabad',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Destinations')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(destinations[index],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              leading: const Icon(Icons.location_pin, color: Colors.blue),
              trailing: const Icon(Icons.flight_takeoff),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FlightSelectionPage(destination: destinations[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class FlightSelectionPage extends StatelessWidget {
  final String destination;
  final List<Map<String, dynamic>> flights = [
    {'time': '9:00 AM', 'price': 370},
    {'time': '2:00 PM', 'price': 350},
    {'time': '6:00 PM', 'price': 400},
  ];

  FlightSelectionPage({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Flight to $destination'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: flights.length,
        itemBuilder: (context, index) {
          final flight = flights[index];
          return Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text('Flight at ${flight['time']}'),
              subtitle: Text('Base Price: \$${flight['price']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlightBookingPage(
                        destination: destination,
                        flightTime: flight['time'],
                        basePrice: flight['price'],
                      ),
                    ),
                  );
                },
                child: const Text('Select'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FlightBookingPage extends StatefulWidget {
  final String destination;
  final String flightTime;
  final double basePrice;

  FlightBookingPage(
      {required this.destination,
        required this.flightTime,
        required this.basePrice});

  @override
  _FlightBookingPageState createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightBookingPage> {
  String? selectedClass;
  int adults = 1;
  int children = 0;

  final Map<String, double> classMultipliers = {
    'Business Class': 2.5,
    'Premium Class': 1.8,
    'Economy Class': 1.0,
  };

  void confirmBooking(BuildContext context) {
    if (selectedClass == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a class!')),
      );
      return;
    }
    final classPriceMultiplier = classMultipliers[selectedClass]!;
    final totalPrice =
        (widget.basePrice * classPriceMultiplier) * (adults + (children * 0.5));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentConfirmationPage(
          destination: widget.destination,
          flightTime: widget.flightTime,
          totalPrice: totalPrice,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Flight to ${widget.destination}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flight Time: ${widget.flightTime}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text(
              'Select Class:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedClass,
              hint: const Text('Select a class'),
              items: classMultipliers.keys.map((className) {
                return DropdownMenuItem(
                  value: className,
                  child: Text(
                      '$className (\$${(widget.basePrice * classMultipliers[className]!).toStringAsFixed(2)})'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedClass = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Number of Travelers:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Adults: '),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (adults > 1) adults--;
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$adults'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          adults++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Children: '),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (children > 0) children--;
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$children'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          children++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => confirmBooking(context),
                child: const Text('Confirm Booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentConfirmationPage extends StatefulWidget {
  final String destination;
  final String flightTime;
  final double totalPrice;

  PaymentConfirmationPage({
    required this.destination,
    required this.flightTime,
    required this.totalPrice,
  });

  @override
  _PaymentConfirmationPageState createState() =>
      _PaymentConfirmationPageState();
}

class _PaymentConfirmationPageState extends State<PaymentConfirmationPage> {
  String? selectedPaymentMethod;
  final List<String> paymentOptions = [
    'Google Pay',
    'PhonePe',
    'Paytm',
    'Credit/Debit Card',
  ];

  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController paymentNoteController = TextEditingController();

  // Card Payment Controllers
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardExpiryController = TextEditingController();
  final TextEditingController cardCVVController = TextEditingController();
  final TextEditingController cardHolderNameController =
  TextEditingController();

  void confirmPayment() {
    if (selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a payment method!')),
      );
      return;
    }

    if (selectedPaymentMethod == 'Credit/Debit Card') {
      // Validate card payment fields
      if (cardNumberController.text.isEmpty ||
          cardNumberController.text.length != 16) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please enter a valid 16-digit card number!')),
        );
        return;
      }
      if (cardExpiryController.text.isEmpty ||
          !RegExp(r"^(0[1-9]|1[0-2])\/\d{2}$")
              .hasMatch(cardExpiryController.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please enter a valid expiry date (MM/YY)!')),
        );
        return;
      }
      if (cardCVVController.text.isEmpty ||
          cardCVVController.text.length != 3) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid 3-digit CVV!')),
        );
        return;
      }
      if (cardHolderNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter the cardholder name!')),
        );
        return;
      }
    } else {
      // Validate mobile payment fields
      if (mobileNumberController.text.isEmpty ||
          mobileNumberController.text.length != 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please enter a valid 10-digit mobile number!')),
        );
        return;
      }
    }

    // Navigate to a payment success page after confirmation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentSuccessPage(
          destination: widget.destination,
          totalPrice: widget.totalPrice,
          paymentMethod: selectedPaymentMethod!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Destination: ${widget.destination}',
                style: const TextStyle(fontSize: 18)),
            Text('Flight Time: ${widget.flightTime}',
                style: const TextStyle(fontSize: 18)),
            Text('Total Price: \$${widget.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...paymentOptions.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value;
                  });
                },
              );
            }).toList(),
            const SizedBox(height: 20),
            if (selectedPaymentMethod == 'Credit/Debit Card') ...[
              const Text(
                'Enter Card Details:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                maxLength: 16,
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: cardExpiryController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: 'Expiry Date (MM/YY)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: cardCVVController,
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      decoration: const InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: cardHolderNameController,
                decoration: const InputDecoration(
                  labelText: 'Cardholder Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ] else if (selectedPaymentMethod != null) ...[
              const Text(
                'Enter Mobile Number:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: mobileNumberController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Payment Note (Optional):',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: paymentNoteController,
                decoration: const InputDecoration(
                  labelText: 'Add a note for this payment',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: confirmPayment,
                child: const Text('Confirm Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentSuccessPage extends StatelessWidget {
  final String destination;
  final double totalPrice;
  final String paymentMethod;

  PaymentSuccessPage({
    required this.destination,
    required this.totalPrice,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Successful'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100,
              ),
              const SizedBox(height: 20),
              Text(
                'Payment Successful!',
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Destination: $destination',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Amount Paid: \$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'Payment Method: $paymentMethod',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TouristSpots extends StatelessWidget {
  final List<String> spots = [
    'Maldives',
    'Santorini, Greece',
    'Bali, Indonesia',
    'Venice, Italy',
    'Maui, Hawaii',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Tourist Spots')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: spots.length,
        itemBuilder: (context, index) {
          return Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(spots[index],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              leading: const Icon(Icons.location_pin, color: Colors.blue),
              trailing: const Icon(Icons.flight_takeoff),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FlightSelectionPage(destination: spots[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class FlightSelection extends StatelessWidget {
  final String spots;
  final List<Map<String, dynamic>> flights = [
    {'times': '6:00 AM', 'price': 550}, // Updated timing
    {'times': '12:30 PM', 'price': 735}, // Updated timing
    {'times': '8:15 PM', 'price': 995}, // Updated timing
  ];

  FlightSelection({required this.spots});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Flight to $spots'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: flights.length,
        itemBuilder: (context, index) {
          final flight = flights[index];
          return Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text('Flight at ${flight['times']}'),
              subtitle: Text('Base Price: \$${flight['price']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlightBookingPage(
                        destination: spots,
                        flightTime: flight['times'],
                        basePrice: flight['price'],
                      ),
                    ),
                  );
                },
                child: const Text('Select'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FlightBooking extends StatefulWidget {
  final String spots;
  final String flightTime;
  final double basePrice;

  FlightBooking(
      {required this.spots, required this.flightTime, required this.basePrice});

  @override
  FlightBookingState createState() => FlightBookingState();
}

class FlightBookingState extends State<FlightBookingPage> {
  String? selectedClass;
  int adults = 1;
  int children = 0;

  final Map<String, double> classMultipliers = {
    'Business Class': 2.5,
    'Premium Class': 1.8,
    'Economy Class': 1.0,
  };

  void confirmBooking(BuildContext context) {
    if (selectedClass == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a class!')),
      );
      return;
    }
    final classPriceMultiplier = classMultipliers[selectedClass]!;
    final totalPrice =
        (widget.basePrice * classPriceMultiplier) * (adults + (children * 0.5));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentConfirmationPage(
          destination: widget.destination,
          flightTime: widget.flightTime,
          totalPrice: totalPrice,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Flight to ${widget.destination}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flight Time: ${widget.flightTime}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text(
              'Select Class:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedClass,
              hint: const Text('Select a class'),
              items: classMultipliers.keys.map((className) {
                return DropdownMenuItem(
                  value: className,
                  child: Text(
                      '$className (\$${(widget.basePrice * classMultipliers[className]!).toStringAsFixed(2)})'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedClass = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Number of Travelers:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Adults: '),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (adults > 1) adults--;
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$adults'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          adults++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Children: '),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (children > 0) children--;
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$children'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          children++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => confirmBooking(context),
                child: const Text('Confirm Booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// booking Confirmed

class PaymentConfirmation extends StatelessWidget {
  final String spots;
  final String flightTimes;
  final double totalPrice;

  PaymentConfirmation({
    required this.spots,
    required this.flightTimes,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Destination: $spots',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Flight Time: $flightTimes',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showBookingConfirmationDialog(context);
              },
              child: const Text('Confirm Payment'),
            ),
          ],
        ),
      ),
    );
  }

  // Custom method to show booking confirmation dialog
  void _showBookingConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
      false, // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.blue.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 50,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Booking Confirmed!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Your flight to $spots is successfully booked.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    Navigator.popUntil(context,
                        ModalRoute.withName('/home')); // Go back to home screen
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Go to Home'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HolidayPackagesPage extends StatelessWidget {
  final List<Map<String, dynamic>> packages = [
    {
      'name': 'European Tour',
      'discount': '10% Off',
      'places': [
        {
          'name': 'Paris',
          'info': 'The City of Light known for the Eiffel Tower and art.'
        },
        {
          'name': 'Rome',
          'info': 'The Eternal City with rich history and the Colosseum.'
        },
        {
          'name': 'Berlin',
          'info': 'Germany’s capital, famous for its history and nightlife.'
        },
        {
          'name': 'Amsterdam',
          'info': 'Known for canals, tulips, and the Anne Frank House.'
        },
      ],
      'context': 'A perfect blend of history, art, and modernity in Europe.'
    },
    {
      'name': 'Asian Heritage Trail',
      'discount': '15% Off',
      'places': [
        {
          'name': 'Tokyo',
          'info': 'A futuristic city blending tradition and technology.'
        },
        {
          'name': 'Beijing',
          'info': 'Home to the Great Wall and centuries-old culture.'
        },
        {
          'name': 'Bangkok',
          'info': 'A vibrant city famous for its temples and street food.'
        },
        {
          'name': 'Delhi',
          'info': 'India’s capital with a mix of ancient and modern landmarks.'
        },
      ],
      'context':
      'Discover the rich cultural heritage and vibrant cities of Asia.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Holiday Packages')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          return Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(
                package['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    package['discount'],
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w600),
                  ),
                  Text('Tap to see details.'),
                ],
              ),
              leading: const Icon(Icons.location_pin, color: Colors.blue),
              trailing: const Icon(Icons.info_outline),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PackageDetailsPage(package: package),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PackageDetailsPage extends StatelessWidget {
  final Map<String, dynamic> package;

  PackageDetailsPage({required this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(package['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              package['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Why Choose This Package:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(package['context'], style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text(
              'Places Covered:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: package['places'].length,
                itemBuilder: (context, index) {
                  final place = package['places'][index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(place['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(place['info']),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FlightBookingPages(packageName: package['name']),
                    ),
                  );
                },
                child: const Text('Book Flights'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlightBookingPages extends StatelessWidget {
  final String packageName;

  FlightBookingPages({required this.packageName});

  final List<Map<String, dynamic>> flights = [
    {
      'name': 'Air Europe',
      'time': '10:00 AM - 2:00 PM',
      'price': 350,
    },
    {
      'name': 'Sky Asia',
      'time': '11:30 AM - 3:30 PM',
      'price': 400,
    },
    {
      'name': 'Global Airlines',
      'time': '2:00 PM - 6:00 PM',
      'price': 300,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flights for $packageName')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: flights.length,
        itemBuilder: (context, index) {
          final flight = flights[index];
          return Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(
                flight['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Timing: ${flight['time']}'),
                  Text('Price: \$${flight['price']}'),
                ],
              ),
              trailing: const Icon(Icons.flight_takeoff),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(flight: flight),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PaymentPage extends StatefulWidget {
  final Map<String, dynamic> flight;

  PaymentPage({required this.flight});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  String? selectedPaymentMethod;

  void confirmPayment(BuildContext context) {
    // Check if mobile number is required and validate it
    if (selectedPaymentMethod != 'Card' && mobileController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Please enter your mobile number for $selectedPaymentMethod')),
      );
      return;
    }

    // Simulate the payment process
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              'Payment Successful using $selectedPaymentMethod! Your ticket is confirmed.')),
    );

    // Navigate to a confirmation screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PaymentConfirmationPages(paymentMethod: selectedPaymentMethod!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment for ${widget.flight['name']}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flight Details',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Flight Name: ${widget.flight['name']}'),
            Text('Timing: ${widget.flight['time']}'),
            Text('Price: \$${widget.flight['price']}'),
            const SizedBox(height: 20),
            Text(
              'Choose Payment Method',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  selectedPaymentMethod = 'Google Pay';
                });
              },
              icon: const Icon(Icons.account_balance_wallet),
              label: const Text('Pay with Google Pay'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  selectedPaymentMethod = 'PhonePe';
                });
              },
              icon: const Icon(Icons.phone_android),
              label: const Text('Pay with PhonePe'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  selectedPaymentMethod = 'Paytm';
                });
              },
              icon: const Icon(Icons.mobile_friendly),
              label: const Text('Pay with Paytm'),
            ),
            const SizedBox(height: 20),
            // Show mobile number input if one of the selected payment methods is Google Pay, PhonePe, or Paytm
            if (selectedPaymentMethod != null &&
                selectedPaymentMethod != 'Card')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      labelText: 'Enter Mobile Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            // Or Pay with Card
            if (selectedPaymentMethod == null ||
                selectedPaymentMethod == 'Card')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Or Pay with Card',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: cardNumberController,
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: expiryController,
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: cvvController,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => confirmPayment(context),
                child: const Text('Confirm Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentConfirmationPages extends StatelessWidget {
  final String paymentMethod;

  PaymentConfirmationPages({required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Confirmation')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
              const SizedBox(height: 20),
              Text(
                'Payment Successful!',
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Your payment through $paymentMethod has been successfully processed.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context,
                          (route) => route.isFirst); // Go back to the main page
                },
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//specialpackagepage

class SpecialPackagesPage extends StatelessWidget {
  final List<Map<String, String>> specials = [
    {
      'title': 'Luxury Cruise - 50% Off',
      'details':
      'Experience a luxurious cruise covering Caribbean islands and Mediterranean coasts.'
    },
    {
      'title': '2-for-1 Europe Getaway',
      'details':
      'Explore major European cities including Paris, Rome, and Berlin with this amazing deal.'
    },
    {
      'title': 'Family Safari Discount',
      'details':
      'Enjoy an adventurous safari experience in African reserves like Serengeti and Masai Mara.'
    },
    {
      'title': 'Honeymoon Package Deal',
      'details':
      'Romantic getaways to Maldives, Bora Bora, and Santorini for newlyweds.'
    },
    {
      'title': 'Adventure Trekking Special',
      'details':
      'Thrilling treks in the Himalayas, Andes, and Rockies for adventure enthusiasts.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDestinationPage(context, 'Special Packages', specials);
  }
}

Widget _buildDestinationPage(
    BuildContext context, String title, List<Map<String, String>> items) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            title: Text(items[index]['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            leading: const Icon(Icons.location_pin, color: Colors.blue),
            trailing: const Icon(Icons.info_outline),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PackageDetailsPages(
                    title: items[index]['title']!,
                    details: items[index]['details']!,
                  ),
                ),
              );
            },
          ),
        );
      },
    ),
  );
}

class PackageDetailsPages extends StatelessWidget {
  final String title;
  final String details;

  PackageDetailsPages({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              details,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FlightBookingPagess(specialName: title),
                    ),
                  );
                },
                child: const Text('Book Flights'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlightBookingPagess extends StatelessWidget {
  final String specialName;

  FlightBookingPagess({required this.specialName});

  final List<Map<String, dynamic>> flights = [
    {
      'name': 'Air Deluxe',
      'time': '9:00 AM - 1:00 PM',
      'price': 500,
      'class': ['Economy', 'Business', 'Premium'],
    },
    {
      'name': 'SkyHigh Airways',
      'time': '12:30 PM - 4:30 PM',
      'price': 450,
      'class': ['Economy', 'Business', 'Premium'],
    },
    {
      'name': 'Global Tours',
      'time': '3:00 PM - 7:00 PM',
      'price': 400,
      'class': ['Economy', 'Business', 'Premium'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flights for $specialName')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: flights.length,
        itemBuilder: (context, index) {
          final flight = flights[index];
          return Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(
                flight['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Timing: ${flight['time']}'),
                  Text('Base Price: \$${flight['price']}'),
                ],
              ),
              trailing: const Icon(Icons.flight),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>PassengerDetailsPage(flight: flight),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PassengerDetailsPage extends StatefulWidget {
  final Map<String, dynamic> flight;

  PassengerDetailsPage({required this.flight});

  @override
  _PassengerDetailsPageState createState() => _PassengerDetailsPageState();
}

class _PassengerDetailsPageState extends State<PassengerDetailsPage> {
  int adults = 1;
  int children = 0;
  String selectedClass = 'Economy';
  final List<String> classes = ['Economy', 'Business', 'Premium'];

  void proceedToPayment() {
    // Example alternative logic: Print a summary to the console
    final passengerSummary = {
      'Flight': widget.flight['name'],
      'Class': selectedClass,
      'Adults': adults,
      'Children': children,
    };

    // Log the passenger summary
    print('Proceeding to payment with the following details:');
    print(passengerSummary);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPages(
          flight: widget.flight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passenger Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flight: ${widget.flight['name']}'),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedClass,
              items: classes
                  .map((cls) => DropdownMenuItem(value: cls, child: Text(cls)))
                  .toList(),
              onChanged: (value) => setState(() => selectedClass = value!),
              decoration: const InputDecoration(labelText: 'Select Class'),
            ),
            const SizedBox(height: 20),
            _buildCounterCard('Adults', adults, onIncrement: () {
              setState(() => adults++);
            }, onDecrement: () {
              setState(() => adults = adults > 1 ? adults - 1 : 1);
            }),
            const SizedBox(height: 10),
            _buildCounterCard('Children', children, onIncrement: () {
              setState(() => children++);
            }, onDecrement: () {
              setState(() => children = children > 0 ? children - 1 : 0);
            }),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: proceedToPayment,
                child: const Text('Proceed to Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterCard(String label, int count,
      {required VoidCallback onIncrement, required VoidCallback onDecrement}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle,
                      color: Colors.red, size: 30),
                  onPressed: onDecrement,
                ),
                Text(
                  count.toString(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle,
                      color: Colors.green, size: 30),
                  onPressed: onIncrement,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class PaymentPages extends StatefulWidget {
  final Map<String, dynamic> flight;

  PaymentPages({required this.flight});

  @override
  _PaymentPageStates createState() => _PaymentPageStates();
}

class _PaymentPageStates extends State<PaymentPages> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  String? selectedPaymentMethod;

  void confirmPayment(BuildContext context) {
    if (selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a payment method.')),
      );
      return;
    }

    // Validate mobile number for UPI-based payments
    if (selectedPaymentMethod != 'Card' && mobileController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Please enter your mobile number for $selectedPaymentMethod.')),
      );
      return;
    }

    // Validate card details for card payment
    if (selectedPaymentMethod == 'Card') {
      if (cardNumberController.text.isEmpty ||
          expiryController.text.isEmpty ||
          cvvController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill in all card details.')),
        );
        return;
      }
    }

    // Show a popup dialog on successful payment
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Payment Successful'),
        content: Text(
            'Your payment using $selectedPaymentMethod has been processed successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentConfirmationPagess(
                      paymentMethod: selectedPaymentMethod!),
                ),
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment for ${widget.flight['name']}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flight Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Flight Name: ${widget.flight['name']}'),
            Text('Timing: ${widget.flight['time']}'),
            Text('Price: \$${widget.flight['price']}'),
            SizedBox(height: 20),
            Text(
              'Choose Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  selectedPaymentMethod = 'Google Pay';
                });
              },
              icon: Icon(Icons.account_balance_wallet),
              label: Text('Pay with Google Pay'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  selectedPaymentMethod = 'PhonePe';
                });
              },
              icon: Icon(Icons.phone_android),
              label: Text('Pay with PhonePe'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  selectedPaymentMethod = 'Paytm';
                });
              },
              icon: Icon(Icons.mobile_friendly),
              label: Text('Pay with Paytm'),
            ),
            SizedBox(height: 20),
            if (selectedPaymentMethod != null &&
                selectedPaymentMethod != 'Card')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      labelText: 'Enter Mobile Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            if (selectedPaymentMethod == null ||
                selectedPaymentMethod == 'Card')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Or Pay with Card',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: cardNumberController,
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: expiryController,
                    decoration: InputDecoration(
                      labelText: 'Expiry Date (MM/YY)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: cvvController,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),
                ],
              ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => confirmPayment(context),
                child: Text('Confirm Payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentConfirmationPagess extends StatelessWidget {
  final String paymentMethod;

  PaymentConfirmationPagess({required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Confirmation')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
              SizedBox(height: 20),
              Text(
                'Payment Successful!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Your payment through $paymentMethod has been successfully processed.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context,
                          (route) => route.isFirst); // Go back to the main page
                },
                child: Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}