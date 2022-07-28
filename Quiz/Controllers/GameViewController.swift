//
//  GameViewController.swift
//  Quiz
//
//  Created by Julia Semyzhenko on 7/4/22.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var index = 0
    var score = 0
    var currentQuestion: Question?
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if (index < questions.count-1), (currentQuestion?.wrongAnswer != nil) {
            if currentQuestion?.wrongAnswer == currentQuestion?.answer {
                score += 1
                scoreLabel.text = "Score: \(score)"
                feedbackLabel.text = "Right"
            }
            else {
                feedbackLabel.text = "Wrong"
            }
            progressBar.setProgress(Float(index) / Float(questions.count - 1), animated: false)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.feedbackLabel.text = ""
                self.collectionView.scrollToItem(at: IndexPath(row: self.index, section: 0), at: .right, animated: true)
            }
            index += 1
        } else {
            index += 1
        }
        if currentQuestion?.wrongAnswer == nil {
            feedbackLabel.text = "Please choose your answer"
        }
        if index == questions.count, currentQuestion?.wrongAnswer != nil {
            if currentQuestion?.wrongAnswer == currentQuestion?.answer {
                score += 1
            }
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController else { return }
            scoreLabel.text = "Score: \(score)"
            vc.score = score
            Base.shared.saveUser(name: name, score: score)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCollectionViewCell", for: indexPath) as? QuizCollectionViewCell else { return UICollectionViewCell() }
        cell.setValue = questions[indexPath.row]
        currentQuestion = questions[indexPath.row]
        cell.cleanBorders()
        return cell
    }
}
