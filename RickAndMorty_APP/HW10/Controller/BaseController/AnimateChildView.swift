//
//  AnimateChildView.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 25.08.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

extension BaseViewController {
    func showDetailPopController(shouldMove: Bool) {
        switch shouldMove {
        case true:
            add(DetailPopController())
            UIView.animate(withDuration: 0.40,
                           delay: 0.0,
                           options: .curveEaseOut,
                           animations: {
                            self.children[0].view.frame.origin.y = 368
            },
                           completion: { _ in
                            print("DeatilPopController init")
            })
        case false:
            UIView.animate(withDuration: 0.25,
                           delay: 0.0,
                           options: .curveEaseOut,
                           animations: {
                            self.children[0].view.frame.origin.y += 368
            },
                           completion: { _ in
                            self.children[0].remove()
                            print("DeatilPopController deinit")
            })
        }
    }
}

//self.view.frame = CGRect(x: 7.0, y: 368.0 * 2, width: 400.0, height: 400.0)
//self.children[0].view.frame.origin.y = 368
