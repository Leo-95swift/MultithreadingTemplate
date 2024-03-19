//
//  ViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 19.03.24.
//

import UIKit

/// Для обработки и показа первой задачи
final class FirstTaskViewController: UIViewController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playWithThreadsChanged()
    }
    
    // MARK: - Private Methodes
    
    private func playWithThreads() {
        for _ in (0..<10) {
            let currentThread = Thread.current
            print("1, Current thread: \(currentThread)")
        }
        
        for _ in (0..<10) {
            let currentThread = Thread.current
            print("2, Current thread: \(currentThread)")
        }
    }
    
    private func playWithThreadsChanged() {
        for _ in (0..<10) {
            let detachedThread = Thread.detachNewThread
            print("1, Current thread: \(String(describing: detachedThread))")
        }
        
        for _ in (0..<10) {
            let currentThread = Thread.current
            print("2, Current thread: \(currentThread)")
        }
    }
    
}

