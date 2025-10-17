import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Main App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Send Money',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

// Login Page
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          child: Text('Login'),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    SendMoneyPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  return SlideTransition(position: animation.drive(tween), child: child);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// Send Money Page
class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String? _paymentMethod;
  bool _isFavorite = false;
  bool _showSuccess = false;

  List<String> _methods = ['Bank Transfer', 'Mobile Money', 'Card'];

  void _sendMoney() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _showSuccess = true;
      });
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _showSuccess = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Recipient Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter recipient name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Amount'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      }
                      final number = double.tryParse(value);
                      if (number == null || number <= 0) {
                        return 'Enter a positive number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _paymentMethod,
                    hint: Text('Select Payment Method'),
                    items: _methods
                        .map((method) => DropdownMenuItem(
                              value: method,
                              child: Text(method),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _paymentMethod = value;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Please select a payment method' : null,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text('Mark as Favorite'),
                      Switch(
                        value: _isFavorite,
                        onChanged: (value) {
                          setState(() {
                            _isFavorite = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SendMoneyButton(text: 'Send Money', onPressed: _sendMoney),
                ],
              ),
            ),
            SizedBox(height: 16),
            AnimatedOpacity(
              opacity: _showSuccess ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.green,
                child: Text(
                  'Transaction Successful!',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Send Money Button
class SendMoneyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SendMoneyButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 16),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
      child: Center(child: Text(text)),
    );
  }
}
