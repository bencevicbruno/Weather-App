//
//  HomeViewController.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModel
    private lazy var homeView = HomeView()
    
    // MARK: - Init
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCallbacks()
        viewModel.fetchWeatherData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarAndItems()
    }
}

private extension HomeViewController {
    
    //MARK: - Actions
    
    @objc func goToSearchScreen() {
        viewModel.onGoToSearch?()
    }
    
    @objc func goToSettingsScreen() {
        viewModel.onGoToSettings?({ [weak self] in
            self?.viewModel.updateData()
        })
    }
    
    @objc func goToInfoScreen() {
        viewModel.onGoToInfo?()
    }
    
    // MARK: - Setup
    
    func setupCallbacks() {
        viewModel.onStateChanged = { [weak self] state in
            switch(state) {
            case .showingData(let homeData, let settingsData):
                self?.homeView.setupData(data: homeData, settings: settingsData)
            case .loading:
                self?.homeView.showLoading()
            case .error(let error):
                self?.homeView.showError(error.localizedDescription)
            }
        }
    }
    
    func setupNavigationBarAndItems() {
        self.navigationController?.navigationBar.setVisible(false)
        self.navigationController?.navigationBar.tintColor = .black
        
        // Removing back button
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "icon_magnifying_glass"), style: .plain, target: self, action: #selector(goToSearchScreen)),
            UIBarButtonItem(image: UIImage(named: "icon_gear"), style: .plain, target: self, action: #selector(goToSettingsScreen)),
            UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(goToInfoScreen))
        ]
    }
}
