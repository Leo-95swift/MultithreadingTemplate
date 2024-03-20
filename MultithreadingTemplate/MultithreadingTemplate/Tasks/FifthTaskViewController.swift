//
//  FifthTaskViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 19.03.24.
//

import UIKit

/// Task 2. Управление потоком Thread, приоритет выполнения потоков, GCD.
final class FifthTaskViewController: UIViewController {
    
    private var name = "Введите имя"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName()
    }
    
    func updateName() {
        DispatchQueue.global().sync {
            self.name = "I love RM" // Перезаписываем имя в другом потоке
            print(Thread.current)
            print(self.name)
        }
        
        print(self.name) // Считываем имя из main
    }
}
/*
 в первом случае у нас в консоле выведется рандомный порядок
 это из-за того что мы не можем точно определить который блок сработает быстрее
 то есть если в момент вывода в консоль мы уже успели поменять значемия name-а то в консоль выведется новое значение, а если не то дифольтное
*/

/*
 во втором варианте когда мы поменяли async на sync
 то уже можно с точностью сказать что в первую очередь выполнится блок 
 1. global().sync
 потом
 2. print(self.name) с глобального потока

 3. и только после этого
 print(self.name) с маин потока
 */
