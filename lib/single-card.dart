import 'package:flutter/material.dart';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:gitexpo/utils/styles.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class Singlecard extends StatefulWidget {
  final Command command;
  Singlecard({Key? key, required this.command}) : super(key: key);

  @override
  _SinglecardState createState() => _SinglecardState();
}

class _SinglecardState extends State<Singlecard> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ExpansionTileCard(
        baseColor: Styles.cardExpandedColor,
        expandedColor: Styles.cardExpandedColor,
        expandedTextColor: Styles.cardTextExpandBaseColor,
        key: UniqueKey(),
        title: Text(widget.command.title,
            style: Styles.cardTitleText,
            overflow: TextOverflow.ellipsis,
            maxLines: 2),
        children: <Widget>[
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                curve: Curves.bounceOut,
                duration: const Duration(seconds: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.command.subtitle,
                      style: Styles.cardBodyText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      """${widget.command.content}""",
                      style: Styles.cardContentText,
                    ),
                  ],
                ),
                builder: (_, value, child) {
                  return Transform.translate(
                    offset: Offset(value * 120, 0.0),
                    child: child,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Command {
  final String title;
  final String subtitle;
  final String content;
  Command({
    required this.content,
    required this.title,
    required this.subtitle,
  });
}
