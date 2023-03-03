//
//  UserAnswersCaretaker.swift
//  Millionaire
//
//  Created by Семён Винников on 28.02.2023.
//

import Foundation

typealias UserAnswersMemento = Data

class UserAnswersCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "userAnswers"
    
    func save(answers: [String]) {
        do {
            let data: UserAnswersMemento = try encoder.encode(answers)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [String] {
        guard let data: UserAnswersMemento = UserDefaults.standard.data(forKey: key) else {
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
