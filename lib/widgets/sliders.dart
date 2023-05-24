import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Sliders")),
        body: const NormalSlider());
  }
}

class NormalSlider extends StatefulWidget {
  const NormalSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<NormalSlider> createState() => _NormalSliderState();
}

class _NormalSliderState extends State<NormalSlider>
    with SingleTickerProviderStateMixin {
  double _value = 0;
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(microseconds: 5000));
    _animation = Tween<Offset>(
            begin: Offset(0, _value), end: Offset(0, _value + 10))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _controller.addListener(() {
      setState(() {
        _value += 15;
      });
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _value.round().toString(),
          style: const TextStyle(fontSize: 50),
        ),
        const SizedBox(
          height: 50,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              trackHeight: 10.0,
              trackShape: const RoundedRectSliderTrackShape(),
              activeTrackColor: Colors.purple.shade800,
              inactiveTrackColor: Colors.purple.shade100,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 14.0,
                pressedElevation: 8.0,
              ),
              valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
              overlayColor: Colors.pink.withOpacity(0.2),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 32.0),
              tickMarkShape: const RoundSliderTickMarkShape(),
              valueIndicatorColor: Colors.black,
              valueIndicatorTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              )),
          child: Slider(
            label: '${_value.round()}',
            min: 0,
            max: 100,
            divisions: 20,
            value: _value,
            onChanged: (value) => {
              setState(() {
                _value = value;
              })
            },
          ),
        ),
        Transform.translate(
          offset: Offset(0, -(_value * 4) + 450),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FaIcon(
                color: Colors.green,
                FontAwesomeIcons.planeUp,
                size: (_value / 5) + 30,
              ),
              Icon(
                FontAwesomeIcons.jetFighterUp,
                color: Colors.red,
                size: (_value / 1.2) + 80,
              ),
              Icon(
                FontAwesomeIcons.planeUp,
                color: Colors.yellow,
                size: (_value / 5) + 30,
              ),
            ],
          ),
        )
        //  SlideTransition(position: _animation)
      ],
    );
  }
}
