//
//  ResultsViewController.swift
//  Quiz
//
//  Created by Julia Semyzhenko on 7/15/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answersTableView: UITableView!
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Your score is: \(score)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func scoresPressed(_ sender: UIButton) {
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScoresViewController") as?
                ScoresViewController else { return }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as?
                StartViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ResultsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as? ResultsTableViewCell {
            if questions[indexPath.row].answer == questions[indexPath.row].wrongAnswer {
                cell.numberLabel.text = "\(indexPath.row + 1)"
                cell.flagLabel.text =  "\(questions[indexPath.row].flag)"
                cell.rightAnswerLabel.text = questions[indexPath.row].answer
                cell.wrongMarkImage.isHidden = true
                cell.wrongAnswerLabel.text = "   👍🏻"
            } else {
                cell.numberLabel.text = "\(indexPath.row + 1)"
                cell.flagLabel.text = "\(questions[indexPath.row].flag)"
                cell.rightAnswerLabel.text = questions[indexPath.row].answer
                cell.wrongAnswerLabel.text = questions[indexPath.row].wrongAnswer
            }
            return cell
        }
        return UITableViewCell()
    }
}
