import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/skill.dart';
import '../repositories/skill_repository.dart';

final skillRepositoryProvider = Provider<SkillRepository>((ref) {
  return SkillRepository();
});

final skillsProvider = FutureProvider.autoDispose<List<Skill>>((ref) async {
  final repository = ref.read(skillRepositoryProvider);
  return repository.fetchSkills();
});

final basicSkillsProvider = Provider.autoDispose<List<Skill>>((ref) {
  final skillsAsync = ref.watch(skillsProvider);
  return skillsAsync.when(
    data: (skills) => skills.where((skill) => skill.level == 'Basic').toList(),
    loading: () => [],
    error: (_, __) => [],
  );
});

final intermediateSkillsProvider = Provider.autoDispose<List<Skill>>((ref) {
  final skillsAsync = ref.watch(skillsProvider);
  return skillsAsync.when(
    data: (skills) => skills.where((skill) => skill.level == 'Intermediate').toList(),
    loading: () => [],
    error: (_, __) => [],
  );
});

final advancedSkillsProvider = Provider.autoDispose<List<Skill>>((ref) {
  final skillsAsync = ref.watch(skillsProvider);
  return skillsAsync.when(
    data: (skills) => skills.where((skill) => skill.level == 'Advanced').toList(),
    loading: () => [],
    error: (_, __) => [],
  );
});
