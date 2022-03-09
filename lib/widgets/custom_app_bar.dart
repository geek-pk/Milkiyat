import 'package:flutter/material.dart';

import '../themes/colors.dart';

Widget customAppBar(_scaffoldKey) {
  return Column(
    children: [
      const SizedBox(height: 40),
      Row(
        children: [
          InkWell(
            onTap: () {
              if (_scaffoldKey.currentState!.isDrawerOpen) {
                _scaffoldKey.currentState?.openEndDrawer();
              } else {
                _scaffoldKey.currentState?.openDrawer();
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.menu, color: colorWhite),
            ),
          ),
          Expanded(child: Container()),
          const Icon(Icons.location_pin, color: colorWhite,size: 20,),
          const Text(
            '1st Main Road',
            style: TextStyle(color: colorWhite),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.expand_more, color: colorWhite),
          ),
        ],
      ),
    ],
  );
}
