part of 'send_request_cubit.dart';

@immutable
abstract class SendRequestState {}

class SendRequestInitial extends SendRequestState {}

class RequestLoading extends SendRequestState {}

class RequestSend extends SendRequestState {
  final String message;

  RequestSend(this.message);
}

class RequestError extends SendRequestState {
  final String message;

  RequestError(this.message);
}

