import 'package:dart_week_copa/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:dart_week_copa/app/pages/my_stickers/widgets/sticker_groupTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerGroupFilter extends StatefulWidget {
  final Map<String, String> countries;

  const StickerGroupFilter({
    super.key,
    required this.countries,
  });

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {
  List<String>? selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        title: 'Filtro',
        tileBuilder: (context, state) {
          return InkWell(
            onTap: state.showModal,
            child: StickerGroupTile(
              label: state.selected.title?.join(', ') ?? 'Filtro',
              clearCallBack: () {
                setState(() {
                  selected = null;
                  context.get<MyStickersPresenter>().countryFilter(selected);
                });
              },
            ),
          );
        },
        selectedValue: selected ?? [],
        onChange: (selectedValue) {
          setState(() {
            selected = selectedValue.value;
          });

          context.get<MyStickersPresenter>().countryFilter(selected);
        },
        choiceItems: S2Choice.listFrom(
          source: widget.countries.entries
              .map((e) => {'value': e.key, 'title': e.value})
              .toList(),
          value: (_, item) => item['value'] ?? '',
          title: (_, item) => item['title'] ?? '',
        ),
        modalType: S2ModalType.bottomSheet,
      ),
    );
  }
}
