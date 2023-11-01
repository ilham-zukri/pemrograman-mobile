import 'package:flutter/material.dart';
import 'package:test_2/pages/home_page.dart';
import 'package:test_2/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Map<String, dynamic>> users = [
    {"username": "budi", "password": "12345678"},
    {"username": "budung", "password": "password"},
  ];

  bool authorized = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextField(
              title: "Username",
              controller: usernameController,
              isHidden: false,
            ),
            const SizedBox(
              height: 16,
            ),
            customTextField(
              title: "Password",
              controller: passwordController,
              isHidden: true,
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: size.width,
              child: ElevatedButton(
                onPressed: () {
                  String username = usernameController.text;
                  String password = passwordController.text;
                  for (var user in users) {
                    if (username == user["username"] &&
                        password == user["password"]) {
                      authorized = true;
                    }
                  }

                  if (authorized) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Credential doesn not match",
                          style: TextStyle(color: Colors.red),
                        ),
                        backgroundColor: Colors.lightBlue,
                      ),
                    );
                  }
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
