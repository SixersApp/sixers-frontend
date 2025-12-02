// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';
// import 'package:sixers/backend/fantasy_team/fantasy_team_provider.dart';
// import 'package:sixers/backend/leagues/league_model.dart';
// import 'package:sixers/backend/leagues/league_provider.dart';
// import 'package:sixers/theme/colors.dart';
// import 'package:go_router/go_router.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:collection/collection.dart';

// /// A compact header dropdown that shows the current app section title
// /// and opens a popup listing a user's leagues fetched from Supabase.
// ///
// /// The initial button matches the design: bold label with a chevron.
// /// Usage:
// ///   Place inside any `AppBar` title or header row.
// class LeagueDropdown extends ConsumerWidget {
//   const LeagueDropdown({super.key, this.onSelected, this.label = 'SIXERS', this.width = 'auto', this.selectedLeague});

//   /// Callback when a league is selected from the menu
//   final ValueChanged<League>? onSelected;

//   /// Initial label to display on the button before selection
//   final String label;

//   final String width;

//   final League? selectedLeague;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final leaguesAv = ref.watch(leaguesProvider);
//     final currentUserId = Supabase.instance.client.auth.currentUser?.id;

//     // Button look
//     final textStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.black800);

//     return Theme(
//       data: Theme.of(context).copyWith(
//         popupMenuTheme: PopupMenuThemeData(
//           color: AppColors.black200,
//           surfaceTintColor: Colors.transparent,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           elevation: 8,
//           textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black800),
//         ),
//       ),
//       child: PopupMenuButton<League?>(
//         onSelected: (value) {
//           if (value != null) {
//             onSelected?.call(value);
//           }
//         },
//         itemBuilder: (ctx) {
//           final List<PopupMenuEntry<League?>> entries = [
//             const PopupMenuDivider(height: 8),
//             PopupMenuItem<League?>(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               child: Row(
//                 children: [
//                   Icon(PhosphorIcons.plusCircle(), size: 18, color: AppColors.black800),
//                   const SizedBox(width: 10),
//                   const Text('Create New League'),
//                 ],
//               ),
//               onTap: () => GoRouter.of(ctx).push('/create-league'),
//             ),
//             PopupMenuItem<League?>(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               child: Row(
//                 children: [
//                   Icon(PhosphorIcons.signIn(), size: 18, color: AppColors.black800),
//                   const SizedBox(width: 10),
//                   const Text('Join New League'),
//                 ],
//               ),
//               onTap: () => GoRouter.of(ctx).push('/joinLeague'),
//             ),
//           ];

//           final leagueItems = leaguesAv.maybeWhen(
//             data: (leagues) {
//               if (leagues.isEmpty) {
//                 return [const PopupMenuItem<League?>(enabled: false, child: Text('No leagues yet'))];
//               }
//               return leagues
//                   .map(
//                     (l) => PopupMenuItem<League?>(
//                       value: l,
//                       child: Consumer(
//                         builder: (context, ref, child) {
//                           final teamsAv = ref.watch(fantasyTeamsProvider(leagueId: l.id));
//                           return teamsAv.when(
//                             data: (teams) {
//                               final userTeam = teams.firstWhereOrNull((team) => team.userId == currentUserId);
//                               final teamName = userTeam?.teamName ?? 'No Team';
//                               return LeagueItem(league: l, teamName: teamName);
//                             },
//                             loading: () => LeagueItem(league: l, teamName: 'Loading...'),
//                             error: (_, __) => LeagueItem(league: l, teamName: 'Error'),
//                           );
//                         },
//                       ),
//                     ),
//                   )
//                   .toList();
//             },
//             loading: () => [
//               const PopupMenuItem<League?>(
//                 enabled: false,
//                 child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)),
//               ),
//             ],
//             orElse: () => [const PopupMenuItem<League?>(enabled: false, child: Text('Failed to load leagues'))],
//           );

//           return [...leagueItems, ...entries];
//         },
//         child: Container(
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
//           padding: EdgeInsets.only(right: 20),
//           child: Row(
//             mainAxisSize: width == "auto" ? MainAxisSize.min : MainAxisSize.max,
//             mainAxisAlignment: width == "fill" ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
//             children: [
//               selectedLeague != null
//                   ? Expanded(
//                       child: Consumer(
//                         builder: (context, ref, child) {
//                           final teamsAv = ref.watch(fantasyTeamsProvider(leagueId: selectedLeague!.id));
//                           return teamsAv.when(
//                             data: (teams) {
//                               final userTeam = teams.firstWhereOrNull((team) => team.userId == currentUserId);
//                               final teamName = userTeam?.teamName ?? 'No Team';
//                               return LeagueItem(league: selectedLeague!, teamName: teamName);
//                             },
//                             loading: () => LeagueItem(league: selectedLeague!, teamName: 'Loading...'),
//                             error: (_, __) => LeagueItem(league: selectedLeague!, teamName: 'Error'),
//                           );
//                         },
//                       ),
//                     )
//                   : Row(
//                       children: [
//                         Image.asset('assets/sixers_logo.png', width: 24, height: 24),
//                         const SizedBox(width: 8),
//                         Text(label, style: textStyle),
//                       ],
//                     ),
//               Icon(PhosphorIcons.caretDown(PhosphorIconsStyle.fill), color: AppColors.black800, size: 18),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _LeagueAvatar extends StatelessWidget {
//   const _LeagueAvatar({required this.name});
//   final String name;

//   @override
//   Widget build(BuildContext context) {
//     final bg = AppColors.black300;
//     final fg = AppColors.black800;
//     final String initials = name.trim().isEmpty
//         ? '?'
//         : name.split(RegExp(r"\s+")).where((p) => p.isNotEmpty).map((p) => p[0].toUpperCase()).take(2).join();
//     return Container(
//       width: 28,
//       height: 28,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
//       child: Text(
//         initials,
//         style: Theme.of(context).textTheme.labelMedium?.copyWith(color: fg, fontWeight: FontWeight.w700),
//       ),
//     );
//   }
// }

// class LeagueItem extends StatelessWidget {
//   const LeagueItem({super.key, required this.league, required this.teamName});
//   final League league;
//   final String teamName;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         _LeagueAvatar(name: league.name),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 league.name,
//                 style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   height: 1.0,
//                   // Remove extra letter spacing or padding if present
//                 ),
//               ),
//               SizedBox(height: 2),
//               Text(
//                 teamName,
//                 style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w400, height: 1.0),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
