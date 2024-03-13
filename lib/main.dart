

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

      // bool doEdit = false;
      void submit (bool doEdit, [TodoModelClass? todoModelClass]){
        if(titleController.text.trim().isEmpty && descriptionController.text.trim().isNotEmpty&& dateController.text.trim().isNotEmpty){
          if(!doEdit){
            setState(() {
              cardList.add(
              TodoModelClass(
                title: titleController.text.trim(),
                description: descriptionController.text.trim(),
                date: dateController.text.trim(),
              )
            );
            });
          } else{
             setState(() {
               todoModelClass!.title = titleController.text.trim();
             todoModelClass.description = descriptionController.text.trim();
             todoModelClass.date = dateController.text.trim();
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
                  Text('Create Task',style: GoogleFonts.quicksand(
                    fontWeight:FontWeight.w800,
                    fontSize:22,
                  ),),
              const SizedBox(
                height: 20,
              ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title", style: GoogleFonts.quicksand(
                          fontWeight:FontWeight.w500,
                          fontSize:22,
                        ),),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            )
                          ),
                        ),
                        Text("Description", style: GoogleFonts.quicksand(
                          fontWeight:FontWeight.w500,
                          fontSize:22,
                        ),),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            )
                          ),
                        ),
                        Text("Date", style: GoogleFonts.quicksand(
                          fontWeight:FontWeight.w500,
                          fontSize:22,
                        ),),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          readOnly: true,
                          controller: dateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            suffixIcon:  Icon(Icons.calendar_month)
                          ),
                          onTap: ()async{
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2024),
                                lastDate: DateTime(2023));
                               String formatedDate= DateFormat.yMMMd().format(pickedDate!);
                              setState(() {
                                dateController.text = formatedDate;
                              });
                          },
                          
                        )
                      ],

                  ),
                  ElevatedButton(
                    style:const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(2,167, 177, 1))
                    ),
                    onPressed: (){
                      if(!doEdit){
                        submit(doEdit);
                      } else{
                        submit(doEdit, todoModelClass);
                      }
                      // submit(doEdit);
                      Navigator.of(context).pop();
                    }, child: const Text("Submit"))
                ],
              ),
            );
          }
        );
      }

      List<TodoModelClass> cardList=[
          TodoModelClass(title: "Instagram", description: "Fixing the backend issue", date: "12,July 2015")
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
          appBar: AppBar(
            title: const Text('TodoApp', style: TextStyle(fontWeight: FontWeight.bold),),
            centerTitle: true,
            backgroundColor:const Color.fromRGBO(54, 238, 192, 0.698)
          ),

          body: ListView.builder(
            itemCount: cardList.length,
            itemBuilder: (BuildContext contex, int index){
                return   Padding(
                  padding:const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ), 
                  child: Container(
                    height: 112,
                    width: 330,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black, 
                      ),
                      boxShadow: const[
                        BoxShadow(offset: Offset(10, 10), blurRadius: 20, color: Color.fromRGBO(0, 0, 0, 0.1))
                      ]
                    ),
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
                                  width: 1,
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
                              Text(cardList[index].title, style: GoogleFonts.quicksand(
                              fontWeight:FontWeight.w600,
                              fontSize:14
                            ),),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(cardList[index].description , style: GoogleFonts.quicksand(
                              fontWeight:FontWeight.w500,
                              fontSize:12
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
                                color: Color.fromRGBO(0,139, 148, 1),
                                size: 20,

                              ),
                              onTap: (){
                                editCard(cardList[index]);
                              },
                              ),
                               GestureDetector(
                              child: const Icon(
                                Icons.delete,
                                color: Color.fromRGBO(0,139, 148, 1),
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
                  );
            },
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
                showBottomeSheet(false);
            },
            backgroundColor: const Color.fromRGBO(2,167,177,1),
             child: const Text('Add'),
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