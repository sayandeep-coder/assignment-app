import 'dart:async';
import 'dart:convert';
import '../models/skill.dart';

class SkillRepository {
  Future<List<Skill>> fetchSkills() async {
    await Future.delayed(const Duration(seconds: 2));
    final mockData = '''
    [
      {"name": "Dribbling", "level": "Basic", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaDaOAwkeFu4CX0Mxy_CL3-kmarC9KuDztmA&s", "imageLarge": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaDaOAwkeFu4CX0Mxy_CL3-kmarC9KuDztmA&s", "description": "Control the ball with quick touches to move past defenders."},
      {"name": "Passing", "level": "Basic", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY5mDRyd7WoZPljbFqqgtMy-QX4IxWJrRwNQ&s", "imageLarge": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY5mDRyd7WoZPljbFqqgtMy-QX4IxWJrRwNQ&s", "description": "Deliver the ball accurately to teammates with different pass types."},
      {"name": "Shooting", "level": "Basic", "image": "https://wheecorea.com/wp-content/uploads/2015/02/long_shot_d.jpg", "imageLarge": "https://wheecorea.com/wp-content/uploads/2015/02/long_shot_d.jpg", "description": "Strike the ball towards goal with power and precision."},
      
      {"name": "Vault", "level": "Intermediate", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwfdWKO27KMNLFrowg6Z3Ivo7F1xKWtrpROQ&s", "imageLarge": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwfdWKO27KMNLFrowg6Z3Ivo7F1xKWtrpROQ&s", "description": "Explosive movement to overcome obstacles efficiently."},
      {"name": "Balance", "level": "Intermediate", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgiwrDtYdl4QjMEx4lobZDJz6JlFhzND3KuA&s", "imageLarge": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgiwrDtYdl4QjMEx4lobZDJz6JlFhzND3KuA&s", "description": "Maintain body control during dynamic movement."},
      {"name": "Coordination", "level": "Intermediate", "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIK1_anQx34HmXpraD7hjk7MhVRvvI9yfGtA&s", "imageLarge": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIK1_anQx34HmXpraD7hjk7MhVRvvI9yfGtA&s", "description": "Synchronize movements across limbs to execute complex skills."},
      
      {"name": "Agility", "level": "Advanced", "image": "https://thumbs.dreamstime.com/b/athlete-executing-high-jump-track-beneath-clear-blue-sky-athlete-executing-high-jump-track-beneath-clear-blue-sky-concept-393615480.jpg", "imageLarge": "https://thumbs.dreamstime.com/b/athlete-executing-high-jump-track-beneath-clear-blue-sky-athlete-executing-high-jump-track-beneath-clear-blue-sky-concept-393615480.jpg", "description": "Rapid change of direction while maintaining speed and control."},
      {"name": "Precision", "level": "Advanced", "image": "https://media.gettyimages.com/id/2165110298/photo/paris-france-simone-biles-of-team-united-states-competes-during-the-artistic-gymnastics.jpg?s=612x612&w=gi&k=20&c=bFj1OHLaBIFwQKIEa2FwlMIapfep2WWmM-y9FP75CGs=", "imageLarge": "https://media.gettyimages.com/id/2165110298/photo/paris-france-simone-biles-of-team-united-states-competes-during-the-artistic-gymnastics.jpg?s=612x612&w=gi&k=20&c=bFj1OHLaBIFwQKIEa2FwlMIapfep2WWmM-y9FP75CGs=", "description": "Execute skills with consistent accuracy under pressure."},
      {"name": "Endurance", "level": "Advanced", "image": "https://images.pexels.com/photos/6572619/pexels-photo-6572619.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "imageLarge": "https://images.pexels.com/photos/6572619/pexels-photo-6572619.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "description": "Sustain high performance over long durations."}
    ]
    ''';

    final List<dynamic> data = json.decode(mockData);
    return data.map((json) => Skill.fromJson(json)).toList();
  }
}
