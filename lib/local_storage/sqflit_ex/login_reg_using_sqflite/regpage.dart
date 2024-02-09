import 'package:ebooks/local_storage/sqflit_ex/login_reg_using_sqflite/dbaseFunction.dart';
import 'package:ebooks/local_storage/sqflit_ex/login_reg_using_sqflite/introscreen.dart';
import 'package:ebooks/local_storage/sqflit_ex/login_reg_using_sqflite/loginpage.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  //const Register({super.key});

  var formKey = GlobalKey<FormState>();
  final uname  = TextEditingController();
  final uphn   = TextEditingController(); 
  final uemail = TextEditingController();
  final upass  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void createAccount(String name, String phnno, String email, String password) async{
      var id  =  await SQLHelpers.insertValues(name, phnno, email, password);
      print(id);
      if(id != null){
        Navigator.of(context).pushReplacement( 
          MaterialPageRoute(builder: (context) => Login())
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed"))
        );
      }
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: 100,
            child: Column(
              children: [
                Text("PUNCH", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),),
                Text("Punch . Earn . Repeat", style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => IntroScreen())
                              );
                            }, 
                          icon: Icon(Icons.arrow_back_ios, color: Colors.black, weight: 50,)),
                          SizedBox(width: 80,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Sign Up", style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold,
                            )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          validator: (name){
                            if(name!.isEmpty){
                              return "Enter the name";
                            }
                          },
                          controller: uname,
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey
                              )
                            ) 
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          validator: (phnno){
                            if(phnno!.isEmpty || phnno.length<9){
                              return "Invalid phone numebr";
                            }
                          },
                          controller: uphn,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey
                              )
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          validator: (email){
                            if(email!.isEmpty || !email.contains('@')){
                              return "Invalid email id";
                            }
                          },
                          controller: uemail,
                          decoration: InputDecoration(
                            hintText: "Email Id",
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey
                              )
                            ) 
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          validator: (password){
                            if(password!.isEmpty || password.length < 6){
                              return "Password should contain more than 6 characters";
                            }
                          },
                          controller: upass,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey
                              )
                            ) 
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      MaterialButton(
                        color: Colors.black,
                        minWidth: 350,
                        height: 60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () async{
                          var isValid = formKey.currentState!.validate();
                          if(isValid == true){
                            createAccount(uname.text, uphn.text, uemail.text, upass.text); 
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please fill all the fields"))
                            );
                          }
                        },
                        child: Text("CREATE ACCOUNT", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ); 
  }
}