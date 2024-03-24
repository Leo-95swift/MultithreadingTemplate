//
//  DispatchQueueViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 24.03.24.
//

import UIKit

/// Задача 1 из Task 5
final class DispatchQueueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1)
        DispatchQueue.main.async {
            print(2)
        }
        print(3)
    }
}

// сначала выведится 1

// потом print(2) добавляется в очередь ожидания
// потом выведится 3
// потом уже выведится 2

// в итоге получаем 1, 3, 2
