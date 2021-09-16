///add //@dart=2.9 to go to older version.
/// This is a class to store the properties

class Question {
  String questiontext = 'error';
  bool answertext = true;

  /// Constructor with parameters that pass values to the properties.
  Question(String q, bool a) {
    questiontext = q;
    answertext = a;
  }
}
