import 'dart:async';
import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:mhu_dart_commons/commons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model.dart';

final _logger = Logger();

typedef PizzaValueStore = RxVar<PizzaValueModel>;

Future<PizzaValueStore> pizzaValueStore({
  DspReg? dsp,
}) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  const key = 'pizzaValueModel';

  PizzaValueModel defaultModel() => const PizzaValueModel();

  final initialValue = () {
    final string = sharedPreferences.getString(key);
    if (string == null) {
      return defaultModel();
    }

    try {
      final json = jsonDecode(string);

      return PizzaValueModel.fromJson(json);
    } catch (e, st) {
      _logger.w(e.toString(), e, st);
      return defaultModel();
    }
  }();

  final rxVar = rxw(
    initialValue,
    dsp: dsp,
  );

  final completer = Completer();
  completer.future.waitBy(dsp);

  () async {
    try {
      await for (final model in rxVar.stream.distinct().skip(1)) {
        await sharedPreferences.setString(
          key,
          jsonEncode(
            model.toJson(),
          ),
        );
      }
    } finally {
      completer.complete();
    }
  }();

  return rxVar;
}
