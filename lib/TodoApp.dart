

// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(const MainApp());
}


class MainApp extends StatelessWidget{
  const MainApp({super.key});


  @override
  Widget build(BuildContext context){
    return const MaterialApp(
        home: TodoApp(),
        debugShowCheckedModeBanner: false
    );
  }
}


class TodoApp extends StatefulWidget{
    const TodoApp({super.key});
    
    @override

    State createState()=> _TodoAppState();
}
    class _TodoAppState extends State{

      TextEditingController titleController = TextEditingController();
            TextEditingController descriptionController = TextEditingController();

      TextEditingController dateController = TextEditingController();

    void submit(bool doedit, [TodoModelClass? toDoModelClass]) {
if (titleController.text.trim().isNotEmpty &&
descriptionController.text.trim().isNotEmpty &&
dateController.text.trim().isNotEmpty) {
if (!doedit) {
setState(() {
cardList.add(
TodoModelClass(
title: titleController.text.trim(),
description: descriptionController.text.trim(),
date: dateController.text.trim(),
),
);
});
} else {
setState(() {
toDoModelClass!.date = dateController.text.trim();
toDoModelClass.title = titleController.text.trim();
toDoModelClass.description = descriptionController.text.trim();
});
}
}
clearController();
}

      void clearController(){
        titleController.clear();
        descriptionController.clear();
        dateController.clear();
      }
      void showBottomeSheet(bool doEdit, [TodoModelClass ? todoModelClass]){
        showModalBottomSheet(
          
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context){
            return Padding(
              padding:MediaQuery.of(context).viewInsets,
              // padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding( 
                    padding: const EdgeInsets.all(10),
                    child: Text('Create Task',style: GoogleFonts.quicksand(
                      fontWeight:FontWeight.w800,
                      fontSize:22,
                      color: const Color.fromRGBO(89, 57, 241, 1)    
                    ),),
                  ),
              const SizedBox(
                height: 20,
              ),
                  Padding( 
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Align(
                            alignment:Alignment.centerLeft ,
                            child: Padding( 
                              padding:const EdgeInsets.only(
                                left: 35
                              ),
                              child: Text("Title", style: GoogleFonts.quicksand(
                              fontWeight:FontWeight.bold,
                              fontSize:15,
                              color:const Color.fromRGBO(89, 57, 241, 1)          ),),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Container(
                              height: 40,
                              width: 330,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color.fromRGBO(89, 57, 241, 1),
                                  ),
                                  borderRadius:const BorderRadius.all(Radius.circular(5))
                                ),
                              child: TextField(
                                controller: titleController,
                                decoration: const InputDecoration(
                                   focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(89, 57, 241, 1),
                                      )
                                    ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           Align(
                            alignment:Alignment.centerLeft ,
                            child: Padding( 
                              padding:const EdgeInsets.only(
                                left: 35
                              ),
                              child: Text("Description", style: GoogleFonts.quicksand(
                              fontWeight:FontWeight.bold,
                              fontSize:15,
                              color:const Color.fromRGBO(89, 57, 241, 1)    
                               ),),
                            ),
                          ),
                          const SizedBox(

                            height: 5,
                          ),
                          Center(
                            child: Container(
                              height: 72,
                              width: 330,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color.fromRGBO(89, 57, 241, 1),
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(5))
                                ),
                                child: TextField(
                                   decoration: const InputDecoration(
                                   focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(89, 57, 241, 1),
                                      )
                                    ),
                                ),
                                  controller: descriptionController,
                                ),
                              
                            ),
                          ),
                            Align(
                            alignment:Alignment.centerLeft ,
                            child: Padding( 
                              padding:const EdgeInsets.only(
                                left: 35
                              ),
                              child: Text("Date", style: GoogleFonts.quicksand(
                              fontWeight:FontWeight.w700,
                              fontSize:15,
                              color:const Color.fromRGBO(89, 57, 241, 1)    
                                                      ),),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              width: 330,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                  color: Color.fromRGBO(89, 57, 241, 1),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child:  TextField(
                              controller: dateController,
                              readOnly: true,
                              decoration:const InputDecoration(
                                suffixIcon: Icon(Icons.date_range_rounded)
                              ),
                              onTap: () async {
                              DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2025),
                              );
                              String formatedDate =
                              DateFormat.yMMMd().format(pickeddate!);
                              setState(() {
                              dateController.text = formatedDate;
                              });
                              },
                              ), )                ),
                              ],                   
                              ),
                                                ),
                  Padding( 
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style:const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll( Color.fromRGBO(89, 57, 241, 1),)
                      ),
                      onPressed: () {
                      doEdit ? submit(doEdit, todoModelClass) :
 
                       submit(doEdit);
                        // submit(doEdit);
                        Navigator.of(context).pop();
                      }, child:  Text("Submit",style:GoogleFonts.quicksand(
                          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white, 
                        ) )),
                  )
                ],
              ),
            );
          }
        );
      }

      List<TodoModelClass> cardList=[
          TodoModelClass(title: "Instagram handling", description: "Fixing the  issues that were caused" , date: "12,July 2015")
      ];
      void deleteCard(TodoModelClass todoModelClass){
            setState(() {
              cardList.remove(todoModelClass);
            });
      }
      void editCard(TodoModelClass todoModelClass){
          titleController.text = todoModelClass.title;
          descriptionController.text = todoModelClass.description;
          dateController.text = todoModelClass.date;
          showBottomeSheet(true,todoModelClass);
      }
      @override
      Widget build(BuildContext context){
        return  Scaffold(
          backgroundColor: const Color.fromRGBO(89, 57, 241, 1
                  ),
          appBar: AppBar(
            title:  Text('TodoApp', style:GoogleFonts.quicksand(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, 
                      ),),
            centerTitle: true,
            backgroundColor:const Color.fromRGBO(89, 57, 241, 1),
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 450,
                  decoration:const BoxDecoration(
                        color:Color.fromRGBO(89, 57, 241, 1),
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            right: 130
                          ),
                         child: Text("Good Morning",style:GoogleFonts.quicksand(
                          fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white, 
                                               ),),
                       ),
                        Padding( 
                          padding: const EdgeInsets.only(
                            right: 140
                          ),
                          child: Text("Abhishek",style:GoogleFonts.quicksand(
                          fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white, 
                                                ),),
                        ),
                    ],
                  ),
                  
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                  height: 597, 
                  width: 460,
                  child: ListView.builder(
                              itemCount: cardList.length,
                              itemBuilder: (BuildContext contex, int index){
                    return Padding(
                      
                      padding:const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ), 
                      child: Container(
                        height: 110,
                        width: 360,
                        decoration:const BoxDecoration(
                          
                          boxShadow: [
                            BoxShadow(offset: Offset(10, 10), blurRadius: 20, color: Color.fromRGBO(0, 0, 0, 0.1))
                          ]
                        ),
                        child: Container(
                          height: 90, 
                          width: 360,
                          decoration: BoxDecoration(
                            color:  const Color.fromRGBO(255, 255, 255, 1),
                            border: Border.all(
                              width: 0.5
                            ),
                            boxShadow:const [
                              BoxShadow(
                                offset:   Offset(0, 5), color: Color.fromRGBO(0, 0, 0, 0.08),blurRadius: 20
                              )
                            ]
                          ) ,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 52,
                                      width: 52,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          // width: 1,
                                          color:const Color.fromRGBO(255,255, 255, 1),
                                        ),
                                        shape: BoxShape.circle,
                                        boxShadow:const [
                                          BoxShadow(color: Color.fromRGBO(0,0,0,0.07))
                                        ],
                                        image:const DecorationImage(
                                          image: NetworkImage('https://cdn.pixabay.com/photo/2017/06/06/00/33/edit-icon-2375785_640.png'),
                              
                                        )
                                      
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                   Column(
                                    children: [
                                      Text(cardList[index].title,softWrap: true, textAlign:TextAlign.center, style: GoogleFonts.inter(
                                      fontWeight:FontWeight.w700,
                                      fontSize:15
                                    ),),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(cardList[index].description , style: GoogleFonts.inter(
                                      fontWeight:FontWeight.w500,
                                      fontSize:10
                                    ),)
                                    ],
                                   )
                                              
                                  ],
                                ),
                                              
                                // Row 2 of Container is from here
                                
                                const SizedBox(
                                  height: 10,
                                ),
                                              
                                              
                              Row(
                                children: [
                                    Text(cardList[index].date, style: GoogleFonts.quicksand(
                                      fontWeight:FontWeight.w500,
                                      fontSize:12
                                    ),),
                                    const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      child: const Icon(
                                        Icons.edit,
                                        color: Color.fromRGBO(89, 57, 241, 1),
                                        size: 20,
                                              
                                      ),
                                      onTap: (){
                                        editCard(cardList[index]);
                                      },
                                      ),
                                       GestureDetector(
                                      child: const Icon(
                                        Icons.delete,
                                        color: Color.fromRGBO(89, 57, 241, 1),
                                        size: 20,
                                      ),
                                      onTap: (){
                                        deleteCard(cardList[index]);
                                      },
                                    )
                                  ],
                                )
                                ],
                              )        
                              ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      );
                              },
                            ),
                ),
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
                showBottomeSheet(false);
            },
            backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
             child:  Text('Add',style:GoogleFonts.quicksand(
                        fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white, 
                      )),
          ),
        );
      }
    }


class TodoModelClass{
  String title;
  String description;
  String date;

   TodoModelClass({
    required this.title,
    required this.description,
    required this.date
  });
}