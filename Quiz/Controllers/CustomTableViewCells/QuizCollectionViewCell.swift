//
//  QuizCollectionViewCell.swift
//  Quiz
//
//  Created by Julia Semyzhenko on 7/4/22.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var option1: UILabel!
    @IBOutlet weak var option2: UILabel!
    @IBOutlet weak var option3: UILabel!
    @IBOutlet weak var option4: UILabel!
    
    @IBOutlet weak var control1: UIControl!
    @IBOutlet weak var control2: UIControl!
    @IBOutlet weak var control3: UIControl!
    @IBOutlet weak var control4: UIControl!
    
    
    var setValue: Question? {
        didSet {
            flagLabel.text = setValue?.flag
            option1.text = setValue?.options[0]
            option2.text = setValue?.options[1]
            option3.text = setValue?.options[2]
            option4.text = setValue?.options[3]
        }
    }
    
    @IBAction func optionPressed(_ sender: UIControl) {
        cleanBorders()
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor.white.cgColor
        
        switch sender.tag {
        case 1:
            setValue?.addWrongAnswer(wrongAnswer: option1.text)
        case 2:
            setValue?.addWrongAnswer(wrongAnswer: option2.text)
        case 3:
            setValue?.addWrongAnswer(wrongAnswer: option3.text)
        case 4:
            setValue?.addWrongAnswer(wrongAnswer: option4.text )
        default:
            break
        }
    }
    func cleanBorders() {
        control1.layer.borderWidth = 0
        control2.layer.borderWidth = 0
        control3.layer.borderWidth = 0
        control4.layer.borderWidth = 0
        
    }
}
