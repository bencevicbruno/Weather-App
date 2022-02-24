//
//  SearchViewController.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import UIKit

class SearchViewController: UIViewController {
    
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
        searchView.onSearchButtonTapped = { [weak self] searchFieldText in
            self?.viewModel.onSearchButtonTapped?(searchFieldText)
        }
        
        searchView.onCityCellTapped = { [weak self] cellIndex in
            self?.viewModel.onCityCellTapped?(cellIndex)
        }
    }
}
