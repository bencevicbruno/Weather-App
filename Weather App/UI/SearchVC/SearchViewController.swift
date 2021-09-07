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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        setupNavigationItem()
    }
    
    //MARK: NavigationBar and NavigationItem setup
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.setVisible(false)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupNavigationItem() {
        self.title = "Search"
    }
}
