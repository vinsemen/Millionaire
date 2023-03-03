//
//  GameResult.swift
//  Millionaire
//
//  Created by Семён Винников on 28.02.2023.
//

import Foundation

struct GameResults: Codable {
    let answers: [Answer]
    let questions: [Question]
    let score: Score
    let started: Date
    let ended: Date
}
