
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../home_flow_delegate.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  double animate = 0;
  double animate2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Flow(
          delegate: HomeFlowDelegate(CurvedAnimation(
              parent: controller,
              curve: Curves.linear)),
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: (){
                  controller.status == AnimationStatus.completed
                      ?controller.reverse()
                      :controller.forward();
                },
                child:  Icon(
                    Icons.add
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: (){},
                child:  Icon(
                    Icons.access_alarms
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: (){},
                child:   Icon(
                    Icons.add_alert
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: (){
                  controller.status == AnimationStatus.completed
                      ?controller.reverse()
                      :controller.forward();
                },
                child:    Icon(
                    Icons.add_card
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(
            children: [
              DropdownMenu(

                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                        value: "test",
                        label: "test"
                    ),
                    DropdownMenuEntry(
                        value: "test2",
                        label: "test2"
                    ),
                    DropdownMenuEntry(
                        value: "test3",
                        label: "test3"
                    ),
                  ]
              ),
              DropdownButton(
                  hint: Text("Choose one option"),
                  items: [
                    DropdownMenuItem(child: Text("Test1"),value: "test1"),
                    DropdownMenuItem(child: Text("Test2"),value: "test2"),
                    DropdownMenuItem(child: Text("Test3"),value: "test3"),
                  ],
                  onChanged: (value){}
              )
            ],
          ),
          Gap( 20,),
          Center(
            child: InteractiveViewer(
              boundaryMargin: EdgeInsets.all(20),// make widget interactive like zoom
              child: Text(
                "Hello World",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
          ),
          Gap( 20,),
          PhysicalModel(
              color: Colors.black,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.blueAccent[500],
              ),
              elevation: 20,
              shadowColor: Colors.purple,
              borderRadius: BorderRadius.circular(30),
          ),
          Gap( 40,),
          Text("look at me",style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),).animate(effects: [
            ShimmerEffect(duration: Duration(milliseconds: 800)),
          ],onPlay: (controller) => controller.repeat())
              .animate(target:animate,effects: [
                SlideEffect(
                    duration: Duration(milliseconds: 2000),
                    begin: Offset(-20, 0),end: Offset(0, 0))
          ]),
          Gap( 60,),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  animate = 1;
                });
              },
              child: Text("Animate")),

        ],
      ),
    );
  }

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    return super.initState();
  }
}
