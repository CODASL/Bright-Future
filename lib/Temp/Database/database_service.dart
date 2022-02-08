import 'package:brightfuture/Models/post.dart';
import 'package:brightfuture/Models/user.dart';
import 'package:brightfuture/constant/image.dart';

class DatabaseService {
  static List<AppUser> appUsers = [
    AppUser(
        imgPath: avatar,
        name: "Nimal Perera",
        city: "Colombo",
        email: "nimal@gmail.com",
        phoneNumber: "0776675448"),
    AppUser(
        imgPath: avatar,
        name: "Saman Kumara",
        city: "Galle",
        email: "saman@gmail.com",
        phoneNumber: "0754875489"),
  ];
  static List<Post> posts = [
    Post(
      user: appUsers[0],
      postedDate: DateTime.now().toString(),
      postBody:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorempsum ha Is been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      imgs: [avatar, logo],
    )
  ];
}
