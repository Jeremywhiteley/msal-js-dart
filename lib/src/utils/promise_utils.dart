// ignore_for_file: unnecessary_lambdas

part of '../../msal_js.dart';

Future<T> _convertMsalPromise<T>(PromiseJs<T> promise) {
  final completer = new Completer<T>();

  promise.then(
    allowInterop((value) => completer.complete(value)),
    allowInterop((error) => completer.completeError(_convertJsAuthError(error)))
  );

  return completer.future;
}