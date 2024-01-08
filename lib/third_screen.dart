import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/home_cubit.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class ThirdScreen extends StatefulWidget {
  final HomeCubit cubit;

  const ThirdScreen({super.key, required this.cubit});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<String> items = ["Flutter","Android","Ios","React Native","React","Angular","Java"];
  double slidingValue = 1;
  var selectedRange = RangeValues(4, 8);
  var labels = RangeLabels("hhhh", "wwwww");
  @override
  Widget build(BuildContext context) {
    print("Test tag");
    print("Test tag2");
    return BlocProvider.value(
      value: widget.cubit,
      child: Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            HomeCubit homeCubit = HomeCubit.get(context);
            return /*ScrollableListTabView(
                tabs: [
                  ScrollableListTab(
                      tab: ListTab(
                          label: Row(
                            children: [
                              Icon(
                                Icons.android,
                                color: Colors.green,
                                size: 20,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                "Android",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                      ),
                      body: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return Text("item: $index");
                          },
                        itemCount: 10,
                      )),
                  ScrollableListTab(
                      tab: ListTab(
                          label: Row(
                            children: [
                              Icon(
                                Icons.flutter_dash,
                                color: Colors.blue,
                                size: 20,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                "Flutter",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                      ),
                      body: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return Text("item: $index");
                          },
                        itemCount: 10,
                      )),
                  ScrollableListTab(
                      tab: ListTab(
                          label: Row(
                            children: [
                              Icon(
                                Icons.devices_rounded,
                                color: Colors.deepOrange,
                                size: 20,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                "Hardware",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                      ),
                      body: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return Text("item: $index");
                          },
                        itemCount: 10,
                      )),
                ]
            )*/ SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: RawScrollbar(
                      radius: Radius.circular(20),
                      thickness: 10,
                      trackColor: Colors.blue,
                      thumbColor: Colors.green,

                      child: ListView.builder(
                        padding: EdgeInsets.all(20),

                        itemBuilder: (context,index){
                          return Dismissible(
                            background: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              height: 100,
                              color: Colors.grey,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.check
                              ),
                            ),
                            secondaryBackground: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              height: 100,
                              color: Colors.blueGrey,
                              alignment: Alignment.center,
                              child: Icon(
                                  Icons.highlight_remove_rounded
                              ),
                            ),
                            key: Key(items[index]),
                            onDismissed: (direction){
                              setState(() {
                                items.removeAt(index);
                              });
                            },
                            child: Container(
                                height: 100,
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent
                                ),
                                child: Text(items[index])),
                          );
                        },
                        itemCount: items.length,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Slider(
                      value: slidingValue,
                      onChanged: (value){
                        setState(() {
                          slidingValue = value;
                        });
                      },
                      thumbColor: Colors.deepOrangeAccent,
                      activeColor: Colors.blueGrey,
                      inactiveColor: Colors.blueAccent,
                      label: slidingValue.toString(),
                      divisions: 9,
                      min: 1,
                      max: 10,
                  ),
                  SizedBox(height: 10,),
                  RangeSlider(
                    onChanged: (values){
                      setState(() {
                        selectedRange = values;
                      });
                    },
                    activeColor: Colors.blueGrey,
                    inactiveColor: Colors.yellow,
                    divisions: 9,
                    min: 1,
                    max: 10, values: selectedRange,
                    labels: labels,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
