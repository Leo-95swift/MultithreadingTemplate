//
//  NetworkService2ViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 25.03.24.
//

import UIKit

enum MessagesError: Error {
    case empty
    case failedToLoad
}

/// Задача 6 из Task 5
final class NetworkService2ViewController: UIViewController {
    
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                print(try await fetchMessages())
            } catch {
                print(error)
            }
        }
    }
    
    func fetchMessages() async throws -> [Message] {
        try await withCheckedThrowingContinuation { continutaion in
            networkService.fetchMessages { messages in
                if messages.isEmpty {
                    continutaion.resume(throwing: MessagesError.empty)
                } else {
                    continutaion.resume(returning: messages)
                }
            }
        }
    }
}
