import 'dart:math';

class CalculatorService {
  CalculatorService(int weight, int height) {
    this.bmi = weight / pow(height / 100, 2);
  }

  double bmi;

  String getBMI() {
    return this.bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (this.bmi >= 25) {
      return 'Overweight';
    } else if (this.bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (this.bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (this.bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
