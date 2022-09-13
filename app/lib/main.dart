import 'package:cojekjidlu/locator.dart';
import 'package:cojekjidlu/routes.dart';
import 'package:cojekjidlu/services/nav_service.dart';
import 'package:cojekjidlu/services/state_service.dart';
import 'package:cojekjidlu/theme.dart';
import 'package:cojekjidlu/views/nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navService = locator.get<NavService>();
  final stateService = locator.get<StateService>();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => stateService,
      child: GestureDetector(
        onTap: () {
          // Dismiss soft keyboard when tapping outside of input field
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: GlobalLoaderOverlay(
          child: MaterialApp(
            title: 'Co k jídlu',
            theme: baseTheme,
            home: const NavBarView(),
            navigatorKey: navService.navigatorKey,
            onGenerateRoute: (RouteSettings settings) => Routes.generateRoute(settings),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('cs', ''),
            ],
          ),
        ),
      ),
    );
  }
}
