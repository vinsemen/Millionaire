//
//  Game.swift
//  Millionaire
//
//  Created by Семён Винников on 19.02.2023.
//

import Foundation

class Game {
    
    static let shared = Game()
    private var session: GameSession?
    
    private (set) var results: [Result] = []
    private (set) var settings: GameSetting
    
    private let resultsCaretaker = ResultsCaretaker()
    private let settingsCaretaker = GameSettingsCarectaker()
    private var userQuestionsAdapter = QuestionAdapter()
    
    private var questionBuilder = QuestionBuilder()
    
    private init() {
        results = self.resultsCaretaker.retrieveRecords()
        settings = self.settingsCaretaker.loadSetting()
    }
    
    //MARK: - Functions
    func addResult(_ result: Result) {
        self.results.append(result)
        resultsCaretaker.save(results: results)
    }
    
    func saveSettings(_ settings: GameSetting) {
        self.settings = settings
        settingsCaretaker.saveSetting(setting: settings)
    }
    
    func saveUserQuestionsAnswers(questions: [String], answers: [String]) {
        userQuestionsAdapter.saveUserQuestionsAnswers(questions: questions, answers: answers)
    }
    
    func getUserQuestionsAnswers() -> [UserQuestionDto] {
        return userQuestionsAdapter.getUserQuestionDtoList()
    }
    
    func clearResults() {
        self.results = []
    }
    
    //MARK: - New Game
    func newGame() {
        let questionBuilder = QuestionBuilder()
        
        let questions = StrategyFactory
            .factory(strategy: settings.strategyType)
            .getQuestions(initial: questionBuilder.build(userQuestionsAnswersDto: userQuestionsAdapter.getUserQuestionDtoList()))
        
        session = GameSession(questions: questions)
    }
    
    
    func finish() -> Result? {
        let results = session?.finish()
        session = nil
        
        return results
    }
    
    func handleAnswer(_ answer: Answer) -> QuestionModel? {
        return session?.handleAnswer(answer)
    }
    
    func getQuestionViewModel() -> QuestionModel? {
        return session?.getQuestionViewModel()
    }
    
 
    
    
    
    
    
    
}
