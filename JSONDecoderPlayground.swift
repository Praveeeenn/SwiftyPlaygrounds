//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport


class Post: Codable {
    var userId: Int
                                                                                                                                                                                                                                                                             var id: Int
    var title: String
    var body: String
    var sdsjd: String?
}

//======================================
PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard error == nil else {
        print(error?.localizedDescription ?? "")
        return
    }
    
    if let data = data, let contents = String(data: data, encoding: String.Encoding.utf8) {
        print(contents)
        let jsonData = Data(contents.utf8)
        
        let decoder = JSONDecoder()
        
        do {
            if let people = try decoder.decode(Post.self, from: jsonData) as? Post{
           // for people in peoples {
            print("UserID: \(people.userId)")
            print("ID: \(people.id)")
            print("TITLE: \(people.title)")
            print("BODY: \(people.body)")
            print("======================")
                //  }
            }
        }catch {
            print(error.localizedDescription)
        }
        
    }
}
task.resume()
