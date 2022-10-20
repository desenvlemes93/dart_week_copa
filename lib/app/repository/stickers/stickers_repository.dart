import 'package:dart_week_copa/app/models/groups_stickers.dart';

abstract class StickersRepository {
  Future<List<GroupsStickers>> getMyAlbum();
}
