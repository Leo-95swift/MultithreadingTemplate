//
//  RecipeViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 22.03.24.
//

import UIKit

/// Задача 6 из Task 3.
final class RecipeViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            self.thread1()
        }

        DispatchQueue.global().async {
            self.thread2()
        }
    }

    let resourceASemaphore = DispatchSemaphore(value: 1)
    let resourceBSemaphore = DispatchSemaphore(value: 1)

    func thread1() {
        print("Поток 1 пытается захватить Ресурс A")
        resourceASemaphore.wait() // Захват Ресурса A
        
        print("Поток 1 захватил Ресурс A и пытается захватить Ресурс B")
        Thread.sleep(forTimeInterval: 1) 
        // Имитация работы для демонстрации livelock
        
//        resourceBSemaphore.wait() 
        
        // Попытка захвата Ресурса B, который уже занят Потоком 2
        print("Поток 1 захватил Ресурс B")
        
//        resourceBSemaphore.signal()
        resourceASemaphore.signal()
    }

    func thread2() {
        print("Поток 2 пытается захватить Ресурс B")
        resourceBSemaphore.wait() // Захват Ресурса B
        
        print("Поток 2 захватил Ресурс B и пытается захватить Ресурс A")
        Thread.sleep(forTimeInterval: 1) 
        // Имитация работы для демонстрации livelock
        
//        resourceASemaphore.wait() 
        // Попытка захвата Ресурса A, который уже занят Потоком 1
        print("Поток 2 захватил Ресурс A")
        
//        resourceASemaphore.signal()
        resourceBSemaphore.signal()
    }
}

// в нашем коде нет liveLock-а так как строчки 36 41 и 53 57 прокоментированы
// мы могли бы получить liveLock если бы оба потока блокировали ресурсы друг у друга
// то бы привило к тому, что оба потока ждали бы друг друга вечно
