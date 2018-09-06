//
//  Mockup.swift
//  challenge-ios
//
//  Created by Маторин Николай on 04.09.2018.
//  Copyright © 2018 Маторин Николай. All rights reserved.
//

import Foundation

struct Mockup {
    static var data: [Section] { return [
        Section(header: "Netflix", items:[Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                          Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                          Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                          Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                          Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999")]),
        Section(header: "HBO", items: [Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                       Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                       Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999")]),
        Section(header: "FOX", items: [Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                       Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                       Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                       Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                       Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                       Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999"),
                                       Video(title: "Валериан и город тысячи планет", image: #imageLiteral(resourceName: "TestImage"), year: "1999")])
        ]
    }
}
