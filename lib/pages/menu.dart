import 'package:flutter/material.dart';
import 'package:fluttertemplates/const/routeprovider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("widgets"),
        ),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ExpandedContainerTab(
                tab: const Tab(
                  icon: CircleAvatar(child: Icon(Icons.animation)),
                  text: "AppBar",
                ),
                onTap: () =>
                    Navigator.pushNamed(context, routeProvider.animatedAppBar),
              ),
              ExpandedContainerTab(
                tab: const Tab(
                  icon: CircleAvatar(child: Icon(Icons.airplanemode_active)),
                  text: "Hero",
                ),
                onTap: () =>
                    Navigator.pushNamed(context, routeProvider.heroAnimation),
              ),
              ExpandedContainerTab(
                tab: const Tab(
                  icon: CircleAvatar(child: Icon(Icons.share_sharp)),
                  text: "TabBar ",
                ),
                onTap: () =>
                    Navigator.pushNamed(context, routeProvider.animatedTabbar),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ExpandedContainerTab(
                tab: const Tab(
                  icon: CircleAvatar(child: Icon(Icons.search)),
                  text: "Search",
                ),
                onTap: () =>
                    Navigator.pushNamed(context, routeProvider.searchappbar),
              ),
              ExpandedContainerTab(
                tab: const Tab(
                  icon: CircleAvatar(child: Icon(Icons.slideshow)),
                  text: "Slider",
                ),
                onTap: () =>
                    Navigator.pushNamed(context, routeProvider.sliders),
              ),
              ExpandedContainerTab(
                tab: const Tab(
                  icon: CircleAvatar(child: Icon(Icons.tab)),
                  text: "Tabs",
                ),
                onTap: () => Navigator.pushNamed(context, routeProvider.tabs),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ExpandedContainerTab(
                tab: const Tab(
                  icon:
                      CircleAvatar(child: Icon(FontAwesomeIcons.jetFighterUp)),
                  text: "FlyingJet",
                ),
                onTap: () =>
                    Navigator.pushNamed(context, routeProvider.flyingjet),
              ),
              ExpandedContainerTab(
                tab: const Tab(
                  icon: CircleAvatar(
                      child: Icon(
                    FontAwesomeIcons.apple,
                  )),
                  text: "Fruits",
                ),
                onTap: () => Navigator.pushNamed(context, '/fruitmenu'),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/animatedappbar'),
                child: const ContainerTab(
                    child: Tab(
                  icon: CircleAvatar(child: Icon(Icons.animation)),
                  text: "Animation",
                )),
              )
            ],
          ),
        ]));
  }
}

class ExpandedContainerTab extends StatelessWidget {
  final Widget tab;
  final VoidCallback onTap;
  const ExpandedContainerTab({
    required this.tab,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: onTap,
          child: ContainerTab(child: tab),
        ),
      ),
    );
  }
}

class ContainerTab extends StatelessWidget {
  final Widget child;
  const ContainerTab({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.amber, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: child,
    );
  }
}
