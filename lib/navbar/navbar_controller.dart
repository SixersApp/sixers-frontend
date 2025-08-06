
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navbar_controller.g.dart';

@riverpod
class NavbarController extends _$NavbarController {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}
