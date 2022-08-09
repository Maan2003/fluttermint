import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttermint/data/prefs.dart';
import 'package:fluttermint/router.dart';
import 'package:fluttermint/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './client.dart';

late SharedPreferences prefs;

final prefProvider = createPrefProvider(
  prefs: (_) => prefs,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  final bool joined = await api.init();
  runApp(ProviderScope(child: App(joined: joined)));
}

class App extends ConsumerWidget {
  final bool joinedFederation;
  const App({Key? key, required bool joined})
      : joinedFederation = joined,
        super(key: key);

  static const title = 'Fluttermint';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    if (joinedFederation) {
      ref.read(prefProvider.notifier).update("this should be a bool?");
    } else {
      ref.read(prefProvider.notifier).update(null);
    }

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: white,
          primarySwatch: materialWhite,
          textTheme: textThemeDefault,
          backgroundColor: white,
          scaffoldBackgroundColor: black,
          fontFamily: "Inter"),
    );
  }
}
