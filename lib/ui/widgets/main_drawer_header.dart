import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDrawerHeader extends StatelessWidget {
  const MainDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Theme.of(context).primaryColor])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/bachir-lo.jpeg"),
              radius: 50,
            ),
            IconButton(
                onPressed: () {
                  context.read<ThemeBloc>().add(SwitchThemeEvent());
                },
                icon: const Icon(Icons.settings))
          ],
        ));
  }
}
