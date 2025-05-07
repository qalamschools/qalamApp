import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qalam_app/feature/new_and_media/models/event_model.dart';

part 'event_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsState(events: []));

  final _firestore = FirebaseFirestore.instance;

  Future<void> fetchEvents() async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final snapshot = await _firestore.collection('EVENTS').get();
      final events = snapshot.docs
          .map((doc) => EventModel.fromMap(doc.id, doc.data()))
          .toList();
      emit(state.copyWith(events: events, loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
