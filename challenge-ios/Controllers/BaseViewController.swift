//
//  BaseViewController.swift
//  challenge-ios
//
//  Created by Маторин Николай on 05.09.2018.
//  Copyright © 2018 Маторин Николай. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let searchBar: UISearchBar =  {
        let searchBar =  UISearchBar(frame: CGRect.zero)
        
        searchBar.sizeToFit()
        searchBar.placeholder = UIStyle.Titles.search
        searchBar.showsCancelButton = true
        searchBar.alpha = 0.0
        
        return searchBar
    }()
    
    lazy var searchButton = UIBarButtonItem(image: UIStyle.Icons.search,
                                            style: .plain, target: self,
                                            action: #selector(searchButtonPressed(sender:)))
    
    // MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        searchBar.delegate = self
        setupNavigationBar()
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = UIStyle.Titles.searchCancel
    }
    
    // MARK: - UI Setup
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = searchButton
        
        navigationController?.navigationBar.barTintColor = UIStyle.Colors.barColor
        navigationController?.navigationBar.tintColor = UIStyle.Colors.orange
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    // MARK: - Events
    
    @objc func searchButtonPressed(sender: UIBarButtonItem) {
        navigationItem.rightBarButtonItem = nil
        navigationController?.navigationBar.topItem?.titleView = searchBar
        searchBar.becomeFirstResponder()
        
        UIView.animate(withDuration: 0.5) {
            self.searchBar.alpha = 1.0
        }
    }
}

// MARK: - UISearchBarDelegate Methods

extension BaseViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Do some search stuff
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    
        searchBar.text = ""
        
        UIView.animate(withDuration: 0.5) {
            self.searchBar.alpha = 0.0
        }
        
        self.navigationController?.navigationBar.topItem?.titleView = nil
        navigationItem.rightBarButtonItem = searchButton
    }
}
