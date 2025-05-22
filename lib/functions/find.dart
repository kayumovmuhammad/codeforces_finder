import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:dio/dio.dart';

Future<List> find(name, surname) async {
    Dio dio = Dio();
    Set handles = {};

    String url =
        'https://html.duckduckgo.com/html/?q=site:codeforces.com/profile+$name+$surname';

    var ans = await dio.get(url);
    final String prefix = 'https://codeforces.com/profile/';

    if (ans.statusCode == 200) {
      Document document = parse(ans.data);
      List links = document.querySelectorAll('a.result__a');
      for (var i in links) {
        try {
          final href = i.attributes['href'];
          final uri = Uri.parse(href);
          final originalUrl = Uri.decodeComponent(uri.queryParameters['uddg']!);
          if (originalUrl.startsWith(prefix)) {
            var tm = originalUrl.substring(prefix.length);
            var handle = '';
            for (var i = 0; i < tm.length; i++) {
              if (tm[i] == '?') break;
              handle += tm[i];
            }
            handles.add(handle);
          }
        } catch (e) {
          Null;
        }
      }
    }

    return handles.toList();
  }