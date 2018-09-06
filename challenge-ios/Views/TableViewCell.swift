//
//  TableViewCell.swift
//  challenge-ios
//
//  Created by Маторин Николай on 03.09.2018.
//  Copyright © 2018 Маторин Николай. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Private Properties
    
    private let cellId = "collectionViewCell"
    private var data: [Video] = []
    
    // MARK: - UI Properties
    
    let moreButton: UIButton = {
        let button = UIButton()
        
        button.titleLabel?.font = UIStyle.Fonts.small
        button.setTitle(UIStyle.Titles.more, for: .normal)
        button.setTitleColor(UIStyle.Colors.orange, for: .normal)
        
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        configureCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    
    private func configureCollectionView() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Public Methods
    
    func configure(with items: [Video]) {
        data = items
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UI Designable Methods

extension TableViewCell: Designable {
    func setupUI() {
        setupViewHierarchy()
        setupConstraints()
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(moreButton)
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        let views: [String: Any] =  ["collectionView": collectionView, "moreButton": moreButton]
        var allConstraints: [NSLayoutConstraint] = []
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:[moreButton]|",
                                                         metrics: nil,
                                                         views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[collectionView]|",
                                                         metrics: nil,
                                                         views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[moreButton][collectionView]|",
                                                         metrics: nil,
                                                         views: views)
        
        NSLayoutConstraint.activate(allConstraints)
    }
}

// MARK: - CollectionView Delegate Methods

extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .clear
        
        let item = data[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIStyle.Metrics.cellWidth, height: contentView.frame.height - moreButton.frame.height)
    }
}
