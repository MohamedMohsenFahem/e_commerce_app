import 'package:e_commerce/screen/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isShow = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "login",
          style: TextStyle(color: Colors.deepOrange),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              //logo
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage:
                      AssetImage('assets/images/photo_2021-12-04_19-18-44.jpg'),
                ),
              ),
            ),

            //email

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextFormField(
                controller: _emailController,
                validator: (email) =>
                    email!.isEmpty ? 'Email cannot be empty' : null,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            //password
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextFormField(
                controller: _passwordController,
                validator: (Password) => Password!.length < 6
                    ? 'password cannot be less than 6 characters'
                    : null,
                obscureText: _isShow,
                decoration: InputDecoration(
                    labelText: 'Enter your Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: _isShow
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isShow = !_isShow;
                        });
                      },
                    )),
              ),
            ),

            //login button
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) ;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Email or Password cannot empty'),
                  backgroundColor: Colors.red,
                ));
              },
              child: Text(
                'login',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.deepOrange),
            ),
            //signup button
            SizedBox(
              height: 30,
              width: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Not have E-mail?',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(backgroundColor: Colors.cyan),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
