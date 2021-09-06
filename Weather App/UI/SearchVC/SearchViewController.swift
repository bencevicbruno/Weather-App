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
    }
    
    private func setupNavigationBar() {
        self.title = "Search"
        self.navigationController?.navigationBar.setVisible(false)
        self.navigationController?.navigationBar.tintColor = .black
    }
}
