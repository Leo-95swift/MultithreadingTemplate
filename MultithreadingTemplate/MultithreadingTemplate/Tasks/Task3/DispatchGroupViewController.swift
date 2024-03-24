//
//  DispatchGroupViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 22.03.24.
//

import UIKit

/*
Наберите весь код руками.
 Исправить AsyncWorker так, чтобы completion возвращал
 сразу все 5 постов в главном потоке.
*/

/// Задача 2 из Task 3.
final class DispatchGroupViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let asyncWorker = AsyncWorker()
        
        asyncWorker.doJobs(postNumbers: 1, 2, 3, 4, 5) { posts in
            print(Thread.current)
            print(posts.map { $0.id })
        }
    }
}

final class AsyncWorker {
        func doJobs(postNumbers: Int..., completion: @escaping ([Post]) -> Void) {
            var posts = [Post]()
            let group = DispatchGroup()
            
            for i in postNumbers {
                group.enter()
                URLSession.shared.dataTask(
                    with: URLRequest(url: URL(
                        string: "https://jsonplaceholder.typicode.com/todos/\(i)")!)
                ) { data, response, error in
                    guard let data = data else {
                        return
                    }
                    if let post = try? JSONDecoder().decode(Post.self, from: data) {
                        posts.append(post)
                        group.leave()
                    }
                }
                .resume()
            }
            
            group.notify(queue: .main) {
                completion(posts)
            }
            
        }
    }

    struct Post: Codable {
        var userId: Int
        var id: Int
        var title: String
        var completed: Bool
    }
