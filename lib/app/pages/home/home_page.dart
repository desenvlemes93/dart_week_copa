import 'package:dart_week_copa/app/core/ui/styles/button_styles.dart';
import 'package:dart_week_copa/app/core/ui/styles/colors_app.dart';
import 'package:dart_week_copa/app/core/ui/styles/text_styles.dart';
import 'package:dart_week_copa/app/core/ui/widgets/button.dart';
import 'package:dart_week_copa/app/pages/home/presenter/home_presenter.dart';
import 'package:dart_week_copa/app/pages/home/view/home_view_impl.dart';
import 'package:dart_week_copa/app/pages/home/widgets/status_tile.dart';
import 'package:dart_week_copa/app/pages/home/widgets/stickes_percent_widgets.dart';
import 'package:dart_week_copa/app/pages/splash/presenter/splash_presenter.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  const HomePage({
    super.key,
    required this.presenter,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => widget.presenter.logout(),
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: context.colors.primary,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(builder: (_, constrains) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constrains.maxHeight),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 35),
                      child: Image.asset(
                        'assets/images/bola.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    StickesPercentWidgets(
                      percent: user?.totalCompletePercent ?? 0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${user?.totalStickers ?? 0} figurinhas',
                      style: context.textStyles.titleWhite,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StatusTile(
                      icon: Image.asset('assets/images/all_icon.png'),
                      label: 'Todas',
                      value: user?.totalAlbum ?? 0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StatusTile(
                      icon: Image.asset('assets/images/missing_icon.png'),
                      label: 'Faltando',
                      value: user?.totalComplete ?? 0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StatusTile(
                      icon: Image.asset('assets/images/repeated_icon.png'),
                      label: 'Repetidos',
                      value: user?.totalDuplicates ?? 0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Button(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/my-stickers');
                        },
                        width: MediaQuery.of(context).size.width * .9,
                        outline: true,
                        style: context.buttonStyles.yellowOutlineButton,
                        labelStyle: context
                            .textStyles.textSecondaryFontExtraBold
                            .copyWith(
                          color: context.colors.yellow,
                        ),
                        label: 'Minhas Figurinhas')
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
