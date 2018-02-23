//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Vincent on 22/02/2018.
//  Copyright © 2018 Native App Studio. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // variable to hold the responses, sent to this ViewController by QuestionViewController
    var responses: [Answer]!

    // hide Back button and compute/display personality result
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Computes and shows the personality result
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [PersonType: Int] = [:]
        
        // get the response types from the responses
        let responseTypes = responses.map { $0.type }
        
        // compute response frequency
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        // sort frequency of answers
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
            { (pair1, pair2) -> Bool in
                return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key

        // update screen
        resultAnswerLabel.text = "Hoi \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition

        // if result is Emma, display image of Emma
        if mostCommonAnswer.rawValue == "Emma" {
            resultImageView.image = UIImage(named:"emma")
        }
    }

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    


}
