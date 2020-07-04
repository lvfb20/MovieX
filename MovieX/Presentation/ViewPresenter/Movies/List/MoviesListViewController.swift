//
//  MovieListViewController.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit

protocol MoviesListView: BaseView {
    func reloadMovies()
}

class MoviesListViewController: BaseViewController<MoviesListPresenter> {
    
    // MARK: Section - Outlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Section - Private vars

    fileprivate var movies: [Movie] = []

    // MARK: Section - UIViewController

    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: MoviesListViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: Section - Private functions

    private func setupTableView() {
        self.navigationItem.title = "Movies.Navigation.title".localized
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.registerCell(cell: MovieTableViewCell.self)
   }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableBy(cell: MovieTableViewCell.self) else {
            return UITableViewCell()
        }
        let viewModel = presenter.getViewModel(at: indexPath.row)
        cell.setup(viewModel: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = presenter.getMovie(at: indexPath.row)
        presenter.wireframe.movieDetail(from: self, movie: movie).show(animated: true)
    }
}

extension MoviesListViewController: MoviesListView {
    func reloadMovies() {
        tableView.reloadData()
    }
}
