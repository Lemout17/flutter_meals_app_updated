import 'package:flutter/material.dart';
import './screens/tabs.dart';

import './theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: const TabsScreen(),
    );
  }
}
