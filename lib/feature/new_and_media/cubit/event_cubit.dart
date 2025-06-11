import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:bloc/bloc.dart';
import 'package:qalam_app/feature/new_and_media/models/event_model.dart';
import 'package:qalam_app/main.dart';

part 'event_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsState(events: []));

  Future<void> fetchEvents() async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final snapshot = await firestore.collection('EVENTS').get();
      final events = snapshot.docs
          .map((doc) => EventModel.fromMap(doc.id, doc.data()))
          .toList();
      emit(state.copyWith(events: events, loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  void addToCalendar(EventModel eventModel) {
    final Event event = Event(
      title: eventModel.title,
      startDate: DateTime.now().add(const Duration(hours: 1)),
      endDate: DateTime.now().add(const Duration(hours: 2)),
    );
    Add2Calendar.addEvent2Cal(event);
  }
}
