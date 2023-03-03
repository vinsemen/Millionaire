//
//  GameProgress.swift
//  Millionaire
//
//  Created by Семён Винников on 28.02.2023.
//

import Foundation

struct GameProgress: CustomStringConvertible {
    var description: String {
        return "\(current + 1)/\(total)"
    }
    
    let current: Int
    let total: Int
    
}
