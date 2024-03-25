//
//  MainActorViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 24.03.24.
//

import UIKit

/// Задача 2 из Task 5
final class MainActorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1)
        Task { @MainActor  in
            print(2)
        }
        print(3)
    }
}

// выводится 1, 3, 2
// с помощью ключевого слова @MainActor мы даём знать системе
// что действие будет именно на маин потоке
