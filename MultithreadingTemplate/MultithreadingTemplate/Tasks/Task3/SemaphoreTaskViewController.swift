//
//  SemaphoreTaskViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 19.03.24.
//

import UIKit

/*
 
 Наберите весь код руками.
 Дан сервис, через который записываем фразы в массив используя цикл.
 1) Используя DispatchQueue.global() у записывайте фразы через цикл,
 а не через main thread.
 2) Решить проблему потокобезопасности phrases через семафор.
 3) Решить проблему, используя actor вместо класса.
 
 */

/// Задача 1 из Task 3.
final class SemaphoreTaskViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phrasesService = PhrasesService()
        
        DispatchQueue.global().async {
            for i in 0..<10 {
                phrasesService.addPhrase("Phrase \(i)")
            }
        }
        
        // Даем потокам время на завершение работы
        Thread.sleep(forTimeInterval: 1)
        
        // Выводим результат
        print(phrasesService.phrases)
    }
}
 
final class PhrasesService {
    var phrases: [String] = []
    let semaphore = DispatchSemaphore(value: 1)
    
    func addPhrase(_ phrase: String) {
        semaphore.wait()
        phrases.append(phrase)
        semaphore.signal()
    }
}
