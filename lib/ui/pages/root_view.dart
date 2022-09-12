import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/theme/theme_bloc.dart';
import 'package:flutter_application_1/ui/pages/counter_bloc.dart';
import 'package:flutter_application_1/ui/pages/counter_statefull.dart';
import 'package:flutter_application_1/ui/pages/git_users.dart';
import 'package:flutter_application_1/ui/pages/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          routes: {
            "/": (context) => const HomePage(),
            "/counter1": (context) => const CounterStateFullPage(),
            "/counter2": (context) => const CounterBlocPage(),
            "/users": (context) => const GitUsersPage(),
          },
          // initialRoute: '/',
          theme: state.theme,
        );
      },
    );
  }
}
