//
//  SearchViewController.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import UIKit

class SearchViewController: UIViewController {
    private lazy var searchView = SearchView()
    var viewModel: SearchViewModel!
    
    //MARK: LifeCycle
    override func loadView() {
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.setTableData(viewModel.cachedLocations)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupCallbacks()
        setupNavigationBar()
        setupNavigationItem()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        viewModel?.onExit?()
    }
    
    //MARK: NavigationBar and NavigationItem setup
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.setVisible(false)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupNavigationItem() {
        self.title = "Search"
    }
    
    //MARK: Callbakcs
    private func setupCallbacks() {
        searchView.onSearchButtonTapped = { [weak self] searchFieldText in
            self?.viewModel.onSearchButtonTapped?(searchFieldText)
        }
        
        searchView.onCityCellTapped = { [weak self] cellIndex in
            self?.viewModel.onCityCellTapped?(cellIndex)
            
        }
    }
    
    public func setTableData(_ data: [String]) {
        searchView.setTableData(data)
    }
}
