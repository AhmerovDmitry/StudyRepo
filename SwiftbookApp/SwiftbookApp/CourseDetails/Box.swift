//
//  Box.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 01/10/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

class Box<T> {
    
    typealias Listener = (T) -> ()
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    var listener: Listener?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
