//
//  CustomOperationQueueViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 24.03.24.
//

import UIKit

/// Задача 3 из Task 4.
final class CustomOperationQueueViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rmOperationQueue = RMOperationQueue()
        
        let rmOperation1 = RMOperation()
        rmOperation1.priority = .background
        
        rmOperation1.completionBlock = {
            print(1)
        }
        
        let rmOperation2 = RMOperation()
        rmOperation2.priority = .userInteractive
        
        rmOperation2.completionBlock = {
            print(2)
        }
        
        let rmOperation3 = RMOperation()
        rmOperation3.priority = .userInteractive
        
        rmOperation3.completionBlock = {
            print(3)
        }
        
        rmOperationQueue.addOperation(rmOperation1)
        rmOperationQueue.addOperation(rmOperation2)
        rmOperationQueue.addOperation(rmOperation3)
        
    }
}

protocol RMOperationQueueProtocol {
    /// Тут храним пул наших операций
    var operations: [RMOperation] { get }
    /// Добавляем наши кастомные операции в пул operations
    func addOperation(_ operation: RMOperation)
    /// Запускаем следующую
    func executeNextOperation()
}

// Класс, управляющий очередью операций
final class RMOperationQueue: RMOperationQueueProtocol {
    var operations: [RMOperation] = []
    
    func addOperation(_ operation: RMOperation) {
        operations.append(operation)
        executeNextOperation()
    }
    
    func executeNextOperation() {
        if let nextOperation = operations
            .first(where: { !$0.isExecuting && !$0.isFinished }) {
            executeNextOperation()
        }
    }
}

