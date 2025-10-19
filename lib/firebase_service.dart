import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/event_model.dart';

class FirebaseService {
  static CollectionReference<EventModel> getEventsCollection() =>
      FirebaseFirestore.instance
          .collection('events')
          .withConverter<EventModel>(
            fromFirestore: (docSnapshot, _) =>
                EventModel.fromJson(docSnapshot.data()!),
            toFirestore: (event, _) => event.toJson(),
          );

  static Future<void> createEvent(EventModel event) {
    CollectionReference<EventModel> eventsCollections = getEventsCollection();
    DocumentReference<EventModel> doc = eventsCollections.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static getEvents() async {
    CollectionReference<EventModel> eventsCollections = getEventsCollection();
    QuerySnapshot<EventModel> querySnapshot = await eventsCollections
        .orderBy('timestamp')
        .get();
    return querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }
}
