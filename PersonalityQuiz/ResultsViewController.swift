//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Jacek Gałka on 06.10.2017.
//  Copyright © 2017 Jacek Gałka. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    //MARK: Properties
    var responses: [Answer]!
    
    // MARK: Outlets
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult() {
        var frequencyAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        for response in responseTypes {
            frequencyAnswers[response] = (frequencyAnswers[response] ?? 0) + 1
        }
        let frequentAnswersSorted = frequencyAnswers.sorted { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        }
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

    // MARK: Segues
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
    }
}
