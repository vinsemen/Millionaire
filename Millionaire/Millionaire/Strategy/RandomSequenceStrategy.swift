//
//  RandomSequenceStrategy.swift
//  Millionaire
//
//  Created by Семён Винников on 23.02.2023.
//

import Foundation

class RandomSequenceStrategy: SequenceStrategy {
    
    func getQuestions(initial: [Question]) -> [Question] {
        return initial.shuffled()
    }
}
