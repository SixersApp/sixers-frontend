import 'package:dio/dio.dart';
import 'package:sixers/backend/auth/dio_client.dart';
import 'package:sixers/backend/onboarding/profile_model.dart';
import 'package:sixers/utils/exceptions.dart';

class OnboardingService {
  final Dio _dio = ApiClient.dio;

  Future<ProfileModel?> fetchProfile(String userId) async {
    try {
      final res = await _dio.get("/users/profile");
      print(res.data["profile"]);
      return ProfileModel.fromJson(res.data["profile"]);
    } on DioException catch (e) {
      print("gay5 ${e.response!.data.toString()}");
      throw handleDioException(e);
    } catch (_) {
      print("gay 1");
      throw "Something unexpected occurred. Please try again later";
    }
  }

  Future<void> updateProfileData({required ProfileModel profileData}) async {
    final profileJson = profileData.toJson();
    try {
      await _dio.patch(
        '/users/profile',
        data: profileJson,
      );
    } on DioException catch (e) {
      print("gay6 ${e.response!.data.toString()}");
      throw handleDioException(e);
    } catch (_) {
      print("gay 2");
      throw "Something unexpected occurred. Please try again later";
    }
  }
}
