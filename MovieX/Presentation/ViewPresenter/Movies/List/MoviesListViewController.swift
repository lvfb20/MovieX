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
    func showMovieDetail(movie: Movie)
}

class MoviesListViewController: BaseViewController<MoviesListPresenter> {
    
    // MARK: Section - Outlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Section - UIViewController

    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: MoviesListViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupView() {
        super.setupView()
        navigationItem.title = "Movies.Navigation.title".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
    }
    
    // MARK: Section - Private functions

    private func setupTableView() {
        tableView.contentInsetAdjustmentBehavior = .never
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
        presenter.didSelectRow(at: indexPath.row)
    }
}

extension MoviesListViewController: MoviesListView {
    func reloadMovies() {
        tableView.reloadData()
    }
    
    func showMovieDetail(movie: Movie) {
        presenter.wireframe.movieDetail(from: self, movie: movie).show(animated: true)
    }
}
