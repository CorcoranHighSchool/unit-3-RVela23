//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Rolando Vela on 5/3/23.
//

import Foundation

//The question structure
struct Question {
    var text : String
    var type : ResponseType
    var answers:[Answer]
}
//The type of response
enum ResponseType{
    case single, multiple, ranged
}
struct Answer{
    var text : String
    var type : AnimalType
}
enum AnimalType: Character{
    case cat = "🙀", turtle = "🐢", chicken = "🐓", dolphin = "🐬"
    
    var definition : String{
        switch self{
        case .cat :
            return "You are incredibly outgoing. You surround yourself with the people you loe and enjoy activities with your friends."
        case .turtle:
            return "Mischievious, yet mild-tempered, you enjoy doing things on your own terms."
        case .chicken:
            return "You love everything that's soft. You are healthy and full of energy."
        case .dolphin:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}
