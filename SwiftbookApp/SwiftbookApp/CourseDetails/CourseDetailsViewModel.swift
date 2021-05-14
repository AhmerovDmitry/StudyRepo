//
//  CourseDetailsViewModel.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 30/09/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    
    var courseName: String? {
        return course.name
    }
    
    var numberOfLessons: String? {
        return "Number of lessons: \(course.numberOfLessons ?? 0)"
    }
    
    var numberOfTests: String? {
        return "Number of tests: \(course.numberOfTests ?? 0)"
    }
    
    var imageData: Data? {
        return ImageManager.shared.getImageData(from: course.imageUrl)
    }
    
    private (set) var isFavourite: Box<Bool>
    
//    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)?
    
    private var course: Course!
    
    required init(course: Course) {
        self.course = course
        isFavourite = Box(false)
    }
    
    func setFavouriteStatus() {
        isFavourite.value = DataManager.shared.loadFavouriteStatus(for: course.name ?? "")
    }
    
    func changeFavouriteStatus() {
        isFavourite.value.toggle()
        DataManager.shared.saveFavouriteStatus(for: course.name ?? "", with: isFavourite.value)
    }
}
