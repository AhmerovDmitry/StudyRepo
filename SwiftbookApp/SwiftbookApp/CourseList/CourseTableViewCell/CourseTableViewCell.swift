//
//  CourseCell.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    var viewModel: CourseTableViewCellViewModelProtocol! {
        didSet {
            textLabel?.text = viewModel.courseName
            guard let imageData = viewModel.imageData else { return }
            imageView?.image = UIImage(data: imageData)
        }
    }
}
