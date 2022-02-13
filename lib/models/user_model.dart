
class User {
  late String name;
  late String profilePhoto;
  late String message;
  late String day;
  late bool isOnline;
  late bool isRead;

  User(
      {required this.name,
        required this.profilePhoto,
        required this.message,
        required this.day,
        required this.isOnline,
        required this.isRead});
}
class Advertisment{
  late String name;
  late String profilePhoto;
  late String message;
  String viewMore = 'View More';


  Advertisment(
      {required this.name,
        required this.profilePhoto,
        required this.message,
      }
  );
}