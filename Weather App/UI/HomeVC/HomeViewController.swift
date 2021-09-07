//
//  HomeViewController.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var homeView = HomeView()
    var viewModel: HomeViewModel!
    
    //MARK: LifeCycle
    override func loadView() {
        self.view = homeView
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
        removeTextFromBackButton()
    }
    
    private func removeTextFromBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func setupNavigationItem() {
        self.title = "Home"
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(goToSearchScreen)),
            UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(goToSettingsScreen))
        ]
    }
    
    //MARK: Actions
    @objc private func goToSearchScreen() {
        viewModel.onGoToSearchScreen?()
    }
    
    @objc private func goToSettingsScreen() {
        viewModel.onGoToSettingsScreen?()
    }
}
