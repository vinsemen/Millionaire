//
//  Sequence.swift
//  Millionaire
//
//  Created by Семён Винников on 23.02.2023.
//

import Foundation

enum Sequence: Int, Codable {
    case sequentially
    case randomly
}

class GameSetting: Codable {
    var strategyType: Sequence = .sequentially
}
