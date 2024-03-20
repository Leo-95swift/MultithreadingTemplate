//
//  SixthTaskViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 20.03.24.
//

import UIKit

/// Task 2. Управление потоком Thread, приоритет выполнения потоков, GCD.
final class SixthTaskViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("A")
        
        // Блок 1
        DispatchQueue.main.async {
            print("B")
        }
        
        print("C")
    }
    
}

/*
 1. Виводится A / потому что мы по дефольту на маин,
    а там все последовательно,
    то есть что сверху то и печатается первым
 
 2. у нас есть async блок, он добавляется в очередь ожидания
    и сработает когда маин освободится
 
 3. идем дальше принтуем C
 
 4. теперь уже маин свободен, можно приступить к блоку 1
    делаем принт B
 
 таким образом в итоге получаем
 A C B
 */
