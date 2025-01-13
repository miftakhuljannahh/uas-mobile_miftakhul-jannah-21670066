import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uas_miftakhul/regis.dart';
import 'package:uas_miftakhul/home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController cMail = TextEditingController();
  final TextEditingController cPass = TextEditingController();
  final supabase = Supabase.instance.client;
  // final formkey = GlobalKey<FormState>();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) return "Please enter a valid Email";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(238, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 60),
          child: Form(
            // key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset("img/login.png", width: 250, height: 250),
                Text(
                  "Login",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome Back",
                  style: TextStyle(color: Color(0xff000000), fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: cMail,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "User Masih Kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: cPass,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password Masih Kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  width: double.infinity,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0000EF),
                    ),
                    onPressed: () async {
                      final sm = ScaffoldMessenger.of(context);
                      final AuthResponse = await supabase.auth
                          .signInWithPassword(
                              password: cPass.text, email: cMail.text);

                      sm.showSnackBar(SnackBar(
                          content: Text(
                              'Logged in: ${AuthResponse.user!.email!} ')));
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                      // String tUser = "mifta";
                      // String tPass = "12345";
                      // if (formkey.currentState!.validate()) {
                      //   if (cUser.text == tUser && cPass.text == tPass) {
                      //     //perintah utk memanggil halaman baru
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => const home(),
                      //         ));
                      //Navigator.pushAndRemoveUntil(
                      //  context,
                      //MaterialPageRoute(
                      //builder: (context) => const cutikhusus(),
                      //),
                      //  (route) => false);
                      // } else {
                      //   showDialog(
                      //       context: context,
                      //       builder: (context) {
                      //         return AlertDialog(
                      //           title: Text("Konfirmasi Login"),
                      //           content:
                      //               Text("User atau Password Masih salah"),
                      //           actions: [
                      //             ElevatedButton(
                      //                 onPressed: () {
                      //                   cUser.text = '';
                      //                   cPass.text = '';
                      //                   Navigator.of(context).pop();
                      //                 },
                      //                 child: Text('Ok'))
                      //           ],
                      //         );
                      //       });
                      // }
                      // ;
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Tidak punya akun?",
                      style: TextStyle(color: Colors.black26, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Regis()));
                      },
                      child: Text(
                        "Daftar Sekarang",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
