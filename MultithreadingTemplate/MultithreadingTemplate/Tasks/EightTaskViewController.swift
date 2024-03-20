//
//  EightTaskViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 20.03.24.
//

import UIKit

/// Task 2. Управление потоком Thread, приоритет выполнения потоков, GCD.
final class EightTaskViewController: UIViewController {
    
    private lazy var name = "I love RM"
    // создаем lock для синхронизации
    let lock = NSLock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName()
    }
    
    func updateName() {
        DispatchQueue.global().async {
            // используем блок чтобы не допустить
            // одновременное действие с name
            self.lock.lock()
            print(self.name) // Считываем имя из global
            print(Thread.current)
            self.lock.unlock()
        }
        
        // используем блок чтобы не допустить
        // одновременное действие с name
         self.lock.lock()
        print(self.name) // Считываем имя из main
         self.lock.unlock()
    }
}
