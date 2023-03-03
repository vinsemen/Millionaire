//
//  GameSession.swift
//  Millionaire
//
//  Created by Семён Винников on 19.02.2023.
//

import Foundation

typealias Score = UInt

//class GameSession {
//    var date: Date
//    var answerCorrect: Int
//    var allAnswer: Int
//
//    init(date: Date, answerCorrect: Int, allAnswer: Int) {
//        self.date = date
//        self.answerCorrect = answerCorrect
//        self.allAnswer = allAnswer
//    }
//
//}


class GameSession {
    private(set) var currentQuestion: Int = 0 {
        didSet {
            self.notificateGameProgress()
        }
    }
    
    private(set) var questions: [Question] = []
    private(set) var createdAt: Date
    private(set) var score: Score = 0
    private(set) var answers: [Answer] = []
    
    init(questions: [Question]) {
        
        self.questions = questions
        createdAt = Date()
        
        notificateGameProgress()
    }
    
    private func notificateGameProgress() {
        NotificationCenter.default.post(
            name: .gameProgressNotification,
            object: GameProgress(current: currentQuestion, total: questions.count)
        )
    }
    
    func finish() -> Result {
        return Result(answers: answers,
                      questions: questions,
                      score: score,
                      started: createdAt,
                      ended: Date())
    }
    
    private func getCurrentQuestion() -> Question? {
        if questions.count <= currentQuestion {
            return nil
        }
        
        return questions[currentQuestion]
    }
    
    func handleAnswer(_ answer: Answer) -> QuestionModel {
        answers.append(answer)
        
        let q = getCurrentQuestion()!
        let isRight = isAnswerRight(answer, question: q)
        handleScore(isRight)
        
        currentQuestion += 1
        
        let nextQuestion = getCurrentQuestion()
        
        return buildQuestiovViewModel(q: nextQuestion, shouldEndGame: !isRight || nextQuestion == nil)
    }
    
    private func buildQuestiovViewModel(q: Question?, shouldEndGame: Bool) -> QuestionModel {
        return QuestionModel(
            question: q,
            score: score,
            shouldEndGame: shouldEndGame
        )
    }
    
    func getQuestionViewModel() -> QuestionModel {
        let q = getCurrentQuestion()
        return buildQuestiovViewModel(q: q, shouldEndGame: q == nil)
    }
    
    // начислить очки
    private func handleScore(_ isAnswerRight: Bool) {
        if !isAnswerRight { return }
        
        score += 1
    }
    
    // проверить, правильный ли ответ
    private func isAnswerRight(_ answer: Answer, question: Question) -> Bool {
        // получить текущий вопрос
        // получить вариант
        guard let v = question.variants[answer] else { return false }
        
        return v.isRight
    }
}

