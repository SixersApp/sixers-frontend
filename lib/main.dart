import 'dart:ui' as ui;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sixers/amplifyconfiguration.dart';
import 'package:sixers/views/auth/auth_gate.dart';
import 'package:sixers/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

late final ui.Image matchupPatternImage;

Future<ui.Image> loadUiImage(String assetPath) async {
  final ByteData data = await rootBundle.load(assetPath);
  final ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
  final ui.FrameInfo frame = await codec.getNextFrame();
  return frame.image;
}

Future<void> _configureAmplify() async {
  final auth = AmplifyAuthCognito();
  await Amplify.addPlugin(auth);
  await Amplify.configure(amplifyconfig);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await _configureAmplify();

  matchupPatternImage = await loadUiImage('assets/matchup_pattern.png');

  await Amplify.Auth.signOut();

  runApp(const ProviderScope(child: SixersApp()));
}

class SixersApp extends StatelessWidget {
  const SixersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sixers',
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      home: const AuthGate(),
    );
  }
}
