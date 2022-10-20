import 'package:dart_week_copa/app/core/exceptions/repository_exception.dart';
import 'package:dart_week_copa/app/models/groups_stickers.dart';
import 'package:dart_week_copa/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:dart_week_copa/app/repository/stickers/stickers_repository.dart';

import './my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  late final MyStickersView _view;
  final StickersRepository stickersRepository;

  var album = <GroupsStickers>[];
  var statusSelected = 'all';
  List<String>? countries;

  MyStickersPresenterImpl({
    required this.stickersRepository,
  });
  @override
  Future<void> getMyAlbum() async {
    album = await stickersRepository.getMyAlbum();
    _view.loadedPage([
      ...album,
    ]);
  }

  @override
  set view(MyStickersView view) => _view = view;

  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;

    if (countries == null) {
      _view.updateAlbum(album);
    } else {
      final albumFilter = [
        ...album.where(
            (listaAtulizada) => countries.contains(listaAtulizada.countryCode))
      ];
      _view.updateAlbum(albumFilter);
    }
  }
}
