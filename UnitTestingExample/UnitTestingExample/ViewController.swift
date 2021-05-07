//
//  ViewController.swift
//  UnitTestingExample
//
//  Created by Дмитрий Ахмеров on 06.05.2021.
//

import UIKit

class ViewController: UIViewController {
    var volume = 0
    
    func setVolume(with value: Int) {
        volume = min(max(value, 0), 100)
    }
    
    func greaterThenValue(x: Int, y: Int) -> Bool {
        return x > y
    }
    
    func isDivisibleByThree(number: Int) -> Bool {
        return number % 3 == 0
    }
}

