import 'package:dart_week_copa/app/pages/my_stickers/my_stickers_page.dart';
import 'package:dart_week_copa/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:dart_week_copa/app/pages/my_stickers/presenter/my_stickers_presenter_impl.dart';
import 'package:dart_week_copa/app/repository/stickers/stickers_repository.dart';
import 'package:dart_week_copa/app/repository/stickers/stickers_repository_impl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class MyStickerRoute extends FlutterGetItPageRoute {
  @override
  // TODO: implement bindings
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>(
            (i) => StickersRepositoryImpl(dio: i())),
        Bind.lazySingleton<MyStickersPresenter>((i) => MyStickersPresenterImpl(
              stickersRepository: i(),
            )),
      ];
  @override
  // TODO: implement page
  WidgetBuilder get page =>
      ((context) => MyStickersPage(presenter: context.get()));
}
