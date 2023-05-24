import 'package:flutter/material.dart';
import 'package:fluttertemplates/const/routeprovider.dart';

Widget imageLoader(String localSrc, String networkSrc) {
  return (routeProvider.loadFrom == 'local')
      ? Image.asset(localSrc)
      : Image.network(networkSrc);
}
