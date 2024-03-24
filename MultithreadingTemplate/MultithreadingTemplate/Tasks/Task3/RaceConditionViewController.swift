//
//  RaceConditionViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 22.03.24.
//

import UIKit

/// Задача 4 из Task 3.
final class RaceConditionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sharedResource = 0
        let lock = NSLock()
        
        DispatchQueue.global(qos: .background).async {
            for _ in 1...100 {
                lock.lock()
                sharedResource += 1
                lock.unlock()
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            for _ in 1...100 {
                lock.lock()
                sharedResource += 1
                lock.unlock()
            }
        }
    }
}

// RaceCondition это проблема многопоточности.

// Возникает в случае если больше одного потока
// имеет одновременный доступ к тому же самому обьекту.

// И когда полученныч в итоге действий результат не совподает с
// ожыдаемым результатом, так как зависит от очередности действий потоков.

// РЕШЕНИЕ

// Можно решить с помощю примитивов синхронизации
// Семафоры
// Мьютексы
// NSLock
// .Barrier
//   ....
