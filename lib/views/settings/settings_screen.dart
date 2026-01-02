import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sixers/backend/auth/auth_provider.dart';
import 'package:sixers/backend/auth/g_auth_origin_provider.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/views/auth/sign_in_screen.dart';

class SettingsScreen extends ConsumerWidget {
  static final String route = "/settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black100,
        titleSpacing: 20,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: PhosphorIcon(PhosphorIcons.caretLeft(), size: 24),
            ),
            const SizedBox(width: 20),
            Text("SETTINGS", style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildOption(
                context,
                title: "Account",
                subtitle: "Personal Info, Experience, etc.",
                icon: PhosphorIcon(PhosphorIcons.user(), size: 25),
                path: "/settings/account",
              ),
              const SizedBox(height: 20,),
              _buildOption(
                context,
                title: "Notifications",
                subtitle: "Manage league and team notifiations",
                icon: PhosphorIcon(PhosphorIcons.bell(), size: 25),
                path: "/settings/notifications",
              ),
              const Spacer(),
              FilledButton(
                onPressed: () async {
                  ref
                      .read(gAuthOriginProvider.notifier)
                      .changeOrigin(SignInScreen.route);
                  await ref.read(authProviderProvider.notifier).signOut();
                },
                child: Row(
                  children: [
                    PhosphorIcon(PhosphorIcons.signOut(), size: 20,),
                    Expanded(child: Text("Log Out", textAlign: TextAlign.center,))
                  ],
                ),
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildOption(
  BuildContext context, {
  required String title,
  required String subtitle,
  required Widget icon,
  required String path,
}) {
  return GestureDetector(
    onTap: () {
      context.push(path);
    },
    child: Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.black400,
          ),
          alignment: Alignment.center,
          child: icon,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            Text(
              subtitle,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: AppColors.black600),
            ),
          ],
        ),
        const Spacer(),
        PhosphorIcon(PhosphorIcons.caretRight(), size: 24),
      ],
    ),
  );
}
      // body: Center(
      //   child: TextButton(
      //     onPressed: () async {
      //     },
      //     child: const Text('Sign Out'),
      //   ),
      // ),