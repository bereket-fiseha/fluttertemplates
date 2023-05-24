import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetModal extends StatelessWidget {
  const BottomSheetModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bottom sheet modal"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("show modal"),
          onPressed: () {
            showBottomSheetModal(context);
          },
        ),
      ),
    );
  }

  void showBottomSheetModal(BuildContext context) {
    var heightOfScreen = MediaQuery.of(context).size.height;
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfContainer = heightOfScreen / 2;
    showModalBottomSheet(
        context: context,
        builder: (context) => Stack(children: [
              Container(
                color: Colors.black54,

                height: heightOfContainer,
                //      color: Colors.green,
              ),
              Positioned(
                  top: heightOfContainer / 5,
                  left: 0,
                  child: Container(
                    color: Colors.orange,
                    width: widthOfScreen,
                    height: heightOfContainer,
                  )),
              Positioned(
                  top: heightOfContainer / 10,
                  left: widthOfScreen / 2 - (widthOfScreen / 6),
                  child: Container(
                    height: heightOfContainer / 3,
                    width: widthOfScreen / 3,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/mygift.jpg"),
                          fit: BoxFit.cover),
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.circular(heightOfContainer / 6),
                    ),
                  ))
            ]));
  }
}
