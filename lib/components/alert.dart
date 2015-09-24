library untitled41.component.my_cmp;

import 'package:angular2/angular2.dart';
import 'dart:async';

@Component(
    selector: 'alert',
    properties: const ['model', 'type', 'dismissible', 'dismissOnTimeout', 'message'],
    events: const ['closeEmitter: close'],
    viewBindings: const [AlertModel]
)
@View(
    templateUrl: 'alert.html',
    directives: const [NgIf, NgClass])
class Alert implements OnInit {
  EventEmitter closeEmitter = new EventEmitter();

  set type(String value) {model.type = value;}
  set dismissible(bool value) {model.dismissible = value;}
  set dismissOnTimeout(int value) {model.dismissOnTimeout = value;}
  set message(String value) {model.message = value;}

  AlertModel model;

  Alert(this.model);

  onInit() {
    if (model.dismissOnTimeout != null) {
      model.dismissible = true;
      new Future.delayed(new Duration(milliseconds: 3000), close);
    }
  }

  close() {
    closeEmitter.add(this);
    model.closed = true;
  }
}

@Injectable()
class AlertModel {
  String type = 'warning';
  bool dismissible = false, closed = false;
  String message = "";
  int dismissOnTimeout;

  String get classes => 'alert-${type}'
      '${dismissible ? ' alert-dismissible' : ''}';

  AlertModel();

}