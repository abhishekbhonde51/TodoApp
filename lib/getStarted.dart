import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/Login.dart';
void main()=>runApp(const Start());


class Start extends StatelessWidget{
  const Start({super.key});

  @override 
  Widget build(BuildContext context){
      return const MaterialApp(
          debugShowCheckedModeBanner: false, 
          home: StartScreen(),
      );
  }
}
class StartScreen extends StatefulWidget{
    const StartScreen({super.key});

    State createState()=> _StarteState();
}

class _StarteState extends State{

    void Loginpage(){
        Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const LoginApp()),
                );
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
          body: Padding( 
            padding: const EdgeInsets.all(10),
            child: 
               
                Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                  height: 300, 
                  width: 300,
                  child: Image.network('https://ouch-cdn2.icons8.com/CltBK7JX-fYQ4v6G4Nsi4Wu8qlLMdcIT0B7BLANHn_8/rs:fit:627:456/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNDg0/L2VmNGY5YzM2LTFh/ZDgtNGYxMi04M2Uz/LWY2OGI5YmQ1OWVh/YS5wbmc.png'),
                ),
                 Text('Task Management &', style:GoogleFonts.quicksand(
                        fontSize: 25, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      ),
                       Text('Todo List', style:GoogleFonts.quicksand(
                        fontSize: 25, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 0, 0, 0),
                     ),
                      ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    // margin: const EdgeInsets.only(
                    //   left: 10,
                    //   right: 10
                    // ),
                    // width: ,
                    child:  Center(
                    child: Text('This productivity tool is designed to help', style:GoogleFonts.quicksand(
                          fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 172, 166, 166),
                        ),
                        ),
                  ),
                  ),
                    Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10
                    ),
                    // width: ,
                    child:  Center(
                    child: Text('You better manage your task', style:GoogleFonts.quicksand(
                          fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 172, 166, 166),
                        ),
                        ),
                  ),
                  ),
                   Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10
                    ),
                    // width: ,
                    child:  Center(
                    child: Text('project-wise conveniently', style:GoogleFonts.quicksand(
                          fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 172, 166, 166),
                        ),
                        ),
                  ),
                  ),
                const SizedBox(
                  height: 100,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     GestureDetector(
                        onTap:  Loginpage,
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
                            child: Padding( 
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Center(child: Text("Get Started", style:GoogleFonts.quicksand(
                              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, 
                                                        )),),
                             const Center(child: Icon(Icons.forward, size: 40,color: Colors.white,)),
                                ],
                              ),
                            )
                    ),
                  ),
                  ],
                 ),
                 
                ],
              
            ),
          ),
      );        
    }
}