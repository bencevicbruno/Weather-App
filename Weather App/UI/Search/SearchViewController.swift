//
//  SearchViewController.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import UIKit

final class SearchViewController: UIViewController {
    
    private lazy var searchView = SearchView()
    private var viewModel: SearchViewModel
    
    // MARK: - Init
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    override func loadView() {
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCallbacks()
        viewModel.fetchSearchedLocations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarAndItems()
    }
}

private extension SearchViewController {
    
    func setupNavigationBarAndItems() {
        self.navigationController?.navigationBar.setVisible(false)
        self.navigationController?.navigationBar.tintColor = .black
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), primaryAction: UIAction { [weak self] _ in
            self?.viewModel.dismiss()
        })
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func setupCallbacks() {
        searchView.onSearchButtonTapped = { [weak self] location in
            if let location = location {
                self?.viewModel.fetchLocation(containing: location)
            } else {
                self?.showErrorAlert(title: "Please insert a location in the search field.")
            }
        }
        
        searchView.onLocationTapped = { [weak self] location in
            self?.viewModel.dismiss(location: location)
        }
        
        viewModel.onStateChanged = { [weak self] state in
            switch(state) {
            case .showingLocations(let locations):
                self?.searchView.setupData(locations: locations)
            case .loading:
                self?.searchView.showLoading()
            case .showingError(let error):
                self?.searchView.showError(error.localizedDescription)
            }
        }
    }
}
