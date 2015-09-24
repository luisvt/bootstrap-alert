import 'package:angular2/angular2.dart';

import 'package:untitled41/components/alert.dart';

@Component(selector: 'app')
@View(templateUrl: 'app.html', directives: const [Alert, CORE_DIRECTIVES])
class App {
  List<AlertModel> alerts = [];

  addAlert() {
    alerts.add(new AlertModel()
      ..message = "Another alert!"
      ..dismissible = true);
  }

  closeAlert(AlertModel alert) {
    print("An alert with type ${alert.type}. "
        "And message: '${alert.message}' is closed.");
  }
}
