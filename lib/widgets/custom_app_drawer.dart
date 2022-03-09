import 'package:flutter/material.dart';
import 'package:milkiyat/themes/colors.dart';

Widget customAppDrawer(context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 56),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Icon(Icons.person, color: colorGrey[500]),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Text(
                'Login/ Signup',
                style: getHeadlineMedium(context),
              ),
            ),
            Expanded(child: Container()),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              color: colorYellow, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Send us your Requirements',
                    style: getHeadlineSmall(context)!.copyWith(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "'Can't find the right property?'",
                    style: getHeadlineSmall(context)!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700]),
                  ),
                ],
              ),
              Expanded(child: Container()),
              const Icon(Icons.question_mark),
            ],
          ),
        ),
        const ListTile(
          title: Text('Item 1'),
          leading: Icon(Icons.settings),
          subtitle: Text('Theme'),
        ),
        const ListTile(
          title: Text('Item 1'),
          leading: Icon(Icons.settings),
          subtitle: Text('Theme'),
        ),
        const ListTile(
          title: Text('Item 1'),
          leading: Icon(Icons.settings),
          subtitle: Text('Theme'),
        ),
        const ListTile(
          title: Text('Item 1'),
          leading: Icon(Icons.settings),
          subtitle: Text('Theme'),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              border: Border.all(
                  color: colorYellow, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calculate, color: colorYellow),
              Text(
                'Calculate Commision',
                style: getHeadlineSmall(context)!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
