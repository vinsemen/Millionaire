//
//  Questions New.swift
//  Millionaire
//
//  Created by Семён Винников on 28.02.2023.
//

import Foundation

enum Answer: String, Codable, CaseIterable {
    case A
    case B
    case C
    case D
}

struct Variant: Codable {
    var text: String
    var isRight: Bool
}

struct Question: Codable {
    var text: String
    var variants: [Answer: Variant]
    
    func rightAnswer() -> Variant? {
        for (_, v) in variants {
            if !v.isRight { continue }
            return v
        }
        
        return nil
    }
}

struct QuestionModel {
    
    var question: Question?
    var score: Score
    var shouldEndGame: Bool = false
    
}


