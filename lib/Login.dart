import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/TodoApp.dart';
import 'package:google_fonts/google_fonts.dart';

void main()=>runApp(const LoginPage());

class LoginPage extends StatelessWidget{
    const LoginPage({super.key});

    Widget build(BuildContext context){
        return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginApp(),
        );
    }
}


class LoginApp extends StatefulWidget{
  const LoginApp({super.key});

  State createState ()=> _LoginAppState();
}

class _LoginAppState extends State{

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passController  = TextEditingController();

    GlobalKey<FormFieldState> emailKey = GlobalKey<FormFieldState>();
    GlobalKey<FormFieldState> passKey = GlobalKey<FormFieldState>();

    



    void validation(){

      bool emailValidated = emailKey.currentState!.validate();
      bool passValidated = passKey.currentState!.validate();
       String enterdEmail = _emailController.text;
       String enteredPass = _passController.text;

       String correctEmail = "abhishek12@gmail.com";
       String correctPass = "abhishek";

       if(correctEmail==enterdEmail && correctPass==enteredPass){
            if(emailValidated&& passValidated){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const TodoApp()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  
                     SnackBar(
                       
                       shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      duration:const Duration(seconds: 3),
                      backgroundColor:const Color.fromARGB(255, 241, 57, 57),
                      content:   Center(child:  Text("Login Successful",style:GoogleFonts.quicksand(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, 
                      )))),
                );
            }
       }
        else{
               ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 4.0,
                      backgroundColor:const Color.fromRGBO(241, 57, 57, 1),
                      content: const Center(child: Text("Enter correct email and password"))));
            }
    }

    @override

    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
            title:  Text('TodoApp', style:GoogleFonts.quicksand(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, 
                      ),),
            centerTitle: true,
            backgroundColor:const Color.fromRGBO(89, 57, 241, 1),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               Column(
                  children: [
                      Container(
                        height: 300,
                        width: 300, 
                        child: Image.network('https://img.freepik.com/premium-photo/3d-cute-cartoon-girl-studying-education-illustration_988987-3325.jpg'),
                      ),
                      const SizedBox(height: 30,),
                       SizedBox(
                    // margin: const EdgeInsets.only(
                    //   left: 10,
                    //   right: 10
                    // ),
                    // width: ,
                    child:  Center(
                    child: Text('Welcome back!🚀 ', style:GoogleFonts.quicksand(
                          fontSize: 27, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        ),
                  ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10
                    ),
                    // width: ,
                    child:  Center(
                    child: Text(' Login to your account', style:GoogleFonts.quicksand(
                          fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 172, 166, 166)),
                        ),
                        ),
                  ),
                   const SizedBox(
                    height: 10,
                  ),
                  
                    // Image.network(''),
                     SizedBox(
                      height: 64,
                      width: 330,
                      child: TextFormField(
                        validator: (value){
                          if(value==null || value.isEmpty){
                              return "Please Enter Email";
                          }
                          else{
                            return null;
                          }
                        },
                        controller: _emailController,
                        key: emailKey,
                      decoration: const InputDecoration(
                        hintText: "Enter your email",
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          )
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1),
                            )
                        ),
                                  
                      ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 64, 
                      width: 330,
                      child: TextFormField(
                        validator: (value){
                          if(value==null || value.isEmpty){
                              return "Please Enter Password";
                          }
                          else{
                            return null;
                          }
                        },
                        controller: _passController,
                        key: passKey,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: "Enter your password",
                        labelText: "Password",
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          )
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color:Color.fromRGBO(89, 57, 241, 1),
                            )
                        ),
                                  
                      ),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    GestureDetector(
                      onTap: validation,
                      child: Container(
                        height: 60,
                        width: 330,
                       
                          decoration:const  BoxDecoration(
                              color: Color.fromRGBO(89, 57, 241, 1),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              boxShadow:  [
                              BoxShadow(offset: Offset(5, 5), color: Color.fromARGB(255, 98, 78, 199),blurRadius: 20)
                              ],
                              
                            ),
                         child:   Center(child: Text("Login", style:GoogleFonts.quicksand(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, 
                      )),)),
                      ),
                      
                  ],
                ),
                ],
              ),
            ),
          ),
        );
    }
}