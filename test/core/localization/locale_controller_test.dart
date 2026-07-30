import 'package:comcode/core/localization/locale_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('switches between Portuguese and English locales', () {
    final controller = LocaleController();

    controller.setPortuguese();
    expect(controller.locale?.languageCode, 'pt');
    expect(controller.isPortuguese, isTrue);

    controller.setEnglish();
    expect(controller.locale?.languageCode, 'en');
    expect(controller.isEnglish, isTrue);
  });
}
