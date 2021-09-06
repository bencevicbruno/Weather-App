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
    }
    
    //MARK: Actions
    
    private func setupNavigationBar() {
        self.title = "Home"
        self.navigationController?.navigationBar.setVisible(false)
        self.navigationController?.navigationBar.tintColor = .black
        removeTextFromBackButton()
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(goToSearchScreen)),
            UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(goToSettingsScreen))
        ]
    }
    
    private func removeTextFromBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    @objc private func goToSearchScreen() {
        viewModel.onGoToSearchScreen?()
    }
    
    @objc private func goToSettingsScreen() {
        viewModel.onGoToSettingsScreen?()
    }
}
