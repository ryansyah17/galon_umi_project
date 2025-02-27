import 'package:flutter/material.dart';
import 'package:galon_umi_project/infrastructure/theme/constant/colors.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute = await Routes.initialRoute;
  await initializeDateFormatting('id_ID', null).then(
    (_) => {
      runApp(
        Main(initialRoute),
      ),
    },
  );
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          centerTitle: false,
          titleTextStyle: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          toolbarHeight: 80,
        ),
      ),
    );
  }
}
