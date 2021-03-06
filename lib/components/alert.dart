library untitled41.component.my_cmp;

import 'package:angular2/angular2.dart';
import 'package:angular2/src/core/compiler/element_ref.dart' show ElementRef;
import 'dart:async';

@Component(
    selector: 'alert',
    properties: const [
      'model',
      'type',
      'dismissible',
      'dismissOnTimeout',
      'message'
    ],
    events: const ['closeStream: close'],
    viewBindings: const [AlertModel])
@View(templateUrl: 'alert.html', directives: const [NgIf, NgClass])
class Alert implements OnInit {
  EventEmitter closeStream = new EventEmitter();
  AlertModel model;

  set type(String value) => model.type = value;
  set dismissible(bool value) => model.dismissible = value;
  set dismissOnTimeout(int value) => model.dismissOnTimeout = value;
  set message(String value) => model.message = value;

  ElementRef elementRef;

  Alert(this.model, this.elementRef);

  onInit() {
    if (model.dismissOnTimeout != null) {
      model.dismissible = true;
      new Future.delayed(new Duration(milliseconds: 3000), close);
    }
  }

  close() {
    closeStream.add(this.model);
    elementRef.nativeElement.remove();
  }
}

@Injectable()
class AlertModel {
  String type = 'warning';
  bool dismissible = false;
  String message = "";
  int dismissOnTimeout;

  String get classes => 'alert-${type}'
      '${dismissible ? ' alert-dismissible' : ''}';
}
