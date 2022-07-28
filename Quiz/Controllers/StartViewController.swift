//
//  ViewController.swift
//  Quiz
//
//  Created by Julia Semyzhenko on 6/26/22.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var questionsTableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        if let name = nameTextField.text, nameTextField.text != ""  {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "GameViewController")
                    as? GameViewController else { return }
            vc.name = name
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func scoresPressed(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ScoresViewController")
                as? ScoresViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension StartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let outputText = "\(indexPath.row + 1) - \(questions[indexPath.row].flag) - " +
        "\(questions[indexPath.row].options.joined(separator: ", "))"
        cell.textLabel?.text = outputText
        return cell
    }
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
