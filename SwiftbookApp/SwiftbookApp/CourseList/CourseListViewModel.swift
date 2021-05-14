//
//  CourseListViewModel.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 30/09/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

class CourseListViewModel: CourseListViewModelProtocol {
    
    var courses: [Course] = []
    
    private var indexdPath: IndexPath?
        
    func fetchCourses(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { courses in
            self.courses = courses
            completion()
        }
    }
    
    func numberOfRows() -> Int? {
        return courses.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CourseTableViewCellViewModelProtocol? {
        let course = courses[indexPath.row]
        return CourseTableViewCellViewModel(course: course)
    }
    
    func selectedRow(for indexPath: IndexPath) {
        self.indexdPath = indexPath
    }
    
    func viewModelForSelectedRow() -> CourseDetailsViewModelProtocol? {
        guard let indexPath = indexdPath else { return nil }
        let course = courses[indexPath.row]
        return CourseDetailsViewModel(course: course)
    }
}
