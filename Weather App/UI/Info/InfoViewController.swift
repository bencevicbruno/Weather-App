//
//  InfoViewController.swift
//  Weather App
//
//  Created by Bruno Benčević on 24.02.2022..
//

import Foundation
import UIKit

final class InfoViewController: UIViewController {
    
    private lazy var infoView = InfoView()
    var viewModel: InfoViewModel
    
    init(viewModel: InfoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LifeCycle
    override func loadView() {
        self.view = infoView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarAndItems()
    }
}

private extension InfoViewController {
    
    func setupNavigationBarAndItems() {
        self.navigationController?.navigationBar.setVisible(false)
        self.navigationController?.navigationBar.tintColor = .black
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), primaryAction: UIAction { [weak self] _ in
            self?.viewModel.dismiss()
        })
        self.navigationItem.leftBarButtonItem = backButton
    }
}
