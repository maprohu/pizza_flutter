import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:mhu_dart_commons/commons.dart';
import 'package:mhu_flutter_commons/mhu_flutter_commons.dart';
import 'package:url_launcher/url_launcher_string.dart';

void showHelp(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const HelpWidget();
      },
    ),
  );
}

class HelpWidget extends StatelessWidget {
  const HelpWidget({
    super.key,
  });

  static double scrollPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: futureBuilder(
        future: rootBundle.loadString('assets/help.md'),
        builder: (context, value) {
          return Markdown(
            controller: ScrollController(
              initialScrollOffset: scrollPosition,
            ).also((e) {
              e.addListener(() {
                scrollPosition = e.offset;
              });
            }),
            data: value,
            styleSheet: MarkdownStyleSheet(
              textScaleFactor: 1.2,
            ),
            onTapLink: (text, href, title) {
              if (href == null) {
                return;
              }
              launchUrlString(
                href,
                mode: LaunchMode.externalApplication,
              );
            },
          );
        },
      ),
    );
  }
}

class HelpButton extends StatelessWidget {
  const HelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showHelp(context);
      },
      icon: const Icon(Icons.help),
    );
  }
}
