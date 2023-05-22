//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Rolando Vela on 5/2/23.
//

import UIKit

class QuestionViewController: UIViewController {
    var answersChosen : [Answer] = []
    
    
    var questions : [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "fish", type: .cat),
                    Answer(text: "corn", type: .turtle),
                    Answer(text: "corn", type: .chicken),
                    Answer(text: "fish", type: .dolphin),
                ]),
        Question(text: "Which activities do you enjoy?",
                 type: .single,
                 answers: [
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "swimming", type: .turtle),
                    Answer(text: "walking", type: .chicken),
                    Answer(text: "swimming", type: .dolphin),
                ]),
        Question(text: "How much do you enjoy car rides?",
                 type: .single,
                 answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I never been on one", type: .chicken),
                    Answer(text: "never seen a car", type: .dolphin),
                ])
    ]
    var questionIndex = 0 //The index of the current question
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var singleStackView: UIStackView!
    //Question label
    @IBOutlet var questionLabel: UILabel!
    //Question Progress view
    @IBOutlet var questionProgressView : UIProgressView!
    //Single Stack View outlets
    @IBOutlet var singleButton1 : UIButton!
    @IBOutlet var singleButton2 : UIButton!
    @IBOutlet var singleButton3 : UIButton!
    @IBOutlet var singleButton4 : UIButton!
    //Multiple Stack View outlets
    @IBOutlet var multipleLabel1 : UILabel!
    @IBOutlet var multipleLabel2 : UILabel!
    @IBOutlet var multipleLabel3 : UILabel!
    @IBOutlet var multipleLabel4 : UILabel!
    //multi Switch Outlets
    @IBOutlet var multiSwitch1 : UISwitch!
    @IBOutlet var multiSwitch2 : UISwitch!
    @IBOutlet var multiSwitch3 : UISwitch!
    @IBOutlet var multiSwitch4 : UISwitch!
    //Range Stack View outlets
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabel : UILabel!
    @IBOutlet var rangedLabel2 : UILabel!
    
     
    

    override func viewDidLoad(){
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.

    }
    
    func updateUI(){
        //disable all stack views
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        //set the title
        navigationItem.title = "Question #\(questionIndex)"
        
        //set the current question
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        //set the progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        //animate the progress
        questionProgressView.setProgress(totalProgress, animated: true)
        
        //activate the view for this type
        switch currentQuestion.type{
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton1.setTitle(answers[1].text, for: .normal)
        singleButton1.setTitle(answers[2].text, for: .normal)
        singleButton1.setTitle(answers[3].text, for: .normal)
    }
    func updateMultipleStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    func updateRangedStack(using answers: [Answer]){
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel.text = answers.first?.text
        rangedLabel2.text = answers.first?.text
    }
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender{
        case singleButton1:
        answersChosen.append(currentAnswers[0])
        case singleButton2:
        answersChosen.append(currentAnswers[1])
        case singleButton3:
        answersChosen.append(currentAnswers[2])
        case singleButton4:
        answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    @IBAction func multipleAnswerButtonPressed(){
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn{
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn{
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn{
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn{
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    @IBAction func rangedAnswerButtonPressed(){
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value *  Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    func nextQuestion (){
        questionIndex += 1
        
        if questionIndex < questions.count{
            updateUI()
        }else{
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    @IBSegueAction func showResults(_ coder: NSCoder) -> UIViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
    }
}
