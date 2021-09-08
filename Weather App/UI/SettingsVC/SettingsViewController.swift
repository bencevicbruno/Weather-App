//
//  SettingsViewController.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import UIKit

class SettingsViewController: UIViewController {
    private lazy var settingsView = SettingsView()
    var viewModel: SettingsViewModel!
    
    //MARK: LifeCycle
    override func loadView() {
        self.view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCallbacks()
        updateView(data: viewModel.settingsData)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        self.title = "Settings"
    }
    
    //MARK: Callbacks setup
    private func setupCallbacks() {
        settingsView.onCelsiusTapped = { [weak self] wasChecked in
            self?.viewModel.onCelsiusTapped?(wasChecked)
        }
        
        settingsView.onFahrenheitTapped = { [weak self] wasChecked in
            self?.viewModel.onFahrenheitTapped?(wasChecked)
        }
        
        settingsView.onHumidityTapped = { [weak self] wasChecked in
            self?.viewModel.onHumidityTapped?(wasChecked)
        }
        
        settingsView.onPressureTapped = { [weak self] wasChecked in
            self?.viewModel.onPressureTapped?(wasChecked)
        }
        
        settingsView.onWindTapped = { [weak self] wasChecked in
            self?.viewModel.onWindTapped?(wasChecked)
        }
    }
    
    public func updateView(data: SettingsData) {
        self.settingsView.setupData(data: data)
    }
}
