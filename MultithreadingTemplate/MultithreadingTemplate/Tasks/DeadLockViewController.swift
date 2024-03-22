//
//  DeadLockViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 22.03.24.
//

import UIKit

/// Задача 3 из Task 3.
final class DeadLockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let serialQueue = DispatchQueue(label: "com.example.myQueue")
        let otherSerialQueue = DispatchQueue(label: "com.example.otherQueue")

        serialQueue.async {
           serialQueue.async {
               print("This will never be printed.")
           }
        }
    }
}

// у нас DeadLock

// В каких случаях это происходит?
// 1. DeadLock ( достаточно 1 потока )
//  . у нас должен быть serialQueue
//  . надо обращятся к тому же самому serialQueue
//  . надо использовать .sync

// для решения задачи можно изменить один из вышеуказанных
//  . поменять serial на concurrent
//  . Вызвать из другой серейной очереди
//  . использовать .async вместо .sync
