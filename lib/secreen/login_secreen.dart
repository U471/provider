import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning_example/provider/auth_provider.dart';

class LoginSecreen extends StatefulWidget {
  const LoginSecreen({super.key});

  @override
  State<LoginSecreen> createState() => _LoginSecreenState();
}

class _LoginSecreenState extends State<LoginSecreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  authprovider.login(emailController.text.toString(),
                      passwordController.text.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: authprovider.loading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Login'),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
