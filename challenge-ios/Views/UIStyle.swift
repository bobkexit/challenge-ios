//
//  UIStyle.swift
//  challenge-ios
//
//  Created by Маторин Николай on 03.09.2018.
//  Copyright © 2018 Маторин Николай. All rights reserved.
//

import UIKit

struct UIStyle {
    
    struct Colors {
        static let barColor: UIColor = #colorLiteral(red: 0.1019607843, green: 0.1137254902, blue: 0.1137254902, alpha: 1)
        static let orange: UIColor = .orange
        static let whiteColor: UIColor = .white
        static let grayColor: UIColor = .gray
    }
    
    struct Fonts {
        static let regular: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        static let small: UIFont = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
    }
    
    struct Icons {
        static let tv: UIImage = #imageLiteral(resourceName: "ic-tv")
        static let video: UIImage = #imageLiteral(resourceName: "ic-video")
        static let subscriptions: UIImage = #imageLiteral(resourceName: "ic-subscriptions")
        static let account: UIImage = #imageLiteral(resourceName: "ic-account")
        static let settings: UIImage = #imageLiteral(resourceName: "ic-settings")
        static let search: UIImage = #imageLiteral(resourceName: "ic-search")
    }
    
    struct Titles {
        static let tv: String = "ТВ"
        static let video: String = "Видео"
        static let subscriptions: String = "Подписки"
        static let account: String = "Мое"
        static let settings: String = "Настройки"
        static let searchCancel: String = "Отмента"
        static let more: String = "Ещё>"
        static let search: String = "Поиск"
        
    }
    
    struct Metrics {
        public static let rowHeight: CGFloat = 240
        public static let cellWidth: CGFloat = 100
        public static let coverImageHeight: CGFloat = 130
    }
}
