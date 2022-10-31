//
//  SettingsViewController.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    var onDimissed: (() -> Void)?
    
    private var settingsView = SettingsView()
    private var viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = settingsView
        setupCallbacks()
        
        @Service var persistenceService: PersistenceServiceProtocol
        let settings = persistenceService.settingsData
        
        settingsView.update(data: settings)
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
            guard let self = self else { return }
            self.viewModel.dismiss()
        })
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func setupCallbacks() {
        viewModel.onUpdateView = { [weak self] data in
            self?.settingsView.update(data: data)
        }
        
        settingsView.onCelsiusTapped = { [weak self] isChecked in
            guard let self = self else { return }
            self.viewModel.updateUseCelsius(isChecked)
        }
        
        settingsView.onFahrenheitTapped = { [weak self] isChecked in
            guard let self = self else { return }
            self.viewModel.updateUseCelsius(!isChecked)
        }
        
        settingsView.onHumidityTapped = { [weak self] isChecked in
            guard let self = self else { return }
            self.viewModel.updateShowHumidity(isChecked)
        }
        
        settingsView.onPressureTapped = { [weak self] isChecked in
            guard let self = self else { return }
            self.viewModel.updateShowPressure(isChecked)
        }
        
        settingsView.onWindSpeedTapped = { [weak self] isChecked in
            guard let self = self else { return }
            self.viewModel.updateShowWindspeed(isChecked)
        }
    }
}
