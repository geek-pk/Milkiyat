import 'dart:convert';

import 'package:milkiyat/models/data_model.dart';
import 'package:milkiyat/rest/rest.client.dart';

class ApiController {
  static fetchData() async {
    late DataModel dataModel;
    try {
      var res = await RestClient().fetchData();
      String stringData = res.toString();
      dataModel = DataModel.fromJson(await jsonDecode(stringData));
    } catch (error, stack) {
      print(error.toString());
      print(stack.toString());
    }
    return dataModel;
  }
}
