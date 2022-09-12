import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/widgets/drawer_item.dart';
import 'package:flutter_application_1/ui/widgets/main_drawer_header.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> items = [
      {
        'title': 'Home',
        'leadingIcon': Icons.home,
        'trailingIcon': Icons.arrow_forward_ios_rounded,
        'route': '/'
      },
      {
        'title': 'Counter StateFull',
        'leadingIcon': Icons.event,
        'trailingIcon': Icons.arrow_forward_ios_rounded,
        'route': '/counter1'
      },
      {
        'title': 'Counter Bloc',
        'leadingIcon': Icons.attribution_sharp,
        'trailingIcon': Icons.arrow_forward_ios_rounded,
        'route': '/counter2'
      },
      {
        'title': 'Git User',
        'leadingIcon': Icons.person,
        'trailingIcon': Icons.arrow_forward_ios_rounded,
        'route': '/users'
      }
    ];
    return Drawer(
      child: Column(
        children: [
          const MainDrawerHeader(),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return DrawerItem(
                        title: items[index]['title'],
                        leadingIcon: items[index]['leadingIcon'],
                        trailingIcon: items[index]['trailingIcon'],
                        onTap: () {
                          // Navigator.pop(context);
                          Navigator.popAndPushNamed(
                              context, items[index]['route']);
                        });
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 8,
                    );
                  },
                  itemCount: items.length))
        ],
      ),
    );
  }
}
