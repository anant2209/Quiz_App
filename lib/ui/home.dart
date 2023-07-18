import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState  createState() => _QuizAppState();
}


class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex =0;
  List questionBank =[
 Question.name(   "India got Independence in year 1947.",true),
    Question.name( "The first Prime Minister of India was Pandit Jawharlal Nehru.", true),
    Question.name("In 1893, the moving sidewalk was created. ",true),
    Question.name("Two dimensions can be seen in a hologram." ,false),
  Question.name("Around 550 million years ago, complex animal life first appeared.", true),
  Question.name("A fuel produced from grass is called mycodiesel.", false),
  Question.name("Compared to a hydrogen atom, a carbon atom is lighter.", false),
  Question.name("In 1960, the World Wide Web was created.",false),
  Question.name("In Hungary, holograms were created.", false),
  Question.name("Density and volume are used to calculate a cube’s mass.", true),
  Question.name("An anthelion is a kind of insect.", false),
  Question.name("A planimeter is used to measure height.", false),
  Question.name("There are 4 lungs in the human body.", false),
  Question.name("The human skin regenerates once in two weeks." ,false),
  Question.name("The speed of the average human sneeze can be measured up to 100 miles an hour.", true),
  Question.name("Humans lose an average of 75 strands of hair per week." ,false),
  Question.name("The number of bones in an infant is more than that of an average human.", true),
  Question.name("The liver is the largest internal organ in the human body.", true),
  Question.name("The human brain contains the maximum amount of muscle density.", false),
  Question.name("The tongue is the only part of the human body with taste buds.", false),
  Question.name("The human eyes can observe 10 million different colors.", true),
  Question.name("The average human body consists of 60% water.", true)


  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Brain Skillz",style: TextStyle(
            color: Colors.white
          ),),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        backgroundColor: Colors.black87,
        body: Builder(
          builder:(BuildContext context)=>Container(
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset("images/brainstorm.png",
                  width: 200,
                  height: 180
                  ,),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.purple, style: BorderStyle.solid
                      )
                  ),
                  height: 120.0,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentQuestionIndex].questionText, style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold
                    ),),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(onPressed: () => _previousQuestion(),
                      color: Colors.white54,
                      child: Icon(Icons.arrow_back, color: Colors.white),),

                  RaisedButton(onPressed: () => _checkedAnswer(false, context),
                      color: Colors.white54,
                      child: Text("FALSE", style: TextStyle(
                        color: Colors.cyanAccent
                      ),),
                    ),

                  RaisedButton(onPressed: () => _checkedAnswer(true, context),
                      color: Colors.white54,
                      child: Text("TRUE",style: TextStyle(
                          color: Colors.cyanAccent),
                    ),),

                  RaisedButton(onPressed: () => _nextQuestion(),
                      color: Colors.white54,
                      child: Icon(Icons.arrow_forward, color: Colors.white),),


                ],
              ),
              Spacer(),
            ],

          ),
        ),
      ),
      ));
  }
  _previousQuestion() {
    setState(() {
      _currentQuestionIndex=(_currentQuestionIndex -1) %questionBank.length;
    });
  }
    _checkedAnswer(bool userChoice, BuildContext context){
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
    final snackBar = SnackBar(backgroundColor: Colors.greenAccent,
        duration: Duration(milliseconds: 800),
        content:Text("Absolutely Right!",style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: Colors.purple
    ),));
    Scaffold.of(context).showSnackBar(snackBar);
    setState(() {
      _currentQuestionIndex++;
    });
    }else{
     final snackBar= SnackBar( backgroundColor:Colors.redAccent,
         duration: Duration(milliseconds: 800),
         content: Text("Shit Happens..",style: TextStyle(
       fontSize: 20.0,
       fontWeight: FontWeight.bold,
       color: Colors.white
     ),));
      Scaffold.of(context).showSnackBar(snackBar);
    }


  }
  _nextQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });

  }


}
