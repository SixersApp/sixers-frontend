import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'onboarding_provider.g.dart';

/// Represents the user's onboarding stage.
/// 0 => Basic Info, 1 => Experience, >=2 => Done
@riverpod
class OnboardingStage extends _$OnboardingStage {
  @override
  Future<int> build(String userId) async {
    try {
      final response = await Supabase.instance.client
          .from('profiles')
          .select('onboarding_stage')
          .eq('user_id', userId)
          .maybeSingle();

      if (response == null) {
        return 0;
      }

      final dynamic value = response['onboarding_stage'];
      if (value == null) return 0;
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    } catch (_) {
      return 0;
    }
  }

  /// Advance to a specific stage and refresh the provider state.
  Future<void> advanceTo(int nextStage) async {
    final client = Supabase.instance.client;
    final userId = client.auth.currentUser?.id;
    if (userId == null) return;

    await client.from('profiles').upsert({'user_id': userId, 'onboarding_stage': nextStage});

    state = AsyncData(nextStage);
  }

  /// Mark onboarding as completed (stage 2+)
  Future<void> complete() async {
    await advanceTo(2);
  }
}
