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
        setupNavigationItem()
    }
    
    //MARK: NavigationBar and NavigationItem setup
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.setVisible(false)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func setupNavigationItem() {
        self.title = "Settings"
    }
}
