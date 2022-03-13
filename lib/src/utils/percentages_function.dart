import 'package:ihealth/src/defaults/diseases.dart';
import 'package:ihealth/src/model/diseases_model.dart';
import 'package:ihealth/src/model/diseases_probability.dart';

List<DiseaseProbability> percentages(List ids) {
  List<DiseaseProbability> list = [];
  int numberConditions = 0;
  for (int i = 0; i < ids.length; i++) {
    for (int j = 0; j < diseases.length; j++) {
      for (int k = 0; k <= diseases[j].conditions.length - 1; k++) {
        if (ids[i] == diseases[j].conditions[k]) {
          diseases[j].sum++;
        }
      }
    }
  }
  List<Diseases> _selectedDiseases = [];
  for (int i = 0; i < diseases.length; i++) {
    numberConditions += diseases[i].sum;
    if (diseases[i].sum > 0) {
      _selectedDiseases.add(diseases[i]);
    }
  }
  for (int i = 0; i <= _selectedDiseases.length-1; i++) {
    list.add(
      DiseaseProbability(
        percentage: _selectedDiseases[i].sum * 100 / numberConditions,
        disease: _selectedDiseases[i].name,
        text: _selectedDiseases[i].intro,
        diagnose: _selectedDiseases[i].diagnose,
        rec: _selectedDiseases[i].recommendation,
      ),
    );
  }
  print(numberConditions);
  return list;
}
