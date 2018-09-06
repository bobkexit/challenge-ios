//
//  VideosViewModel.swift
//  challenge-ios
//
//  Created by Маторин Николай on 04.09.2018.
//  Copyright © 2018 Маторин Николай. All rights reserved.
//

import Foundation

struct VideosViewModel {    
    var numberOfSection: Int {
        return data.count
    }
    
    var numberOfRowsInSection: Int {
        return 1
    }
    
    func items(forSection section: Int) -> [Video] {
        return data[section].items
    }
    
    func header(forSection section: Int) -> String {
        return data[section].header
    }
    
    private let data: [Section]
    
    init(data: [Section]) {
        self.data = data
    }
}
