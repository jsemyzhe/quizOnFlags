//
//  UserData.swift
//  Quiz
//
//  Created by Julia Semyzhenko on 7/17/22.
//

import Foundation



class Base {
    let defaults  = UserDefaults.standard
    
    static let shared = Base()
    struct UserInfo: Codable, Hashable {
        var name: String
        var score: Int
        var result: String {
            return "\(name) - \(score)"
        }
    }
    
    var users: [UserInfo] {
        get {
            if let data = defaults.value(forKey: "userList") as? Data {
                return try! PropertyListDecoder().decode([UserInfo].self, from: data)
            } else {
                return [UserInfo]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "userList")
            }
        }
    }
    
    func saveUser(name: String, score: Int) {
        let user = UserInfo(name: name, score: score)
        users.insert(user, at: 0)
        users = users.sorted { $0.score > $1.score }
    }
}
