//
//  CourseTableViewCellViewModelProtocol.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 30/09/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseTableViewCellViewModelProtocol {
    var courseName: String? { get }
    var imageData: Data? { get }
    init(course: Course)
}
