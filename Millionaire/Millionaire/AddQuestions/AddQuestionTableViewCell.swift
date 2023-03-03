//
//  AddQuestionTableViewCell.swift
//  Millionaire
//
//  Created by Семён Винников on 01.03.2023.
//

import UIKit

class AddQuestionTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    static let cellIdentity = "addQuestionCell"
    
    var questionId: Int?
    var questionFieldsChangled: AnswerCellUITextFieldChanged?
    
    func configureCell() {
        self.questionUITextField.delegate = self
        self.rightAnswer.delegate = self
    }
   
    @IBOutlet weak var questionUITextField: UITextField! {
        didSet {
            questionUITextField.addTarget(self, action: #selector(textFieldValueChanged), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var rightAnswer: UITextField! {
        didSet {
            rightAnswer.addTarget(self, action: #selector(textFieldValueChanged), for: .editingChanged)
        }
    }

    
    @objc func textFieldValueChanged(_ sender: UITextView) {
        questionFieldsChangled?.didAnswerTextFieldChanged(questionId: questionId!, question: questionUITextField.text ?? "", answer: rightAnswer.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        
        questionFieldsChangled?.didAnswerTextFieldChanged(questionId: questionId!, question: questionUITextField.text ?? "", answer: rightAnswer.text ?? "")
        
        return false
    }

}
