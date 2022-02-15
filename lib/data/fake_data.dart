import 'package:flutter/material.dart';

import '../constant/constant_path.dart';
import '../extension/get_icon_name.dart';
import '../model/product.dart';

Map<String, Product> fakeData = {
  '0': Product(
      id: '0',
      title: 'Facebook',
      desc: const TextSpan(children: <TextSpan>[
        TextSpan(text: 'My Friends.\n', style: TextStyle(color: Colors.black)),
        TextSpan(
            text: 'Capture your world.', style: TextStyle(color: Colors.blue)),
      ]),
      // ignore: unnecessary_brace_in_string_interps
      pictureUrl: '$kBaseAssetPath${IconNameEnum.facebook.toPath}'),
  '1': Product(
      id: '1',
      title: 'Twitter',
      desc: const TextSpan(children: <TextSpan>[
        TextSpan(
            text: 'Amazing events.\n', style: TextStyle(color: Colors.green)),
        TextSpan(
            text: 'At your command.', style: TextStyle(color: Colors.black)),
      ]),
      pictureUrl: '$kBaseAssetPath${IconNameEnum.twitter.toPath}'),
  '2': Product(
      id: '2',
      title: 'Instagram',
      desc: const TextSpan(children: <TextSpan>[
        TextSpan(
            text: 'Built for picture.\n',
            style: TextStyle(color: Colors.orange)),
        TextSpan(text: 'Made for you.', style: TextStyle(color: Colors.black)),
      ]),
      pictureUrl: '$kBaseAssetPath${IconNameEnum.instagram.toPath}'),
  '3': Product(
      id: '3',
      title: 'Whatsapp',
      desc: const TextSpan(children: <TextSpan>[
        TextSpan(
            text: 'Your messages,\n', style: TextStyle(color: Colors.black)),
        TextSpan(text: 'safe and text.', style: TextStyle(color: Colors.red)),
      ]),
      pictureUrl: '$kBaseAssetPath${IconNameEnum.whatsapp.toPath}'),
};
