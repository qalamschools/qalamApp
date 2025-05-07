part of 'event_cubit.dart';

class EventsState {
  final List<EventModel> events;
  final bool loading;
  final String? error;

  EventsState({required this.events, this.loading = false, this.error});

  EventsState copyWith({
    List<EventModel>? events,
    bool? loading,
    String? error,
  }) {
    return EventsState(
      events: events ?? this.events,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}
