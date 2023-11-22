import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

Future<String> loadMarkdownFile(String path) async {
  return await rootBundle.loadString(path);
}

@RoutePage()
class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);
  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String _markdownData = '';

  @override
  void initState() {
    super.initState();
    loadMarkdownFile('assets/privacy_policy/ja.md').then((data) {
      setState(() {
        _markdownData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プライバシーポリシー'),
      ),
      body: Markdown(data: _markdownData),
    );
  }
}
