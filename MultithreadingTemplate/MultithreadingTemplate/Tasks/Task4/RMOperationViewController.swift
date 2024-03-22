//
//  RMOperationViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 22.03.24.
//

import UIKit

protocol RMOperationProtocol {
    // Приоритеты
    var priority: DispatchQoS.QoSClass { get }
    // Выполняемый блок
    var completionBlock: (() -> Void)? { get }
    // Завершена ли операция
    var isFinished: Bool { get }
    // Метод для запуска операции
    func start()
}

class RMOperation: RMOperationProtocol {
    var priority: DispatchQoS.QoSClass
    
    var completionBlock: (() -> Void)?
    
    var isFinished: Bool
    
    func start() {
        
    }
    
    init(
        priority: DispatchQoS.QoSClass,
        completionBlock: ( () -> Void)? = nil,
        isFinished: Bool
    ) {
        self.priority = priority
        self.completionBlock = completionBlock
        self.isFinished = isFinished
    }
    
    
    /// В методе start. реализуйте все через глобальную паралельную очередь с приоритетами.
 
}

/// Задача 2 из Task 4.
final class RMOperationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
