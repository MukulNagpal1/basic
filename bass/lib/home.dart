// import "package:bass/functions/authFunctions.dart";
// import "package:flutter/material.dart";

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final _formkey = GlobalKey<FormState>();
//   bool isLogin = false;
//   String email = '';
//   String password = '';
//   String username = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Email Authentication"),
//       ),
//       body: Form(
//         key: _formkey,
//         child: Container(
//           margin: EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               !isLogin
//                   ? TextFormField(
//                       key: ValueKey("UserName"),
//                       validator: (value) {
//                         if (value.toString().length < 3) {
//                           return "Username is too small";
//                         } else {
//                           return null;
//                         }
//                       },
//                       onSaved: (value) {
//                         setState(() {
//                           username = value!;
//                         });
//                       },
//                       decoration:
//                           InputDecoration(hintText: "Enter the Username"),
//                     )
//                   : Container(),
//               TextFormField(
//                 key: ValueKey("Email"),
//                 decoration: InputDecoration(hintText: "Enter Email"),
//                 validator: (value) {
//                   if (!(value.toString().contains('@'))) {
//                     return 'Invalid Email';
//                   } else {
//                     return null;
//                   }
//                 },
//                 onSaved: (value) {
//                   setState(() {
//                     email = value!;
//                   });
//                 },
//               ),
//               TextFormField(
//                 obscureText: true,
//                 key: ValueKey("Password"),
//                 decoration: InputDecoration(hintText: "Enter the password"),
//                 validator: (value) {
//                   if (value.toString().length < 6) {
//                     return "Password is soo small";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onSaved: (value) {
//                   setState(() {
//                     password = value!;
//                   });
//                 },
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Container(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                       onPressed: () {
//                         if (_formkey.currentState!.validate()) {
//                           _formkey.currentState!.save();
//                           signup(email, password);
//                         }
//                       },
//                       child: isLogin ? Text("Login") : Text("Sign Up"))),
//               SizedBox(
//                 height: 15,
//               ),
//               TextButton(
//                   onPressed: () {
//                     setState(() {
//                       isLogin = !isLogin;
//                     });
//                   },
//                   child: isLogin
//                       ? Text("Don't have an account? Sign Up")
//                       : Text("Already Signed Up? Log in"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import "package:bass/functions/authFunctions.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String username = '';

  void _submitForm() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      if (isLogin) {
        login(email, password);
      } else {
        signup(email, password);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email Authentication"),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isLogin)
                TextFormField(
                  key: ValueKey("UserName"),
                  validator: (value) {
                    if (value.toString().length < 3) {
                      return "Username is too short";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    username = value!;
                  },
                  decoration:
                      InputDecoration(hintText: "Enter the Username"),
                ),
              TextFormField(
                key: ValueKey("Email"),
                decoration: InputDecoration(hintText: "Enter Email"),
                validator: (value) {
                  if (!(value.toString().contains('@'))) {
                    return 'Invalid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              TextFormField(
                obscureText: true,
                key: ValueKey("Password"),
                decoration: InputDecoration(hintText: "Enter Password"),
                validator: (value) {
                  if (value.toString().length < 6) {
                    return "Password is too short";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(isLogin ? "Login" : "Sign Up"),
                ),
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(
                  isLogin
                      ? "Don't have an account? Sign Up"
                      : "Already have an account? Log in",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
