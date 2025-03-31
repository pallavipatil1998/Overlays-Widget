import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllDialogBox extends StatefulWidget {
  const AllDialogBox({super.key});

  @override
  State<AllDialogBox> createState() => _AllDialogBoxState();
}

class _AllDialogBoxState extends State<AllDialogBox> {
  bool isChecked=false;
  List<String> listRadioOption=[
    "male","female","other"
  ];
  String SelectedGender= "female";
  bool isOpen=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DialogBox"),
      ),
      body: SingleChildScrollView(
        child: Column(
        
          children: [
        
            //1] Aleart Dialog Box
            ElevatedButton(onPressed: (){
              showDialog(context: context, 
                  barrierDismissible: false,
                  barrierColor: Colors.black.withOpacity(0.4),
                  builder: (ctx){
                 return AlertDialog(
                   title: Text("Delete"),
                   content: Text("Are You Sure Want to delete ?"),
                   icon: Icon(Icons.delete),
                   actions: [
                     TextButton(onPressed: (){
                       Navigator.pop(context);
                     },
                         child: Text("Yes")
        
                     ),
                     TextButton(onPressed: (){
                       Navigator.pop(context);
                     },
                         child: Text("No")
        
                     )
                   ],
                 );
                  }
              );
            },
                child: Text("Aleart Dialog Box")),
        
            //2] Simple Dialog
            ElevatedButton(onPressed: (){
              showDialog(
                barrierDismissible: true,
                  context: context, builder: (ctx){
        
                return SimpleDialog(
                  title: Text("Chose Your Country"),
                  children: [
                    SimpleDialogOption(
                      child: Text("India"),
                      onPressed: (){
                        Navigator.pop(context);
        
                      },
                    ),
                    SimpleDialogOption(
                      child: Text("Dubai"),
                      onPressed: (){
                        Navigator.pop(context);
        
                      },
                    ),
                  ],
                );
              });
            },
                child: Text("Simple Dialog")
            ),
        
            //3]About Dialog
            ElevatedButton(
                onPressed: (){
                  showDialog(context: context, builder: (ctx){
                    return AboutDialog(
                     applicationIcon: Icon(Icons.account_circle_outlined),
                      applicationName: "Classico",
                      applicationVersion: "v:0.1",
                      applicationLegalese: "Powered By Meta",
                    ) ;
                  });
                },
                child: Text("About Dialog")
            ),
        
            //4]General Dialog
            ElevatedButton(onPressed: (){
             showGeneralDialog(context: context, barrierDismissible: true,
                 barrierLabel: "Custom",
                 pageBuilder: (_, __, ___) {
                   return Center(
                     child: Container(
                         margin: EdgeInsets.symmetric(horizontal: 11),
                         padding: EdgeInsets.symmetric(horizontal: 11),
                         height: 250,
                         decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green.shade200,),
                       child: Material(
                         color: Colors.transparent,
                         child:Column(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             TextField(),
                             TextField(),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                               ElevatedButton(
                                   onPressed: (){
                                     Navigator.pop(context);
                                   },
                                   child: Text("ADD")),
                               ElevatedButton(
                                   onPressed: (){
                                     Navigator.pop(context);
                                   },
                                   child: Text("Cacel")),
                             ],
                             )
                           ],
                         ),
                       )
        
                     ),
                   );
                 },
             );
            },
                child: Text("General Dialog")
            ),
        
            //5] SnackBar
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You\ r back online "),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.symmetric(vertical: 11),
                    padding: EdgeInsets.symmetric(vertical: 11),
                    action: SnackBarAction(
                        label: "Proceed", onPressed: (){},
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                    ), showCloseIcon: true,
                  ));
                }, 
                child: Text("SnackBar")
            ),
        
            //6] ShowDatePicker
            ElevatedButton(
                onPressed: ()async{
               var dateTime =  await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1998,10,20),
                      lastDate: DateTime.now()
                  );
               if(dateTime!=null){
                 print("${dateTime.year}/ ${dateTime.month}/ ${dateTime.day}");
               }
                },
                child:Text("Show Date Picker")
            ),
        
            //7] ShowDateRangePicker
            ElevatedButton(
                onPressed: ()async{
                 var dateRange = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2000,8,29),
                      lastDate: DateTime.now(),
                  );
                 if(dateRange!= null){
                   print("Start Date: ${dateRange.start.year}/${dateRange.start.month}/${dateRange.start.day}");
                   print("End Date: ${dateRange.start.year}/${dateRange.start.month}/${dateRange.start.day}");
        
                 }
                },
                child: Text("ShowDateRangePicker")
            ),
        
            //8] ShowTimePicker
            ElevatedButton(
                onPressed: ()async{
                var timePicker=  await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
        
                );
                if(timePicker!=null){
                  print("${timePicker.hour}/${timePicker.minute}}");
        
                }
                },
                child: Text("ShowTimePicker")
            ),
        
            //9] ShowCupertinomodalPopup
            ElevatedButton(onPressed: (){
              showCupertinoModalPopup(context: context,
                  builder: (_){
                return Container(
                  height: 250,
                  color: Colors.blue.shade200,
                  child: CupertinoDatePicker(
                      onDateTimeChanged: (value) {
                        print("Selected Date:  ${value.year}/ ${value.month}/ ${value.day}/");
                        print("Selected Time:  ${value.hour}/ ${value.minute}");
                      },
                    initialDateTime: DateTime.now(),
                    maximumDate: DateTime.now().add(Duration(days: 7)),
                    minimumDate: DateTime(2000,8,29),
                  ),
                );
                  }
              );
            },
                child: Text("ShowCupertinoModalPopup")
            ),
        
            //10] CheckBox
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (value){
                      isChecked=value!;
                      setState(() {
        
                      });
                      print(isChecked);
                    },
                  activeColor: Colors.green,
                  checkColor: Colors.yellow,
                  shape:  BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
                  splashRadius: 25,
                  fillColor:MaterialStateColor.resolveWith((state){
                    if(state.contains(MaterialState.selected)){
                      return Colors.green;
                    }
                    return Colors.purpleAccent.shade200;
                    print(state);
                  }),
        
        
                ),
                Text("Remember me"),
              ],
            ),
        
        
        
            //11] CheckBox Adaptive
            Checkbox.adaptive(
              value: isChecked,
              onChanged: (value){
                isChecked=value!;
                setState(() {
        
                });
                print(isChecked);
              },
              activeColor: Colors.green,
              checkColor: Colors.yellow,
              shape:  BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
              splashRadius: 25,
              fillColor:MaterialStateColor.resolveWith((state){
                if(state.contains(MaterialState.selected)){
                  return Colors.green;
                }
                return Colors.purpleAccent.shade200;
                print(state);
              }),
        
        
            ),
        
        
            //12] CheckBoxListTile option for name With CheckBox
            CheckboxListTile(
              title:Text("Remember Me") ,
                subtitle: Text("for More Info Contact Me"),
                isThreeLine:  true,
                controlAffinity: ListTileControlAffinity.leading,
                value: isChecked,
                onChanged: (value){
                  isChecked=value!;
                  setState(() {
        
                  });
                }
            ),
        
            //13] Radio Button
            Row(
              children: [
                Radio(
                    value: listRadioOption[0],
                    groupValue: SelectedGender,
                    onChanged: (value){
                      SelectedGender=value!;
                      setState(() {
        
                      });
                    }
                ),
                Text("male")
        
              ],
            ),
        
        
            //15] RadioListTile
            RadioListTile(
              title: Text("${listRadioOption[1]}"),
                value: listRadioOption[1],
                groupValue: SelectedGender,
                onChanged: (value){
                  SelectedGender=value!;
                  print(value);
                  setState(() {
        
                  });
                }
            ),
        
        
            //16] Switch
        
            SwitchListTile(
              title: Text("Theme"),
                controlAffinity:  ListTileControlAffinity.leading,
                splashRadius: 34,
                activeColor: Colors.cyan,
                subtitle: Text("Change Your App Theme"),
                thumbIcon: MaterialStateProperty.resolveWith((states) {
                  if(states.contains(MaterialState.selected)){
                    return Icon(Icons.sunny, color: Colors.white,);
                  }
                  return Icon(Icons.nightlight);
                }),
                thumbColor: MaterialStateColor.resolveWith((states){
                  print(states);
                  if(states.contains(MaterialState.selected)){
                    return Colors.amber;
                  }
                  return Colors.black;
                }),

                value: isOpen,
                onChanged: (value){
                isOpen=value!;
                setState(() {

                });
        
                }
            )
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
            
          ],
        ),
      ),


      //14] extend name with floatingActionButton
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add"),
          icon: Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
          ),

          onPressed: (){}
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,

    );

  }
}
