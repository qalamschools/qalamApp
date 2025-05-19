part of 'sociallinks_cubit.dart';

class SocialLinksState extends Equatable {
  final Map<String, String> links;
  final bool isLoading;
  final String? error;

  const SocialLinksState({
    required this.links,
    this.isLoading = false,
    this.error,
  });

  factory SocialLinksState.initial() =>
      const SocialLinksState(links: {}, isLoading: true);

  SocialLinksState copyWith({
    Map<String, String>? links,
    bool? isLoading,
    String? error,
  }) {
    return SocialLinksState(
      links: links ?? this.links,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [links, isLoading, error];
}
