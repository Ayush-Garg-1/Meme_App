import 'dart:convert';

import 'package:http/http.dart';

class FetchMeme{
  Future<String> getMeme() async{
    String url = "https://meme-api.com/gimme";
    Response response = await get(Uri.parse(url));
    Map<String,dynamic> memeData = json.decode(response.body);
    return memeData['url'];
  }
}