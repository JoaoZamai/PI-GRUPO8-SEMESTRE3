import 'package:flutter/material.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PACKBAG - Máquina de Corte',
      initialRoute: AppRoutes.splash,
      routes: AppPages.routes,
    );
  }
}
