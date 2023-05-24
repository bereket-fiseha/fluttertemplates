import 'package:flutter/material.dart';

class SearchAppbarPage extends StatelessWidget {
  const SearchAppbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SearchBar()),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(child: Container(height: 100, color: Colors.amber))
        ],
      )),
      body: const Center(
        child: Text("App Bar with search bar"),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  bool _isActive = false;
  String _textEntered = "";
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!_isActive)
          Text("App bar with search",
              style: Theme.of(context).appBarTheme.titleTextStyle),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: _isActive
                  ? Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                            hintText: 'Search for something',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isActive = false;
                                  });

                                  debugPrint(_textEntered);
                                },
                                icon: const Icon(Icons.close))),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isActive = true;
                        });
                      },
                      icon: const Icon(Icons.search)),
            ),
          ),
        ),
      ],
    );
  }
}
