import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplates/widgets/tabcode.dart';

class Tabs extends StatefulWidget {
  @override
  State<Tabs> createState() => _TabsState();
}

enum tabs { Tab1, Tab2, tab3 }

class _TabsState extends State<Tabs> {
  late int selectedTab;
  @override
  void initState() {
    // TODO: implement initState

    selectedTab = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tabs")),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Container(
                  height: 200,
                  child: DropdownButton(
                      value: selectedTab,
                      onChanged: (value) => {
                            setState(() {
                              selectedTab = value!;
                            })
                          },
                      items: listOfTabText
                          .map((tabtext) => DropdownMenuItem(
                                value: listOfTabText.indexOf(tabtext),
                                child: Text(tabtext),
                              ))
                          .toList())),
              SelectedTabBar(selectedTab, listOfWidgets)
            ],
          ),
        ));
  }

  List<String> listOfTabText = ["Tab1", "Tab2", "Tab3"];

  List<Widget> listOfWidgets = [
    Center(child: Text("Text 1")),
    Center(child: Text("Text 2")),
    Center(child: Text("Text 3")),
  ];
}

class TabBar1 extends StatelessWidget {
  TabBar1({
    Key? key,
    required this.listOfWidgets,
  }) : super(key: key);

  final List<Widget> listOfWidgets;
  List<Tab> listOfTabs = [
    const Tab(
        child: Text(
      "Tab 1",
      style: TextStyle(color: Colors.black54),
    )),
    const Tab(
        child: Text(
      "Tab 2",
      style: TextStyle(color: Colors.black54),
    )),
    const Tab(
        child: Text(
      "Tab 3",
      style: TextStyle(color: Colors.black54),
    )),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: TabBar(tabs: listOfTabs),
              body: TabBarView(
                children: listOfWidgets,
              ))),
    );
  }
}

class TabBar2 extends StatelessWidget {
  TabBar2({
    Key? key,
    required this.listOfWidgets,
  }) : super(key: key);

  final List<Widget> listOfWidgets;

  List<Tab> listOfTabs = [
    const Tab(
        icon: Icon(Icons.home, color: Colors.amber),
        child: Text(
          "Tab 1",
          style: TextStyle(color: Colors.amber),
        )),
    const Tab(
        icon: Icon(Icons.mobile_friendly, color: Colors.amber),
        child: Text(
          "Tab 2",
          style: TextStyle(color: Colors.amber),
        )),
    const Tab(
        icon: Icon(
          Icons.alarm,
          color: Colors.amber,
        ),
        child: Text(
          "Tab 3",
          style: TextStyle(color: Colors.amber),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: TabBar(
                indicatorColor: Colors.red,
                tabs: listOfTabs,
                indicatorSize: TabBarIndicatorSize.label,
              ),
              body: Theme(
                data: ThemeData(textTheme: TextTheme()),
                child: TabBarView(
                  children: listOfWidgets,
                ),
              ))),
    );
  }
}

class TabBar3 extends StatelessWidget {
  TabBar3({
    Key? key,
    required this.listOfWidgets,
  }) : super(key: key);

  final List<Widget> listOfWidgets;
  List<Tab> listOfTabs = [
    const Tab(
        child: Text(
      "Tab 1",
      style: TextStyle(color: Colors.black54),
    )),
    const Tab(
        child: Text(
      "Tab 2",
      style: TextStyle(color: Colors.black54),
    )),
    const Tab(
        child: Text(
      "Tab 3",
      style: TextStyle(color: Colors.black54),
    )),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
              body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0)),
                child: TabBar(
                  tabs: listOfTabs,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.green),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: listOfWidgets,
                ),
              ),
            ],
          ))),
    );
  }
}

Widget SelectedTabBar(int selectedTab, List<Widget> listOfWidgets) {
  List<Widget> listOfTabBars = [
    TabBar1(listOfWidgets: listOfWidgets),
    TabBar2(listOfWidgets: listOfWidgets),
    TabBar3(listOfWidgets: listOfWidgets)
  ];

  return listOfTabBars[selectedTab];
}
