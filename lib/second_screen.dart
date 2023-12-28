import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/constants.dart';
import 'package:practice/home_cubit.dart';
import 'package:practice/third_screen.dart';
import 'package:rive/rive.dart';
import 'package:textfield_search/textfield_search.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String gender = "male";
  Set<String> selectedValues = {};
  late TextEditingController controller;
  List<TestItem> courses = [
    TestItem(label: "Flutter", value: "Flutter"),
    TestItem(label: "Ios", value: "Ios"),
    TestItem(label: "Android", value: "Android"),
    TestItem(label: "React Native", value: "React Native"),
    TestItem(label: "Harmony OS", value: "Harmony OS"),
  ];
  List<ShirtSize> sizes = [
    ShirtSize("XS", "xs"),
    ShirtSize("S", "s"),
    ShirtSize("M", "m"),
    ShirtSize("L", "l"),
    ShirtSize("Xl", "xl"),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<HomeCubit>().increment();
          },
          child: Icon(
            Icons.add
          ),
        ),
        appBar: AppBar(
          title: Text("Second screen"),
        ),
        body: Column(
          children: [
            TextFieldSearch(
              controller: controller,
              label: "Search text",
              initialList: courses,
              minStringLength: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.blueGrey
              ),
              getSelectedValue: (value){
                print(value);
              },
              future: fetchSearchData,
            ),
            SizedBox(height: 21,),
            Tooltip(
              height: 20,
              textStyle: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16
              ),
              message: "Hi , I'm dash",
              showDuration: Duration(milliseconds: 700),
              preferBelow: false,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),

              ),
              child: Icon(
                Icons.flutter_dash,
                color: Colors.blue,
                size: 25,
              ),
            ),
            SizedBox(height: 21,),
            SizedBox(
              height: 30,
              child: SegmentedButton(
                  multiSelectionEnabled: true,
                  emptySelectionAllowed: true,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) =>states.contains(
                        MaterialState.selected)?Colors.deepOrange:Colors.white38
                    ),
                    fixedSize: MaterialStateProperty.resolveWith((states) =>
                      states.contains(MaterialState.selected)?Size(10, 10):Size(10, 10)
                    ),
                    maximumSize: MaterialStateProperty.resolveWith((states) =>
                    states.contains(MaterialState.selected)?Size(10, 10):Size(10, 10)
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity(horizontal: -3, vertical: -3),
                  ),
                  segments: sizes.map((e) => ButtonSegment(
                      value: e.value,
                    label: Text((e.label))
                  )).toList(),
                  selected:selectedValues,
                  onSelectionChanged: (values){
                    setState(() {
                      selectedValues = values;
                    });
                  },
              ),
            ),
            SizedBox(height: 21,),
            EasyAutocomplete(
              asyncSuggestions: (value)async{
                await Future.delayed(Duration(seconds: 1));
                return allCountries.where((element) => element.name.contains(value)).map((e) => "${e.emojie} ${e.name}").toList();
              },
              progressIndicatorBuilder: CircularProgressIndicator.adaptive(backgroundColor: Colors.deepOrange,),
              onSubmitted: (value){
                print(value);
              },
              onChanged: (value){
                print("Change value $value");
              },
            ),
            SizedBox(height: 21,),
            BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              HomeCubit cubit = HomeCubit.get(context);
              return InkWell(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(
                        builder: (context)=>ThirdScreen(cubit: cubit)
                    ));
                  },
                  child: Text(cubit.counter.toString()));
            },
),
            SizedBox(height: 21,),
            Row(
              children: [
                Expanded(
                  child: RadioMenuButton(

                      style: ButtonStyle(
                        surfaceTintColor: MaterialStateProperty.resolveWith(
                                (states) => states.contains(
                                MaterialState.selected
                            )?Colors.deepOrange:Colors.blue
                        )
                      ),
                      value: 'male',
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value??"";
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                              Icons.male
                          ),
                          SizedBox(width: 10,),
                          Text("Male")
                        ],
                      )
                  ),
                ),
                Expanded(
                  child: RadioMenuButton(
                      value: 'female',
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value??"";
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.female,
                          ),
                          SizedBox(width: 10,),
                          Text("Female")
                        ],
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 21,),
            Row(
              children: [
                Expanded(
                    child: CheckboxMenuButton(
                        value: gender == 'male',
                        onChanged: (value){

                        },
                        child: Row(
                          children: [
                            Icon(
                                Icons.male
                            ),
                            SizedBox(width: 10,),
                            Text("Male")
                          ],
                        )
                    )
                ),
                Expanded(
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.red,
                        disabledColor: Colors.blue,
                      ),
                      child: CheckboxMenuButton(

                          value: gender == 'female',
                          onChanged: (value){

                          },
                          child: Row(
                            children: [
                              Icon(
                                  Icons.female
                              ),
                              SizedBox(width: 10,),
                              Text("Female")
                            ],
                          )
                      ),
                    )
                ),
              ],
            )
          ],
        ),
      );
  }

  Future<List> fetchSearchData()async{
    await Future.delayed(Duration(seconds: 1));
    courses.add(TestItem(label: "React", value: "React"));
    courses.add(TestItem(label: "Angular", value: "Angular"));
    return courses;
  }
}
class TestItem {
  String label;
  dynamic value;
  TestItem({
    required this.label,
    required this.value
  });

  factory TestItem.fromJson(Map<String, dynamic> json) {
    return TestItem(
        label: json['label'],
        value: json['value']
    );
  }
}
class ShirtSize{
  String label;
  String value;
  ShirtSize(this.label,this.value);
}
