part of 'trailer_cubit.dart';

sealed class TrailerState extends Equatable {
  const TrailerState();

  @override
  List<Object> get props => [];
}

final class TrailerInitial extends TrailerState {}

final class TrailerLoading extends TrailerState {}

final class TrailerSuccess extends TrailerState {
  final YoutubePlayerController youtubePlayerController;

  const TrailerSuccess({required this.youtubePlayerController});
}

final class TrailerFailure extends TrailerState {
  final String errorMessage;

  const TrailerFailure({required this.errorMessage});
}
