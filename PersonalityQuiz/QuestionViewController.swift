//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Vincent on 22/02/2018.
//  Copyright © 2018 Native App Studio. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Vraag \(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        updateSingleStack(using: currentAnswers)
        

        
        
        
        singleStackView.isHidden = false
        
        
        
        /*
        switch currentQuestion.type {
        case .single:
            singleStackView.isHidden = false
        case .multiple:
            
        case .ranged:
         
        }*/
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var questions: [Question] = [
            Question(text: "Wat is je favoriete eten?", type: .single,
                     answers: [
                        Answer(text:"Een of ander vega(n) prutje", type: .emma),
                        Answer(text:"Een Snickers van de VIA", type: .viaNerd),
                        Answer(text:"Dat wat je moeder 's avonds kookt", type: .verlegenNerd),
                        Answer(text:"FSC-gekeurde sushi", type: .hippie)
                ]
            ),
            Question(text: "Waar woon je?", type: .single,
                     answers: [
                        Answer(text:"Ergens anders in Amsterdam", type: .emma),
                        Answer(text:"Rode Kruislaan, Diemen", type: .viaNerd),
                        Answer(text:"Bij je ouders", type: .verlegenNerd),
                        Answer(text:"In een schattig appartementje in de Pijp", type: .hippie)
                    ]
            ),
            Question(text: "Waar waar werk je?", type: .single,
                     answers: [
                        Answer(text:"Bij de Koffiesalon", type: .emma),
                        Answer(text:"Bij Copernica", type: .viaNerd),
                        Answer(text:"Ik werk voor mezelf", type: .verlegenNerd),
                        Answer(text:"Bij SLA", type: .hippie)
                    ]
            )
        ]
    
    var questionIndex = 0
    
    var answersChosen: [Answer] = []
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswer[0])
        case singleButton2:
            answersChosen.append(currentAnswer[1])
        case singleButton3:
            answersChosen.append(currentAnswer[2])
        case singleButton4:
            answersChosen.append(currentAnswer[3])
        default:
            break
        }
        nextQuestion()
    }

    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    
    
    
    
    

    
    


}
