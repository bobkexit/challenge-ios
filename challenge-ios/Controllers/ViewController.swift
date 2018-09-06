//
//  ViewController.swift
//  challenge-ios
//
//  Created by Маторин Николай on 03.09.2018.
//  Copyright © 2018 Маторин Николай. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    // MARK: - Private Properties
    
    private let cellId = "tableCell"
    
    // MARK: - Public Properties
    
    var viewModel: VideosViewModel!
    
    // MARK: - UI Properties
    
    let tableView: UITableView = UITableView(frame: .zero, style: UITableViewStyle.grouped)
    
   
    // MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = UIStyle.Titles.video
        
        setupUI()
        configureTableView()
    }
    
    // MARK: - Private Methods
    
    fileprivate func configureTableView() {
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UIStyle.Metrics.rowHeight
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
    }
}

// MARK: - UI Designable Methods

extension ViewController: Designable {
    func setupUI() {
        setupViewHierarchy()
        setupConstraints()
    }
    
    func setupViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        let views : [String: Any]  = ["tableView": tableView]
        let metrics = ["topGap": 100.0, "bottomGap": 0.0, "edgeGap": 8]
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        var allConstraints: [NSLayoutConstraint] = []
        
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-topGap-[tableView]-bottomGap-|",
                                                         metrics: metrics,
                                                         views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-edgeGap-[tableView]-edgeGap-|",
                                                         options: [.alignAllCenterY],
                                                         metrics: metrics,
                                                         views: views)
        
        NSLayoutConstraint.activate(allConstraints)
    }
}

 // MARK: - TableView Delegate & DataSource Methods

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        let items = viewModel.items(forSection: indexPath.section)
        cell.configure(with: items)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        headerText.text = viewModel.header(forSection: section)
        headerText.textColor = UIStyle.Colors.orange
        headerText.font = UIStyle.Fonts.regular
        headerText.adjustsFontSizeToFitWidth = true
        headerText.textAlignment = .left
        
        return headerText
    }
}

