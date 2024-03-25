//
//  TaskGroupViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 24.03.24.
//

import UIKit

/// Задача 8 из Task 5
final class TaskGroupViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            print(await printMessage())
        }
    }
    
    func printMessage() async {
        let string = await withTaskGroup(of: String.self) { group -> String in
            // тут добавляем строки в группу
            
            let stringsToCollect = [
                "Hello",
                "My",
                "Road",
                "Map",
                "Group"
            ]
            
            for string in stringsToCollect {
                group.addTask {
                    return string
                }
            }
            
            var collected = [String]()
            
            for await value in group {
                collected.append(value)
            }
            
            return collected.joined(separator: " ")
        }
        
        print(string)
    }
}
