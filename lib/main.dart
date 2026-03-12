import 'dart:ui' as ui;

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sixers/amplifyconfiguration.dart';
import 'package:sixers/theme/app_theme.dart';
import 'package:sixers/views/router.dart';

late final ui.Image matchupPatternImage;
late final ui.Image batPatternImage;
late final ui.Image bowlPatternImage;
late final ui.Image allrounderPatternImage;
late final ui.Image wicketkeeperPatternImage;

Future<ui.Image> loadUiImage(String assetPath) async {
  final ByteData data = await rootBundle.load(assetPath);
  final ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
  final ui.FrameInfo frame = await codec.getNextFrame();
  return frame.image;
}

Future<void> _configureAmplify() async {
  final auth = AmplifyAuthCognito();
  final api = AmplifyAPI();
  await Amplify.addPlugins([auth, api]);
  await Amplify.configure(amplifyconfig);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await _configureAmplify();

  matchupPatternImage = await loadUiImage('assets/matchup_pattern.png');
  batPatternImage = await loadUiImage('assets/bat_pattern.png');
  bowlPatternImage = await loadUiImage('assets/bowl_pattern.png');
  allrounderPatternImage = await loadUiImage('assets/allrounder_pattern.png');
  wicketkeeperPatternImage = await loadUiImage('assets/wicketkeeper_pattern.png');
  runApp(const ProviderScope(child: SixersApp()));
}

class SixersApp extends ConsumerWidget {
  const SixersApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sixers',
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}
