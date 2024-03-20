//
//  SeventhTaskViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 20.03.24.
//

import UIKit

/// Task 2. Управление потоком Thread, приоритет выполнения потоков, GCD.
final class SeventhTaskViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print(2)
        DispatchQueue.main.async {
            print(3)
            // здесь у нас deadLock
            // для решения проблемы
            // надо sync сделать async
            DispatchQueue.main.sync {
                print(5)
            }
            print(4)
        }
        print(6)
    }
}


let vc = SeventhTaskViewController()
// print(1)
let view = vc.view
// print(7)

// 1, 2, 6, 7, 3, deadLock

// после решения задачи будет

// 1, 2, 6, 7, 3, 4, 5
