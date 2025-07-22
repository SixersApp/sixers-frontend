import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/player.dart';

part 'supabase.g.dart';

@riverpod
Future<List<Player>> playersFuture(Ref ref) async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('players').select().order('created_at');
  return (data as List).map((e) => Player.fromJson(e)).toList();
}
