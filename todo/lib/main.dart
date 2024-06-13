import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo/common/show_model.dart';
import 'package:todo/widget/task_todo_widget.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter project template',
      theme: ThemeData(),
      home: const HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.pink.shade100,
            radius: 20,
            child: Image.asset('assets/profile.png'),
          ),
          title: Text(
            'Hello I`m',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
          subtitle: Text(
            'ktlnan',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.calendar),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.bell),
              )
            ]),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today`s tasks',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'Wednesday, 12 june',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade300,
                  foregroundColor: Colors.pink.shade600,
                  elevation: 0,
                ),
                onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  context: context,
                  builder: (context) => AddNewTaskModel(),
                ),
                child: Text(
                  '+ New Task',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              // Card list
            ],
          ),
          const Gap(20),
          ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context, index) => CardToDoListWidget(),
          )
        ]),

      )),
    );
  }
}

