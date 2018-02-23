//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Vincent on 22/02/2018.
//  Copyright © 2018 Native App Studio. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [PersonType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }

        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 < $1.1 }.first!.key
        resultAnswerLabel.text = "Hoi \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
        if mostCommonAnswer.rawValue == "Emma" {
            resultImageView.image = UIImage(named:"emma")
        }
    }
    
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    


}
