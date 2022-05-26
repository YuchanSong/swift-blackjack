//
//  InputError.swift
//  Blackjack
//
//  Created by ycsong on 2022/05/24.
//

import Foundation

enum InputError: LocalizedError {
    case invalidInput
    
    var errorDescription: String {
        switch self {
        case .invalidInput: return "사용자 입력 오류"
        }
    }
}
