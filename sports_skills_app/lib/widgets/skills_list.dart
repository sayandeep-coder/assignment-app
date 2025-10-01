import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/skill.dart';
import 'skill_card.dart';
import 'skill_detail_sheet.dart';
import 'section_header.dart';

class SkillsList extends ConsumerWidget {
  final String level;
  final List<Skill> skills;
  final bool isLoading;

  const SkillsList({
    Key? key,
    required this.level,
    required this.skills,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = constraints.maxWidth;
        const leftPad = 16.0;
        const gap = 12.0;
        final itemsPerView = isLandscape ? 3 : 2;
        double cardWidth = ((maxW - leftPad) - (itemsPerView - 1) * gap) / itemsPerView;
        if (cardWidth < 130) cardWidth = 130; 
        final listHeight = cardWidth + 60; 

        return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: level),
        SizedBox(
          height: listHeight,
          child: Builder(
            builder: (context) {
              if (isLoading || skills.isEmpty) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(left: leftPad, right: leftPad),
                  itemCount: 3,
                  separatorBuilder: (_, __) => const SizedBox(width: gap),
                  itemBuilder: (context, index) => SkillCard(isLoading: true, width: cardWidth),
                );
              }

              return ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.only(left: leftPad, right: leftPad),
                itemCount: skills.length,
                separatorBuilder: (_, __) => const SizedBox(width: gap),
                itemBuilder: (context, index) {
                  final skill = skills[index];
                  return SkillCard(
                    skill: skill,
                    width: cardWidth,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        builder: (_) => SkillDetailSheet(skill: skill),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
      },
    );
  }
}
