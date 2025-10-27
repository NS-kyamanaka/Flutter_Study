import 'package:flutter/material.dart';
import '../widgets/serch_input_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: null, 
          icon: Icon(Icons.person)
        ),
        actions: [
          IconButton(
            onPressed: null, 
            icon: Icon(Icons.notifications)
          ),
          IconButton(
            onPressed: null, 
            icon: Icon(Icons.person_add))
        ],
      ),
      body: 
      Column(children: [
        SearchInputField(),
        //TODO:Todoリストの表示(期限が近いものから順番に)
       ]
      )
    );
  }
}
