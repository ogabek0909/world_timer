import 'package:flutter/material.dart';
import 'package:world_timer/pages/home.dart';
import 'package:world_timer/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    //initialRoute: '/home',
    routes: {
      '/loading': (context) => LoadingPage(),
      '/home': (context) => Home(),
      '/chooseLocation': (context) => LoadingPage()
    },
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController txt=TextEditingController(text: '');
  List<String> name=[];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To MyApplication'),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        centerTitle: true,
        
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  
                  controller: txt,
                  decoration: InputDecoration(
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                setState(() {
                  if (txt.text.length!=0){
                    name.add(txt.text);
                  }
                  txt.text='';
                });
              }, child: Container(
                child: Text('Adding'),),),
            ],
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(width: 0.5)
                  ),
                  child: Center(child: Text(name[index],style: TextStyle(fontSize: 25),)),
                  ),
                leading: IconButton(onPressed: (){}, icon: Icon(Icons.people)),
                trailing: ElevatedButton(onPressed: (){
                  setState(() {
                    name.removeAt(index);
                  });
                },child: Icon(Icons.delete_forever),onLongPress: (){
                  Navigator.pushNamed(context, '/home');
                },),
              );
            },
            itemCount: name.length,
            
            ),
          ),
        ],
      ),
    );
  }
}