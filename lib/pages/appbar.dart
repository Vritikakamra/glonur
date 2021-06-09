import 'package:flutter/material.dart';

class Appbarpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>DefaultTabController(length: 3,
  child: Scaffold(
    
      appBar: AppBar(
          title: Text('GLONUR'),
          centerTitle: true,
          
          actions: [
            IconButton(
               icon: Icon(Icons.notifications_none),
               onPressed: (){},
               ),
               IconButton(
               icon: Icon(Icons.search),
               onPressed: (){},),
                
          ],
          elevation: 1,
            flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue],
                begin: Alignment.bottomRight,
                end:Alignment.topLeft)
            ),
          ),
          
          bottom: TabBar(
            tabs: [
              Tab(icon:Icon(Icons.menu)) ,
              Tab(icon: Icon(Icons.home),text:'HOME'),
               Tab(icon: Icon(Icons.list_alt), text:'Index'),
               
            ],),

     )  ) );
  }
