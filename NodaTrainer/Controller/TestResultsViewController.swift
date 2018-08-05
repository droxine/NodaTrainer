//
//  TestResultsViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 5/8/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit

class TestResultsViewController: UIViewController {
    var scorePassed = Int()
    var rightPassed = Int()
    var wrongPassed = Int()
    var totalScore:Int = QuestionBank().list.count
    
    @IBOutlet weak var txtScore: UILabel!
    @IBOutlet weak var txtTotal: UILabel!
    @IBOutlet weak var txtRight: UILabel!
    @IBOutlet weak var txtWrong: UILabel!
    @IBOutlet weak var txtLessonSuggested: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Volver"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        
        txtScore.text = "\(scorePassed)"
        txtTotal.text = "\(totalScore)"
        txtRight.text = "\(rightPassed)"
        txtWrong.text = "\(wrongPassed)"
        
        calculatingSuggestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func calculatingSuggestion() {
        var finalSuggestion: Int = 0
        let perfectScore: Int =  totalScore * 5
        if scorePassed == perfectScore {
            finalSuggestion = 19
        } else if scorePassed >= (perfectScore - 10) &&
            finalSuggestion < perfectScore {
            finalSuggestion = 10
        } else if scorePassed >= (perfectScore - 20) &&
            finalSuggestion < perfectScore {
            finalSuggestion = 7
        } else if scorePassed >= (perfectScore - 30) &&
            finalSuggestion < perfectScore {
            finalSuggestion = 3
        }
        
        txtLessonSuggested.text = "\(finalSuggestion)"
    }

}
