# A mobile intervention for digital dating abuse

Digital dating abuse (a form of interpersonal violence which takes place digitally, including over social media and electronic messaging) is a crisis that is uniquely 21st century. SecondLook is a [Flutter-based](https://flutter.dev/) Android app I redesigned and developed as part of my ongoing research assistantship with [Professor Tania Roy at New College of Florida.](https://www.ncf.edu/directory/listing/tania-roy/), intended to provide assistance to young people at any stage of a relationship, not just those who have reached a breaking point.

SecondLook has three main features:

* **Awareness:** What makes a relationship healthy? The Awareness feature provides information on how to tell if a relationship is becoming unhealthy, plus statistics on the spread of dating abuse nationally.
* **Detection:** Users upload their text message history with one of their contacts, and SecondLook uses machine learning techniques to determine which, if any, of those messages contain abusive language. More on this feature below.
* **Resources:** Search for local abuse hotlines, shelters, and other resources in any area.

## Detection feature

SecondLook uses a linear support vector model to classify individual text messages as either "abusive" or "non-abusive". (More information on the training data and machine learning techniques used by the app can be found here: [Roy, Tania, "SecondLook: A Prototype Mobile Phone Intervention for Digital Dating Abuse" (2018). All Dissertations. 2190.](https://tigerprints.clemson.edu/all_dissertations/2190).
