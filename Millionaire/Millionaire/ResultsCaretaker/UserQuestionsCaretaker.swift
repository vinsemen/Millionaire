//
//  UserQuestionsCaretaker.swift
//  Millionaire
//
//  Created by Семён Винников on 28.02.2023.
//

import Foundation

typealias UserQuestionsMemento = Data

class UserQuestionsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "userQuestions"
    
    func save(questions: [String]) {
        do {
            let data: UserQuestionsMemento = try encoder.encode(questions)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [String] {
        guard let data: UserQuestionsMemento = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([String].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
