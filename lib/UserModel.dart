import 'package:swipeable_stack/swipeable_stack.dart';

class IdentifiableUser extends SwipeableStackIdentifiable {
  IdentifiableUser({
    required this.user,
  });

  final User user;

  @override
  String get id => user.id; // <- ユーザーの ID を返すようにしておく
}

class User {
  String id = '';
  String? name;
}
