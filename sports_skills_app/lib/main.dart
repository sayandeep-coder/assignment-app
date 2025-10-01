import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sports_skills_app/providers/skill_provider.dart';
import 'package:sports_skills_app/widgets/skills_list.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Skills App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillsAsync = ref.watch(skillsProvider);
    final isLoading = skillsAsync.isLoading;

    final basicSkills = ref.watch(basicSkillsProvider);
    final intermediateSkills = ref.watch(intermediateSkillsProvider);
    final advancedSkills = ref.watch(advancedSkillsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports Skills'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {

          ref.invalidate(skillsProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkillsList(
                level: 'Basic',
                skills: basicSkills,
                isLoading: isLoading,
              ),
              SkillsList(
                level: 'Intermediate',
                skills: intermediateSkills,
                isLoading: isLoading,
              ),
              
              SkillsList(
                level: 'Advanced',
                skills: advancedSkills,
                isLoading: isLoading,
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
