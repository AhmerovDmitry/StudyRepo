//
//  CourseTableViewCellViewModel.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 30/09/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

class CourseTableViewCellViewModel: CourseTableViewCellViewModelProtocol {
    
    var courseName: String? {
        return course.name
    }
    
    var imageData: Data? {
        return ImageManager.shared.getImageData(from: course.imageUrl)
    }
    
    private var course: Course
    
    required init(course: Course) {
        self.course = course
    }
}
