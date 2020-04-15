//
//  QuizViewController.swift
//  PaulTheTutor
//
//  Created by Aryan Khadiri on 4/14/20.
//  Copyright © 2020 AryanKhadiri@gmail.com. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    var questionType = ""
    
    var additionQuestions = ["What is the result of 128+25?",
                             "What is the result of 12+19 ?",
                             "Calculate the result for 28+31?",
                             "What is the result of 10+21 ?",
                             "Calculate the result of 97+63?",
                             "What is the result of 87+17 ?",
                             "Calcualte 51+19?",
                             "What is the result of 21+11 ?",
                             "Calculate the result of 54+26?",
                             "What is the result of 123+321 ?",
                            ]
    var additionAnswers = [["153","150","113", "143"],
                           ["31","21","41","23"],
                           ["59","69","58","49"],
                           ["31","20","11","21"],
                           ["160","150","149","161"],
                           ["104","94","97","114"],
                           ["70","59","60","80"],
                           ["32","42","31","29"],
                           ["80","79","60","70"],
                           ["444","456","454","544"]
    ]
    var subtractionQuestions = ["What is the result of 128-25?",
                                "What is the result of 19-12 ?",
                                "Calculate the result for 31-28?",
                                "What is the result of 21-10 ?",
                                "Calculate the result of 97-63?",
                                "What is the result of 87-17 ?",
                                "Calcualte 51-19?",
                                "What is the result of 45-27 ?",
                                "Calculate the result of 54-26?",
                                "What is the result of 321-123 ?",
                                ]
    var subtractionAnswers = [["103","93","113", "123"],
                              ["7","17","-7","9"],
                              ["3","13","2","4"],
                              ["11","9","8","12"],
                              ["34","43","45","54"],
                              ["70","60","80","104"],
                              ["32","70","42","31"],
                              ["18","25","27","28"],
                              ["28","80","37","39"],
                              ["198","444","218","228"]
                            ]
    var questionscount:Int=0
    var currentQuestion = 0
    var rightChoice:UInt32=0
    var correctAnswers = 0
    var questions:[String]=[]
    var answers:[[String]]=[[]]
    
    @IBOutlet weak var prevQ: UIButton!
    @IBOutlet weak var nextQ: UIButton!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var choice4: UIButton!
    
    @IBAction func choose(_ sender: UIButton) {
        if (sender.tag == Int(rightChoice)){
            sender.backgroundColor = UIColor.green
            correctAnswers += 1
        }
        else{
            sender.backgroundColor=UIColor.red
            
    }
    
        }
        func resetColors(){
            choice1.backgroundColor = UIColor.systemFill
            choice2.backgroundColor = UIColor.systemFill
            choice3.backgroundColor = UIColor.systemFill
            choice4.backgroundColor = UIColor.systemFill
        }
    
    @IBAction func onPreviousQ(_ sender: Any) {
        if currentQuestion != 0 {
            currentQuestion = currentQuestion - 1
            displayQuestion(questions: questions, answers: answers)
            resetColors()
        }
    }
    @IBAction func onNextQ(_ sender: Any) {
        if currentQuestion != questionscount - 1 {
            currentQuestion+=1
            displayQuestion(questions: questions, answers: answers)
            resetColors()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        choice1.layer.cornerRadius = CGFloat(5) ?? 0
        choice2.layer.cornerRadius = CGFloat(5) ?? 0
        choice3.layer.cornerRadius = CGFloat(5) ?? 0
        choice4.layer.cornerRadius = CGFloat(5) ?? 0

        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if (questionType == "Addition Questions"){
            questions = additionQuestions
            answers = additionAnswers
        }
        else{
            questions = subtractionQuestions
            answers = subtractionAnswers
        }

        displayQuestion(questions: questions, answers: answers)
    }
    func displayQuestion(questions:[String],answers:[[String]]){
        var answerCounter = 1

        
        questionscount = questions.count

        self.questionLable.text = questions[currentQuestion]
        rightChoice = arc4random_uniform(3)+1
        for i in 1...4 {
            let button = view.viewWithTag(i) as! UIButton
            
            if i == rightChoice{
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else {
                button.setTitle(answers[currentQuestion][answerCounter], for: .normal)
                    answerCounter+=1
                }
            }
        }

            
            
        
        
        
        

        
    }

    
    
    


