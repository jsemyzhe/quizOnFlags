//
//  ScoresViewController.swift
//  Quiz
//
//  Created by Julia Semyzhenko on 7/16/22.
//

import UIKit

class ScoresViewController: UIViewController {
    
    @IBOutlet weak var scoresTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playAgainPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "StartViewController")
                as? StartViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ScoresViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Base.shared.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)  - " + Base.shared.users[indexPath.row].result
        return cell
    }
}
