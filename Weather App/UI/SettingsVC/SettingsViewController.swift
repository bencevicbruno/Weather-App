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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.title = "Settings"
        self.navigationController?.navigationBar.setVisible(false)
        self.navigationController?.navigationBar.tintColor = .black
    }
}
