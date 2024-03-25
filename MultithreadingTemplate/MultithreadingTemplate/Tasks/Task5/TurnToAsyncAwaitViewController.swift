//
//  TurnToAsyncAwaitViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 24.03.24.
//

import UIKit

// перевести данный код на async await

// исходная версия
//class ViewController: UIViewController {
//    
//
//    override func viewDidLoad() {
//            super.viewDidLoad()
//        
//
//        func randomD6() -> Int {
//            Int.random(in: 1...6)
//        }
//
//        let result =  randomD6()
//        print(result)
//    }
//}

/// Задача 4 из Task 5
final class TurnToAsyncAwaitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            // 2. Вызываем с помощью ключевого слова await его в блоке Task
            let result = await randomD6()
            print(result)
        }
    }
    
    // 1. делаем функцию randomD6 асинхронной
    func randomD6() async -> Int {
        return Int.random(in: 1...6)
    }
}

