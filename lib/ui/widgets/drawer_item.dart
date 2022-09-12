import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Function onTap;

  const DrawerItem(
      {Key? key,
      required this.title,
      required this.leadingIcon,
      required this.trailingIcon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.headline6),
      onTap: () => onTap(),
      leading: Icon(leadingIcon),
      trailing: Icon(trailingIcon),
      iconColor: Theme.of(context).primaryColor,
    );
  }
}
