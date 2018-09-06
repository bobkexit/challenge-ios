//
//  CollectionViewCell.swift
//  challenge-ios
//
//  Created by Маторин Николай on 03.09.2018.
//  Copyright © 2018 Маторин Николай. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    let titleLablel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIStyle.Fonts.regular
        label.textColor = UIStyle.Colors.whiteColor
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.sizeToFit()
        
        return label
    }()
    
    let imageCoverView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4.0
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIStyle.Fonts.regular
        label.textColor = UIStyle.Colors.grayColor
        
        return label
    }()
   
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configure(with item: Video) {
        titleLablel.text = item.title
        titleLablel.sizeToFit()
        imageCoverView.image = item.image
        yearLabel.text = item.year
    }
}

// MARK: - UI Designable Methods

extension CollectionViewCell: Designable {
    func setupUI() {
        setupViewHierarchy()
        setupConstraints()
    }
    
    func setupViewHierarchy() {
        self.contentView.addSubview(titleLablel)
        self.contentView.addSubview(imageCoverView)
        self.contentView.addSubview(yearLabel)
    }
    
    func setupConstraints() {
        let views: [String: Any] = ["title": titleLablel, "imageCover": imageCoverView, "year":  yearLabel ]
        let metrics = ["imageHeight": UIStyle.Metrics.coverImageHeight]
        var allConstraints: [NSLayoutConstraint] = []
        
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageCover]|",
                                                         metrics: nil,
                                                         views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[title]|",
                                                         metrics: nil,
                                                         views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[year]",
                                                         metrics: nil,
                                                         views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageCover(==imageHeight)]-[title]-[year]",
                                                         metrics: metrics,
                                                         views: views)
        
        NSLayoutConstraint.activate(allConstraints)
    }
}
