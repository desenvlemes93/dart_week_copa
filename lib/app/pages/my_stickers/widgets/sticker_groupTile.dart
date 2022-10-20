import 'package:dart_week_copa/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class StickerGroupTile extends StatefulWidget {
  final String label;
  final VoidCallback clearCallBack;
  const StickerGroupTile(
      {super.key, required this.label, required this.clearCallBack});

  @override
  State<StickerGroupTile> createState() => _StickerGroupTileState();
}

class _StickerGroupTileState extends State<StickerGroupTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(Icons.filter_list),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                widget.label,
                style: context.textStyles.textSecondaryFontRegular.copyWith(
                  fontSize: 11,
                ),
              ),
            ),
            InkWell(
              onTap: () => widget.clearCallBack,
              child: Icon(
                Icons.clear,
              ),
            ),
          ],
        ),
      ),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
