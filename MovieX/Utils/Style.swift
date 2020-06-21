//
//  Style.swift
//  MovieX
//
//  Created by Legna Filloy on 6/21/20.
//  Copyright © 2020 legnafilloy. All rights reserved.
//

import UIKit
import Foundation
// swiftlint:disable nesting
final class Style {
    private init() {}
    
    enum Color {
        private enum ColorKeys: String {
            case bluedb
            case greendb
            case charcoal
        }
        
        private static func color(key: Style.Color.ColorKeys) -> UIColor {
            return UIColor(named: key.rawValue)!
        }

        private static let clear = UIColor.clear
        private static let bluedb = color(key: .bluedb)
        private static let greendb = color(key: .greendb)
        private static let charcoal = color(key: .charcoal)
        
        // Semantic Colors
        static var text: UIColor { return .black }
        static var secondaryText: UIColor { return charcoal }
        static var tint: UIColor { return greendb }
        static var background: UIColor { return bluedb }
   
        enum Badge {
            static var text: UIColor { return .white }
            static var background: UIColor { return .red }
        }
    }
    
    enum Font {
        enum Name: String {
            case gillSans = "Gill Sans" // Not necessary since it's system font.
        }
        
        static func with(name: Name = .gillSans, size: CGFloat, weight: UIFont.Weight) -> UIFont {
            guard let font = UIFont.init(name: name.rawValue, size: size) else {
                 fatalError("""
                 Failed to load the \(name) font.
                 Make sure the font file is included in the project and the font name is spelled correctly.
                 """)
             }
            return font
        }
    }
    
    enum Image {
        enum Name: String {
            case back
        }
        static func named(_ name: Name) -> UIImage? {
            return UIImage(named: name.rawValue)
        }
    }
}

extension Style {
    static func configureAppearance() {
        configure(appearance: UITabBar.appearance())
        configure(appearance: UIBarButtonItem.appearance())
        configure(appearance: UINavigationBar.appearance())
    }
    
    private static func configure(appearance: UITabBar) {
        appearance.backgroundColor = Style.Color.background
        appearance.isTranslucent = false
    }
    
    private static func configure(appearance: UIBarButtonItem) {
        appearance.tintColor = Color.tint
    }
    
    private static func configure(appearance: UINavigationBar) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = Style.Color.background
        let attributes = [NSAttributedString.Key.foregroundColor: Style.Color.tint]
        navBarAppearance.largeTitleTextAttributes = attributes
        navBarAppearance.titleTextAttributes = attributes
        UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
            .standardAppearance = navBarAppearance
        UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
            .scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
            .compactAppearance = navBarAppearance
    }
}
// swiftlint:enable nesting
