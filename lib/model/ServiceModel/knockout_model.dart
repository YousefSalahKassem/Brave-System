class KnockOutModel{
  String hostName,guestName,hostImage,guestImage,hostScore,guestScore,type;

  KnockOutModel(this.hostName, this.guestName, this.hostImage, this.guestImage,
      this.hostScore, this.guestScore, this.type);
}

List<KnockOutModel> knockOuts=[
  KnockOutModel('Fighters', "Nerds", "assets/images/team1.png", "assets/images/team1.png", '1', '2', 'Semi Final'),
  KnockOutModel('Fighters', "Nerds", "assets/images/team1.png", "assets/images/team1.png", '1', '2', 'Semi Final'),
  KnockOutModel('Fighters', "Nerds", "assets/images/team1.png", "assets/images/team1.png", '1', '2', 'Semi Final'),
];