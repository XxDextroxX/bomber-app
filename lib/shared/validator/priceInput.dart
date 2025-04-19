import 'package:formz/formz.dart';

// Define input validation errors
enum PriceError { empty, format, zero }

// Extend FormzInput and provide the input type and error type.
class PriceInput extends FormzInput<String, PriceError> {
  // Regular expression to validate that the input is a valid number (integer or decimal)
  static final RegExp priceRegExp = RegExp(
    r'^\d+(\.\d+)?$',
  );

  // Call super.pure to represent an unmodified form input.
  const PriceInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const PriceInput.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PriceError.empty) return 'El campo es requerido';
    if (displayError == PriceError.zero) return 'El precio no puede ser 0';
    if (displayError == PriceError.format) {
      return 'Formato no válido';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PriceError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PriceError.empty;
    if (!priceRegExp.hasMatch(value)) return PriceError.format;
    if (double.tryParse(value) == 0) return PriceError.zero;
    return null;
  }
}
