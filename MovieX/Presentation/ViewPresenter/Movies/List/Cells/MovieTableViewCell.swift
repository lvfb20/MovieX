//
//  MovieTableViewCell.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell, CellConfigurable {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    typealias ViewModel = MovieCellViewModel
    private weak var viewModel: ViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = Style.Font.with(name: .gillSans, size: 17, weight: .regular)
    }
    
    func setup(viewModel: MovieCellViewModel) {
        self.viewModel = viewModel
        posterImage.loadImage(urlString: viewModel.posterImage)
        titleLabel.text = viewModel.title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImage.image = nil
        titleLabel.text = ""
    }
    
}
