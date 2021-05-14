//
//  CourseListViewModelProtocol.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 30/09/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseListViewModelProtocol {
    var courses: [Course] { get }
    func fetchCourses(completion: @escaping() -> Void)
    func numberOfRows() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> CourseTableViewCellViewModelProtocol?
    func selectedRow(for indexPath: IndexPath)
    func viewModelForSelectedRow() -> CourseDetailsViewModelProtocol?
}
