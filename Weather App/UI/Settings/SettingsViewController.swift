//
//  SettingsViewController.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    private lazy var settingsView = SettingsView()
    var viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    override func loadView() {
        self.view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCallbacks()
        settingsView.setupData(useCelsius: viewModel.useCelsius, showHumidity: viewModel.showHumidity, showPressure: viewModel.showPressure, showWindSpeed: viewModel.showWindSpeed)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarAndItems()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}

private extension SettingsViewController {
    
    func setupNavigationBarAndItems() {
        self.navigationController?.navigationBar.setVisible(false)
        self.navigationController?.navigationBar.tintColor = .black
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), primaryAction: UIAction { [weak self] _ in
            self?.viewModel.dismiss()
        })
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func setupCallbacks() {
        settingsView.onCelsiusTapped = { [weak self] isChecked in
            self?.viewModel.useCelsius = isChecked
            self?.settingsView.setupData(useCelsius: isChecked)
        }
        
        settingsView.onFahrenheitTapped = { [weak self] isChecked in
            self?.viewModel.useCelsius = !isChecked
            self?.settingsView.setupData(useCelsius: !isChecked)
        }
        
        settingsView.onHumidityTapped = { [weak self] isChecked in
            self?.viewModel.showHumidity = isChecked
            self?.settingsView.setupData(showHumidity: isChecked)
        }
        
        settingsView.onPressureTapped = { [weak self] isChecked in
            self?.viewModel.showPressure = isChecked
            self?.settingsView.setupData(showPressure: isChecked)
        }
        
        settingsView.onWindSpeedTapped = { [weak self] isChecked in
            self?.viewModel.showWindSpeed = isChecked
            self?.settingsView.setupData(showWindSpeed: isChecked)
        }
    }
}
