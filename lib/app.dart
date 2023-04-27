import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meals_app_updated/blocs/favorite_meals_cubit/favorite_meals_cubit.dart';
import 'package:flutter_meals_app_updated/blocs/filters_bloc/filters_bloc.dart';
import './screens/tabs.dart';

import './theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FiltersBloc(),
        ),
        BlocProvider(
          create: (_) => FavoriteMealsCubit(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.theme,
        home: const TabsScreen(),
      ),
    );
  }
}
