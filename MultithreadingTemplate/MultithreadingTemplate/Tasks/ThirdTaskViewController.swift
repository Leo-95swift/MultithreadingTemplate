//
//  ThirdTaskViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 19.03.24.
//

import UIKit

/// Task 2. Управление потоком Thread, приоритет выполнения потоков, GCD.
final class ThirdTaskViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createInfinityThread()
    }
    
    // MARK: - Private Methodes
    
    private func createInfinityThread() {
        // Создаем и запускаем поток
        let infinityThread = InfinityLoop()
        infinityThread.start()
        print("Before sleep")
        print(1)
        print("isExecuting - \(infinityThread.isExecuting)") // isExecuting true
        print("isCancelled - \(infinityThread.isCancelled)") // isCancelled false
        print("isFinished - \(infinityThread.isFinished)")   // isFinished false

        // Подождем некоторое время, а затем отменяем выполнение потока
        sleep(5)
        // я сейчас вернусь
        
        // Отменяем тут
        if infinityThread.counter == 5 {
            infinityThread.cancel()
           
            print("after cancelling")
            sleep(1)
            print("isExecuting - \(infinityThread.isExecuting)")  // isExecuting false
            print("isCancelled - \(infinityThread.isCancelled)")  // isCancelled true
            print("isFinished - \(infinityThread.isFinished)")    // isFinished true
        }
    }
}

/// класс для создания таймера и его использования
final class InfinityLoop: Thread {
    var counter = 0
    
    override func main() {
        while counter < 30 && !isCancelled {
            counter += 1
            print(counter)
            InfinityLoop.sleep(forTimeInterval: 1)
        }
    }
}
