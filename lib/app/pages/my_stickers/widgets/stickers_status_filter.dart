import 'package:dart_week_copa/app/core/ui/styles/button_styles.dart';
import 'package:dart_week_copa/app/core/ui/styles/colors_app.dart';
import 'package:dart_week_copa/app/core/ui/styles/text_styles.dart';
import 'package:dart_week_copa/app/core/ui/widgets/button.dart';
import 'package:dart_week_copa/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:dart_week_copa/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickersStatusFilter extends StatelessWidget {
  final String filterSelected;
  const StickersStatusFilter({
    super.key,
    required this.filterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              context.get<MyStickersPresenter>().statusFilter('all');
            },
            style: filterSelected == 'all'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primartButton,
            labelStyle: context.textStyles.textSecondaryFontMedium
                .copyWith(color: context.colors.primary),
            label: 'Todos',
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              context.get<MyStickersPresenter>().statusFilter('missing');
            },
            style: filterSelected == 'missing'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primartButton,
            labelStyle: context.textStyles.textSecondaryFontMedium,
            label: 'Faltando',
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () =>
                context.get<MyStickersPresenter>().statusFilter('repeated'),
            style: filterSelected == 'repeated'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primartButton,
            labelStyle: filterSelected == 'repeated'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Repetidos',
          ),
        ],
      ),
    );
  }
}
