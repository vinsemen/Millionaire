//
//  ResultsCaretaker.swift
//  Millionaire
//
//  Created by Семён Винников on 20.02.2023.
//

import Foundation

typealias Memento = Data

class ResultsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "results"
    
    func save(results: [Result]) {
        do {
            let data: Memento = try encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func retrieveRecords() -> [Result] {
        guard let data: Memento = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        
        do {
            return try decoder.decode([Result].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
