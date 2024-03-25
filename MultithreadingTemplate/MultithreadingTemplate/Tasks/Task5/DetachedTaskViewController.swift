//
//  DetachedTaskViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 24.03.24.
//

import UIKit

/// Задача 3 из Task 5
final class DetachedTaskViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Task 1 is finished")
        
        Task.detached(priority: .userInitiated) {
            for i in 0..<50 {
                print(i)
            }
            print("Task 2 is finished")
        }
        
        print("Task 3 is finished")
    }
}

// разница между dispatchQueue.global().async и task.detached

/*
DispatchQueue работает с блоками кода, которые отправляются в очередь для асинхронного выполнения. Она не имеет встроенного способа отслеживания или отмены выполнения задачи.
Task.detached создает новую асинхронную задачу. Она поддерживает отмену, приоритеты и обработку ошибок. Она также позволяет использовать async/await для управления асинхронным выполнением.
*/
