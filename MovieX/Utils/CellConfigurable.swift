//
//  CellConfigurable.swift
//  MovieX
//
//  Created by Legna Filloy on 7/4/20.
//  Copyright © 2020 legnafilloy. All rights reserved.
//

import Foundation

// Implement CellConfigurable if you need to use a TableView/CollectionView with cells and ViewModels
protocol CellConfigurable {
    associatedtype ViewModel: CellViewModel //swiftlint:disable:this type_name
    func setup(viewModel: ViewModel)
}

protocol CellViewModel {}

// Implement CellSelectable if you need to excecute a specific action when an interaction happens
typealias CellSelectionHandler = (() -> Void)
protocol CellSelectable {
    var cellSelectionHandler: CellSelectionHandler { get set }
}

// Implement CellSection if you need a Header/Footer Section View
protocol CellSection {
    var isCollapsible: Bool { get }
    var isCollapsed: Bool { get set }
    var itemCount: Int { get }
}
