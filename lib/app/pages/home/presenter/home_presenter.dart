import 'package:dart_week_copa/app/core/mvp/fwc_presenter.dart';
import 'package:dart_week_copa/app/pages/home/home_page.dart';
import 'package:dart_week_copa/app/pages/home/view/home_view.dart';

abstract class HomePresenter extends FwcPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}
