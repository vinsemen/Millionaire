//
//  QuestionSuccesion.swift
//  Millionaire
//
//  Created by Семён Винников on 22.02.2023.
//

import Foundation

protocol SequenceStrategy {
    func getQuestions(initial: [Question]) -> [Question]
}

class StrategyFactory {
    class func factory(strategy: Sequence) -> SequenceStrategy {
        switch strategy {
        case .randomly:
            return RandomSequenceStrategy()
        case .sequentially:
            return SequentiallyStrategy()
        }
    }
}
