//
//  TestBeganViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 5/4/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit

class TestBeganViewController: UIViewController {
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var imgQuestion: UIImageView!
    @IBOutlet weak var labelProgress: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    var totalQuestions:Int = 0
    
    var answersRight: Int = 0
    var answersWrong: Int = 0
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = "Volver"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        
        let firstQuestion = allQuestions.list[0]
        totalQuestions = allQuestions.list.count
        labelQuestion.text = firstQuestion.questionText
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        startOver()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNumber += 1
        
        nextQuestion()
        
    }
    
    func updateUI() {
        labelScore.text = "Calificación: \(score)"
        labelProgress.text = "\(questionNumber + 1) / \(totalQuestions)"
        progressBar.frame.size.width = (view.frame.size.width / 11.5) * CGFloat(questionNumber + 1)
    }
    
    
    func nextQuestion() {
        if questionNumber <= totalQuestions - 1 {
            labelQuestion.text = allQuestions.list[questionNumber].questionText
            if questionNumber == 4 {
                imgQuestion.image = UIImage(named: "pentagrama-lineas-espacios")
            } else if questionNumber == 7 {
                imgQuestion.image = UIImage(named: "pentagrama-do")
            } else if questionNumber == 8 {
                imgQuestion.image = UIImage(named: "pentagrama-tablatura")
            } else if questionNumber == 9 {
                imgQuestion.image = UIImage(named: "pentagrama-do-teclado")
            } else {
                imgQuestion.image = nil
            }
            updateUI()
        } else {
            print("No more questions")
            let alert = UIAlertController(title: "Nivel alcanzado", message: "Se terminó la prueba, y se ha llegado a una conclusión, ¿Deseas volver a intentar o ver los resultados?", preferredStyle: .alert);
            let restartAction = UIAlertAction(title: "Reiniciar", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            let resultsAction = UIAlertAction(title: "Ver Resultados", style: .default, handler: { (UIAlertAction) in
                //self.performSegue(withIdentifier: "goResults", sender: self)
                let results = self.storyboard?.instantiateViewController(withIdentifier: "TestResultsViewController") as! TestResultsViewController
                results.scorePassed = self.score
                results.rightPassed = self.answersRight
                results.wrongPassed = self.answersWrong
                self.navigationController?.pushViewController(results, animated: true)
            })
            alert.addAction(restartAction)
            alert.addAction(resultsAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("¡Acertaste!")
            score += 5
            answersRight += 1
        } else {
            ProgressHUD.showError("Fallaste")
            score -= 3
            answersWrong += 1
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        answersRight = 0
        answersWrong = 0
        nextQuestion()
    }

}
