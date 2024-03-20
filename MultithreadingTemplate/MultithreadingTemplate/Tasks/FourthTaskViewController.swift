//
//  FourthTaskViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 19.03.24.
//

import UIKit

/// Task 2. Управление потоком Thread, приоритет выполнения потоков, GCD.
final class FourthTaskViewController: UIViewController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Создаем и запускаем поток
        let thread1 = ThreadprintDemon()
        let thread2 = ThreadprintAngel()
        // UserInteractive
        // UserInitiated
        // Default
        // Utility
        // Background
        
        // MARK: - Вариант1 - Меняем приоритеты / сначало 1 затем 2
        
        thread1.qualityOfService = .default
        thread2.qualityOfService = .background
        
        thread1.start()
        thread2.start()
        
        // MARK: - Вариант2 - Меняем приоритеты еще раз / сначало 2 затем 1
        
//        thread1.qualityOfService = .utility
//        thread2.qualityOfService = .userInitiated
//        
//        thread1.start()
//        thread2.start()
        
        // MARK: - Вариант 3 - Меняем приоритеты еще раз для перемешки
        
//        thread1.qualityOfService = .default
//        thread2.qualityOfService = .default
//        
//        thread1.start()
//        thread2.start()
        
    }
}

    final class ThreadprintDemon: Thread {
        override func main() {
            for _ in (0..<100) {
                print("1")
            }
        }
    }

    final class ThreadprintAngel: Thread {
        override func main() {
            for _ in (0..<100) {
                print("2")
            }
        }
    }
