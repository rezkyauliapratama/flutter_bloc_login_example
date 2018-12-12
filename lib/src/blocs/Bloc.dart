import 'dart:async';
import 'Validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators{
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Function(String) get changeEmail => _email.sink.add;
  Stream<String> get email => _email.stream.transform(validateEmail);

  Function (String) get changePassword => _password.sink.add;
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid => Observable.combineLatest2(
      email,
      password,
      (x,y) => true

  );

  submit() {
    final validEmail = _email.value;
    final validPassword = _email.value;

    print("valid email : $validEmail & valid password : $validPassword");
  }



  dispose(){
    _email.close();
    _password.close();
  }
}
