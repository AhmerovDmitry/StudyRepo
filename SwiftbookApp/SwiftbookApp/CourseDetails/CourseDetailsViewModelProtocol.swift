//
//  CourseDetailsViewModelProtocol.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 30/09/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseDetailsViewModelProtocol {
    var courseName: String? { get }
    var numberOfLessons: String? { get }
    var numberOfTests: String? { get }
    var imageData: Data? { get }
    var isFavourite: Box<Bool> { get }
//    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)? { get set }
    init(course: Course)
    func setFavouriteStatus()
    func changeFavouriteStatus()
}
