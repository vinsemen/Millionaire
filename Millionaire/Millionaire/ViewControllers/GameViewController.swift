//
//  GameViewController.swift
//  Millionaire
//
//  Created by Семён Винников on 18.02.2023.
//

import UIKit

protocol GameVCDelegate: AnyObject {
    func didEndGame(_ result: Result)
}


class GameViewController: UIViewController {
    
    private let session = Game.shared
    
    //MARK: - Outlets
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var answerButton1: UIButton!
    @IBOutlet var answerButton2: UIButton!
    @IBOutlet var answerButton3: UIButton!
    @IBOutlet var answerButton4: UIButton!
    @IBOutlet weak var score: UILabel!
    
    weak var delegate: GameVCDelegate?
    
    @IBAction func setAnswer1(_ sender: UIButton) {
        handleVariant(answer: Answer.A)
    }

    @IBAction func setAnswer2(_ sender: UIButton) {
        handleVariant(answer: Answer.B)
    }
    
    @IBAction func setAnswer3(_ sender: UIButton) {
        handleVariant(answer: Answer.C)
    }
    
    @IBAction func setAnswer4(_ sender: UIButton) {
        handleVariant(answer: Answer.D)
    }
    
    
    private func handleVariant(answer: Answer) {
        guard let vm = Game.shared.handleAnswer(answer) else {return}
        renderScreen(viewModel: vm)
    }
    
    private func renderScreen(viewModel: QuestionModel) {
        
        if viewModel.shouldEndGame {
            guard let results = Game.shared.finish() else { return }
            
            delegate?.didEndGame(results)
            
            dismiss(animated: true, completion: nil)
            return
        }
        
        guard let q = viewModel.question else { return }
        questionLabel.text = q.text
        
        answerButton1.setTitle(q.variants[Answer.A]?.text, for: .normal)
        answerButton2.setTitle(q.variants[Answer.B]?.text, for: .normal)
        answerButton3.setTitle(q.variants[Answer.C]?.text, for: .normal)
        answerButton4.setTitle(q.variants[Answer.D]?.text, for: .normal)
        
        score.text = "Score: \(viewModel.score) / \(QuestionData.loadQuestions().count)"
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Game.shared.newGame()
        guard let viewModel = Game.shared.getQuestionViewModel() else { return }
        
        renderScreen(viewModel: viewModel)
    }

}
