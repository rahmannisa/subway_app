import 'package:subway_app/view/login.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Untuk inisialisasi controller, yang akan diletakkan di text field
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();

  // method register
  void register(String username, email, password) async {
    try {
      // ME-POST atau MENAMBAH data json dari link
      var response = await Dio().post('http://localhost:3000/users',
          data: {"username": username, "email": email, "password": password});
      if (response.statusCode == 201) {
        // status code 201 karena berhasil membuat data baru
        print("Account created successfully");
        final snackBar = SnackBar(
          backgroundColor: Color.fromRGBO(0, 137, 56, 1),
          content: Text(
            'Account created successfully',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Login(),
        ));
      } else {
        print("Registration Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: Column(
          children: <Widget>[
            // Image.asset('../assets/logo.png',height: 50,),
            SizedBox(height: 15),
            Container(
              width: 150,
              child: (Image.asset('assets/img/Subway.png')),
            ),
            SizedBox(
              height: 60,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text(
                    "Create New Account",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        fontStyle: FontStyle.normal),
                  ),
                  SizedBox(height: 0),
                  Text("Please fill field below",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 16,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: controllerUsername,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Username",
                hintText: "Username",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 18),
            TextField(
              controller: controllerEmail,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Email Address",
                hintText: "Email Address",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 18),
            TextField(
              controller: controllerPass,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Password",
                hintText: "Password",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintStyle: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 240),
            ElevatedButton(
              onPressed: () {
                // memanggil method register, dengan parameter yg sudah diinputkan melalui text field
                try {
                  if (controllerUsername.text.isNotEmpty &&
                      controllerEmail.text.isNotEmpty &&
                      controllerPass.text.isNotEmpty) {
                    print("proses");
                    register(controllerUsername.text, controllerEmail.text,
                        controllerPass.text);
                  } else {
                    print('fail');
                    final snackBar = SnackBar(
                      backgroundColor: Color.fromARGB(255, 255, 0, 0),
                      content: Text(
                        'Harap lengkapi data',
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          color: Colors.white,
                        ),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text("SIGN UP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(242, 183, 0, 1),
                  minimumSize: const Size.fromHeight(55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    )),
                SizedBox(width: 7),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
                  },
                  child: Text("Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(242, 183, 0, 1),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
