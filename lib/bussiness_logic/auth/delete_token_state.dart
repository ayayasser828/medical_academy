part of 'delete_token_cubit.dart';

@immutable
abstract class DeleteTokenState {}

class DeleteTokenInitial extends DeleteTokenState {}

class DeleteTokenSuccess extends DeleteTokenState {}

class DeleteTokenError extends DeleteTokenState {}
