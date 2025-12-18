import 'package:dio/dio.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/backend/onboarding/profile_model.dart';
import 'package:sixers/utils/exceptions.dart';

class OnboardingService {
  final Dio _dio = ApiClient.dio;

  Future<ProfileModel?> fetchProfile(String userId) async {
    try {
      final res = await _dio.get("/profile/$userId");
      return ProfileModel.fromJson(res.data);
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (_) {
      throw "Something unexpected occurred. Please try again later";
    }
  }

  Future<void> updateProfileData({required ProfileModel profileData}) async {
    try {
      await _dio.put(
        '/users/profile/${profileData.userId}',
        data: profileData.toJson(),
      );
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (_) {
      throw "Something unexpected occurred. Please try again later";
    }
  }
}
