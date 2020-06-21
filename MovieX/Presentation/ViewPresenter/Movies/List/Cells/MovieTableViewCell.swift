//
//  MovieTableViewCell.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = Style.Font.with(name: .gillSans, size: 17, weight: .regular)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImage.image = nil
        titleLabel.text = ""
    }

    func display(movie: Movie) {
        posterImage.loadImage(urlString: movie.getThumbnail())
        titleLabel.text = movie.title
    }
    
}
