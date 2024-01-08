import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputMasks {
  InputMasks._();

  static final phoneInputMask = MaskTextInputFormatter(
    mask: '+998 (##) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,

  );
  static final birthdayInputMask = MaskTextInputFormatter(
    mask: '####-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}
