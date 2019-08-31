//
//  MovieListViewController.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit

protocol MoviesListView: BaseView {
    func showMovies(_ movies: [Movie])
}

class MoviesListViewController: BaseViewController<MoviesListPresenter> {
    
    // -------------------------------------
    // MARK: Section - Outlets
    // -------------------------------------
    
    @IBOutlet weak var tableView: UITableView!
    
    // -------------------------------------
    // MARK: Section - Private vars
    // -------------------------------------
    
    fileprivate var movies: [Movie] = []
    fileprivate let cellIdentfier = "MovieTableViewCell"
    
    // -------------------------------------
    // MARK: Section - UIViewController
    // -------------------------------------
    
    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: MoviesListViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // -------------------------------------
    // MARK: Section - Private functions
    // -------------------------------------
    
    private func setupView() {
         self.navigationItem.title = "Movies.Navigation.title".locale()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        let cellNib = UINib(nibName: cellIdentfier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentfier)
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentfier) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let movie = movies[indexPath.row]
        cell.display(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        wireframe.presentMovieDetail(from: self, movie: movies[indexPath.row])
    }
}

extension MoviesListViewController: MoviesListView {
    func showMovies(_ movies: [Movie]) {
        self.movies = movies
        tableView.reloadData()
    }
}
