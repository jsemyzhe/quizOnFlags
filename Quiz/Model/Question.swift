//
//  Question.swift
//  Quiz
//
//  Created by Julia Semyzhenko on 7/3/22.
//

import Foundation

class Question {
    let flag: String
    var options: [String]
    let answer: String
    var wrongAnswer: String?
    
    init(flag: String, options: [String], answer: String, wrongAnswer: String? = nil ) {
        self.flag = flag
        self.options = options.shuffled()
        self.answer = answer
        
    }
    func addWrongAnswer(wrongAnswer: String?) {
        self.wrongAnswer = wrongAnswer
    }
}

var questions = [
    Question(flag: "🇦🇫", options: ["Afghanistan", "Hungary", "Ecuador", "Colombia"], answer: "Afghanistan"),
    Question(flag: "🇦🇱", options: ["Albania", "Belgium", "Bolivia", "Chad"], answer: "Albania"),
    Question(flag: "🇦🇩", options: ["Andorra", "Brazil", "Costa Rica", "Germany"], answer: "Andorra"),
    Question(flag: "🇦🇷", options: ["Argentina", "Guatemala", "Estonia", "Israel"], answer: "Argentina"),
    Question(flag: "🇦🇲", options: ["Armenia", "Hungary", "Bolivia", "Azerbaijan"], answer: "Armenia"),
    //    Question(flag: "🇦🇺", options: ["Australia", "the United Kingdom", "Iceland", "the United States"], answer: "Australia"),
    //    Question(flag: "🇦🇹", options: ["Austria", "Hungary", "Poland", "Costa Rica"], answer: "Austria"),
    //    Question(flag: "🇦🇿", options: ["Azerbaijan", "Bolivia", "Bulgaria", "Georgia"], answer: "Azerbaijan"),
    //    Question(flag: "🇧🇸", options: ["Bahamas", "Guadeloupe", "Hungary", "Ecuador"], answer: "Bahamas"),
    //    Question(flag: "🇧🇩", options: ["Bangladesh", "Guatemala", "Bulgaria", "Estonia"], answer: "Bangladesh"),
    //    Question(flag: "🇧🇧", options: ["Barbados", "Haiti", "Brunei", "Estonia"], answer: "Barbados"),
    //    Question(flag: "🇧🇪", options: ["Belgium", "Germany", "Andorra", "Armenia"], answer: "Belgium"),
    //    Question(flag: "🇧🇴", options: ["Bolivia", "Chad", "Brunei", "Estonia"], answer: "Bolivia"),
    //    Question(flag: "🇧🇦", options: ["Bosnia & Herzegovina", "Bulgaria", "Greece", "Estonia"], answer: "Bosnia & Herzegovina"),
    //    Question(flag: "🇧🇼", options: ["Botswana", "Greece", "Finland", "Estonia"], answer: "Botswana"),
    //    Question(flag: "🇧🇷", options: ["Brazil", "Haiti", "Guadeloupe", "Zimbabwe"], answer: "Brazil"),
    //    Question(flag: "🇧🇳", options: ["Brunei", "Chad", "Haiti", "Chile"], answer: "Brunei"),
    //    Question(flag: "🇨🇦", options: ["Canada", "China", "Guatemala", "Denmark"], answer: "Canada"),
    //    Question(flag: "🇮🇨", options: ["the Canary Islands", "Bulgaria", "Brunei", "Ecuador"], answer: "the Canary Islands"),
    //    Question(flag: "🇫🇷", options: ["France", "Denmark", "Croatia", "Costa Rica"], answer: "France"),
    //    Question(flag: "🇫🇮", options: ["Finland", "Greece", "Estonia", "Sweden"], answer: "Finland"),
    //    Question(flag: "🇪🇪", options: ["Estonia", "Australia", "Finland", "Sweden"], answer: "Estonia"),
    //    Question(flag: "🇪🇨", options: ["Ecuador", "Chad", "Haiti", "Brunei"], answer: "Ecuador"),
    //    Question(flag: "🇩🇰", options: ["Denmark", "Canada", "China", "Guatemala"], answer: "Denmark"),
    //    Question(flag: "🇨🇺", options: ["Cuba", "Australia", "Haiti", "Greece"], answer: "Cuba"),
    //    Question(flag: "🇭🇷", options: ["Croatia", "Bulgaria", "Finland", "Cuba"], answer: "Croatia"),
    //    Question(flag: "🇨🇷", options: ["Costa Rica", "Bulgaria", "Greece", "Cuba"], answer: "Costa Rica"),
    //    Question(flag: "🇨🇴", options: ["Colombia", "Chad", "Brunei", "Ecuador"], answer: "Colombia"),
    //    Question(flag: "🇨🇱", options: ["Chile", "China", "Guatemala", "Haiti"], answer: "Chile"),
    //    Question(flag: "🇨🇳", options: ["China", "Canada", "Chile", "South Korea"], answer: "China"),
    //    Question(flag: "🇹🇩", options: ["Chad", "Bulgaria", "Ecuador", "Colombia"], answer: "Chad"),
    //    Question(flag: "🇨🇫", options: ["the Central African Republic", "Haiti", "Brunei", "Finland"], answer: "the Central African Republic"),
    //    Question(flag: "🇬🇪", options: ["Georgia", "Greece", "Finland", "Austria"], answer: "Georgia"),
    //    Question(flag: "🇩🇪", options: ["Germany", "Austria", "Belgium", "Colombia"], answer: "Germany"),
    //    Question(flag: "🇬🇷", options: ["Greece", "Australia", "Botswana", "Finland"], answer: "Greece"),
    //    Question(flag: "🇬🇵", options: ["Guadeloupe", "Guatemala", "Georgia", "Estonia"], answer: "Guadeloupe"),
    //    Question(flag: "🇬🇹", options: ["Guatemala", "Bulgaria", "Greece", "Germany"], answer: "Guatemala"),
    //    Question(flag: "🇭🇹", options: ["Haiti", "Canada", "Ecuador", "Chad"], answer: "Haiti"),
    //    Question(flag: "🇭🇺", options: ["Hungary", "Brunei", "Chad", "France"], answer: "Hungary"),
    //    Question(flag: "🇮🇸", options: ["Iceland", "Australia", "Israel", "Ireland"], answer: "Iceland"),
    //    Question(flag: "🇮🇳", options: ["India", "Chad", "Colombia", "Chile"], answer: "India"),
    //    Question(flag: "🇮🇩", options: ["Indonesia", "Chad", "China", "Poland"], answer: "Indonesia"),
    //    Question(flag: "🇮🇱", options: ["Israel", "Australia", "Greece", "Finland"], answer: "Israel"),
    //    Question(flag: "🇮🇹", options: ["Italy", "Canada", "France", "Colombia"], answer: "Italy"),
    //    Question(flag: "🇮🇪", options: ["Ireland", "France", "Colombia", "Italy"], answer: "Ireland"),
    //    Question(flag: "🇬🇧", options: ["the United Kingdom", "Australia", "Finland", "France"], answer: "the United Kingdom"),
    //    Question(flag: "🇺🇸", options: ["the United States", "Greece", "Australia", "France"], answer: "the United States"),
    //    Question(flag: "🇿🇼", options: ["Zimbabwe", "Canada", "China", "Chile"], answer: "Zimbabwe"),
    //    Question(flag: "🇸🇪", options: ["Sweden", "Guatemala", "Finland", "Estonia"], answer: "Sweden"),
    //    Question(flag: "🇰🇷", options: ["South Korea", "Guatemala", "Bulgaria", "Haiti"], answer: "South Korea")
].shuffled()
