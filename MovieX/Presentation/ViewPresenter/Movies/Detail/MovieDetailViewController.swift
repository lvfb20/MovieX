//
//  MovieDetailViewController.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit

protocol MovieDetailView: BaseView {
    func showDetails(movie: Movie)
}

class MovieDetailViewController: BaseViewController<MovieDetailPresenter> {
    
    // -------------------------------------
    // MARK: Section - Outlets
    // -------------------------------------
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    // -------------------------------------
    // MARK: Section - UIViewController
    // -------------------------------------
    
    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: MovieDetailViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

extension MovieDetailViewController: MovieDetailView {
    func showDetails(movie: Movie) {
        movieTitleLabel.text = movie.title
        movieOverviewLabel.text = movie.overview
        movieImage.loadImage(urlString: movie.getPoster())
        releaseDateLabel.text = movie.releaseDate?.string(with: .pretty)
    }
}
