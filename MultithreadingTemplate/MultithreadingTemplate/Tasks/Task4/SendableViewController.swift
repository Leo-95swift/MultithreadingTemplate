//
//  SendableViewController.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 22.03.24.
//

import UIKit

/// Задача 1 из Task 4.
final class SendableViewController: UIViewController {
    
    final class Post: Sendable {
        
    }
    
    enum State1: Sendable {
        case loading
        case data(String)
    }
    
    enum State2: Sendable {
        case loading
        case data(Post)
        /*
         Out: Associated value 'data' of 'Sendable'-conforming enum
         'State2' has non-sendable type 'ViewController.Post'
         */
    }
    
}

// Проблема была здесь
/*
    class Post {
        
    }
*/

/*
для того чтобы SendableViewController соответствовал
протоколу Sendable надо было обеспечить то что все его элементы
тоже являются Sendable, но класс Post таким не являлся
*/

// РЕШЕНИЕ

// просто подчиняем класс Post к протоколу Sendable
// и пропысиваем как final
