//
//  SecondTaskViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 19.03.24.
//

import UIKit

/// Для обработки и показа вторий задачи
final class SecondTaskViewController: UIViewController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTimer()
    }
    
    // MARK: - Private Methodes
    
    private func createTimer() {
        let timer = TimerThread(duration: 10)
        timer.start()
    }
}

/// класс для создания таймера и его использования
final class TimerThread: Thread {
    
    // MARK: Private Properties
    
    private var timerDuration: Int
    private var timer: Timer!
    
    // MARK: Initializers

    init(duration: Int) {
        self.timerDuration = duration
    }
    
    // MARK: Private Methodes

    override func main() {
        // Создаем таймер, который будет выполняться каждую секунду
        timer = Timer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
        
        print(Thread.current)
        
        // Добавляем таймер в текущий run loop ниже
        RunLoop.current.add(
            timer, 
            forMode: .default
        )
        
        // Запускаем текущий run loop ниже
        RunLoop.current.run()
    }
    
    @objc func updateTimer() {
        // Ваш код здесь будет выполняться каждую секунду
        if timerDuration > 0 {
            print("Осталось \(timerDuration) секунд...")
            timerDuration -= 1
        } else {
            print("Время истекло!")
            
            timer.invalidate()
            // Остановка текущего run loop после завершения таймера
            CFRunLoopStop(CFRunLoopGetCurrent())
        }
    }
}

