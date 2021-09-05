//
//  HomeViewController.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import UIKit

class WeatherViewController: UIViewController {
    private lazy var homeView = WeatherView()
    var viewModel: WeatherViewModel!
    
    //MARK: LifeCycle
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCallbacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    //MARK: Actions
    
    private func setupCallbacks() {
        
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.setVisible(false)
        self.navigationController?.navigationBar.tintColor = .black
        
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(goToSearchScreen)),
            UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(goToSettingsScreen))
        ]
    }
    
    @objc private func goToSearchScreen() {
        viewModel.onGoToSearchScreen?()
    }
    
    @objc private func goToSettingsScreen() {
        viewModel.onGoToSettingsScreen?()
    }
}
