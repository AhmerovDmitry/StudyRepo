//
//  CourseDetailsViewController.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var numberOfLessonsLabel: UILabel!
    @IBOutlet private var numberOfTestsLabel: UILabel!
    @IBOutlet private var courseImage: UIImageView!
    @IBOutlet private var favouriteButton: UIButton!
        
    private var isFavourite = false
    var viewModel: CourseDetailsViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.changeFavouriteStatus()
        let image = setImageForFavoriteButton()
        sender.setImage(image, for: .normal)
    }
    
    private func setupUI() {
        
//        viewModel.viewModelDidChange = { [weak self] viewModel in
//            guard let self = self else { return }
//            self.isFavourite = viewModel.isFavorite
//        }
        
        viewModel.isFavourite.bind { [weak self] isFavoutite in
            guard let self = self else { return }
            self.isFavourite = isFavoutite
        }
        
        courseNameLabel.text = viewModel.courseName
        numberOfLessonsLabel.text = viewModel.numberOfLessons
        numberOfTestsLabel.text = viewModel.numberOfTests
        guard let imageData = viewModel.imageData else { return }
        courseImage.image = UIImage(data: imageData)
        viewModel.setFavouriteStatus()
        
        let image = setImageForFavoriteButton()
        favouriteButton.setImage(image, for: .normal)
    }
    
    private func setImageForFavoriteButton() -> UIImage {
        return isFavourite ? #imageLiteral(resourceName: "heartIcon") : #imageLiteral(resourceName: "unselectedHeart")
    }
}
