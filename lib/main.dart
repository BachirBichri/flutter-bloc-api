import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/counter/counter_bloc.dart';
import 'package:flutter_application_1/blocs/theme/theme_bloc.dart';
import 'package:flutter_application_1/blocs/user/user_bloc.dart';
import 'package:flutter_application_1/ui/pages/root_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => CounterBloc()),
      BlocProvider(create: (context) => ThemeBloc()),
      BlocProvider(create: (context) => UserBloc()),
    ], child: const RootView());
  }
}
