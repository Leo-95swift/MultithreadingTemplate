//
//  ThreadSafeArrayViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 23.03.24.
//

import UIKit

/// Задача 4 из Task 4.

/// В данном примере у нас ситуация, которая называется race condition,
/// так называемый ТhreadSafeArray на самом деле не такой и потокабезопасный
/// потому что в нем и  firstOperation и secondOperation могут одновременно иметь дело  с массивом array
/// это может привести к неожидаемым результатом
/// для того чтобы решить эту проблему, надо обеспечить синхронизацию в работе с массивом

final class ThreadSafeArrayViewController: UIViewController {
    override func viewDidLoad() {
            super.viewDidLoad()
           
            // Использование
            let threadSafeArray = ThreadSafeArray()
            let operationQueue = OperationQueue()

            let firstOperation = FirstOperation(threadSafeArray: threadSafeArray)
            let secondOperation = SecondOperation(threadSafeArray: threadSafeArray)

            operationQueue.addOperation(firstOperation)
            operationQueue.addOperation(secondOperation)
       
        //  secondOperation.addDependency(firstOperation)
        
        /*
            можно было использовать этот вариант решения
            добавляя зависимость на вторую операцип мы гарантируем
            что она не начнется пока первая не завершится
        */

            // Дождитесь завершения операций перед выводом содержимого массива
            operationQueue.waitUntilAllOperationsAreFinished()

            print(threadSafeArray.getAll())
        }
    }

    // Объявляем класс для для синхронизации потоков
    final class ThreadSafeArray {
        private var array: [String] = []
        private let lock = NSLock()

        func append(_ item: String) {
            lock.lock()
            array.append(item)
            lock.unlock()
        }

        func getAll() -> [String] {
            return array
        }
    }

    // Определяем первую операцию для добавления строки в массив
    final class FirstOperation: Operation {
        let threadSafeArray: ThreadSafeArray

        init(threadSafeArray: ThreadSafeArray) {
            self.threadSafeArray = threadSafeArray
        }

        override func main() {
            if isCancelled { return }
            threadSafeArray.append("Первая операция")
        }
    }

    // Определяем вторую операцию для добавления строки в массив
    final class SecondOperation: Operation {
        let threadSafeArray: ThreadSafeArray
        
        init(threadSafeArray: ThreadSafeArray) {
            self.threadSafeArray = threadSafeArray
        }
        
        override func main() {
            if isCancelled { return }
            threadSafeArray.append("Вторая операция")
        }
    }
