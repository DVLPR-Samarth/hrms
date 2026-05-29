class TeamMemberModel {
  const TeamMemberModel({
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });

  final String name;
  final String imageUrl;
  final bool isOnline;
}
