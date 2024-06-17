import 'dart:developer';

void localLog({required dynamic exception,required String name}){
  log("$exception", name: name);
  if (exception is Error) {
    log("${exception.stackTrace}", name: name);
  }
}