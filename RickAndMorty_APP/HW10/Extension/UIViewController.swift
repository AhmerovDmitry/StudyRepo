//
//  UIViewController.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 25.08.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

// MARK: - Add() and remove() child UIViewController
@nonobjc extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
