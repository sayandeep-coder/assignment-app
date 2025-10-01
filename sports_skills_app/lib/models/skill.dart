class Skill {
  final String name;
  final String level;
  final String image;
  final String? imageLarge;
  final String? description;

  Skill({
    required this.name,
    required this.level,
    required this.image,
    this.imageLarge,
    this.description,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      name: json['name'] as String,
      level: json['level'] as String,
      image: json['image'] as String,
      imageLarge: json['imageLarge'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'level': level,
      'image': image,
      'imageLarge': imageLarge,
      'description': description,
    };
  }
}
