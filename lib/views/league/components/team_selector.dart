import 'package:flutter/material.dart';
import 'package:sixers/backend/fantasy_team/fantasy_team_model.dart';
import 'package:sixers/theme/colors.dart';
import 'package:sixers/utils/string_to_avatar.dart';

class TeamSelector extends StatelessWidget {
  final List<FantasyTeam> teams;
  final int selectedIndex;
  final ValueChanged<int> onTeamSelected;

  const TeamSelector({
    super.key,
    required this.teams,
    required this.selectedIndex,
    required this.onTeamSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: teams.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final team = teams[index];
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTeamSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.black300 : AppColors.black200,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.black400, width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: stringToColor(team.teamColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: _buildTeamIcon(team, isSelected),
                    ),
                  ),
                  const SizedBox(width: 5),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    alignment: Alignment.centerLeft,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        isSelected
                            ? team.teamName
                            : _getTeamAbbreviation(team.teamName),
                        key: ValueKey('${team.id}_$isSelected'),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.black800,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getTeamAbbreviation(String teamName) {
    if (teamName.isEmpty) return '?';

    // Split by spaces and take first letter of each word, max 3 letters
    final words = teamName.trim().split(' ');
    if (words.length >= 2) {
      return words
          .map((w) => w.isNotEmpty ? w[0] : '')
          .take(3)
          .join()
          .toUpperCase();
    }

    // If single word, take first 3 letters
    return teamName
        .substring(0, teamName.length >= 3 ? 3 : teamName.length)
        .toUpperCase();
  }

  Widget _buildTeamIcon(FantasyTeam team, bool isSelected) {
    if (team.teamIcon != null && team.teamIcon!.isNotEmpty) {
      // Use the asset image from stringToAvatar
      return Image.asset(
        stringToAvatar(team.teamIcon),
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // Fallback to initials if image fails to load
          return _buildInitials(team, isSelected);
        },
      );
    } else {
      // Show initials if no icon
      return _buildInitials(team, isSelected);
    }
  }

  Widget _buildInitials(FantasyTeam team, bool isSelected) {
    final initials = team.teamName
        .split(' ')
        .map((w) => w.isNotEmpty ? w[0] : '')
        .take(2)
        .join()
        .toUpperCase();
    return Center(
      child: Text(
        initials,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey.shade500,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
