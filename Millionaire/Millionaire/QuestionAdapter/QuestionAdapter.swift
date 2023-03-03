//
//  QuestionAdapter.swift
//  Millionaire
//
//  Created by Семён Винников on 28.02.2023.
//

import Foundation

struct UserQuestionDto {
    let question: String
    let answer: String
}

class QuestionAdapter {
    
    let questionsCaretaker = UserQuestionsCaretaker()
    let answersCaretaker = UserAnswersCaretaker()
    
    func getUserQuestionDtoList() -> [UserQuestionDto] {
        let userQuestions = questionsCaretaker.load()
        let userAnswers = answersCaretaker.load()
        
        var result: [UserQuestionDto] = []
        
        for i in 0..<userQuestions.count {
            result.append(UserQuestionDto(question: userQuestions[i], answer: userAnswers[i]))
        }
        
        return result
    }
    
    func saveUserQuestionsAnswers(questions: [String], answers: [String]) {
        questionsCaretaker.save(questions: questions)
        answersCaretaker.save(answers: answers)
    }
}
