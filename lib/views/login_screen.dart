import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:seenit/views/home_screen.dart';
import 'package:seenit/widgets/textforminput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _printUsername() {
    print(_usernameController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 6, 27),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login Screen 😍",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormInput(
                controller: _usernameController,
                hintText: "Username",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormInput(
                controller: _passwordController,
                isPass: true,
                hintText: "Password",
                style: TextStyle(color: Colors.white),
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(() => HomeScreen());
                },
                child: const Center(child: Text("Login")),
              ),
              Row(
                children: [
                  const Text(
                    "Dont have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text("Register Now!"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
