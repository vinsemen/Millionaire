//
//  Result.swift
//  Millionaire
//
//  Created by Семён Винников on 19.02.2023.
//

import Foundation

struct Result: Codable {
    let answers: [Answer]
    let questions: [Question]
    let score: Score
    let started: Date
    let ended: Date
}
