import 'package:dart_week_copa/app/core/mvp/fwc_presenter.dart';
import 'package:dart_week_copa/app/fwc_album_app.dart';
import 'package:dart_week_copa/app/pages/my_stickers/view/my_stickers_view.dart';

abstract class MyStickersPresenter extends FwcPresenter<MyStickersView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(String status);
  void countryFilter(List<String>? countries);
}
