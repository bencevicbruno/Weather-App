//
//  InfoViewController.swift
//  Weather App
//
//  Created by Bruno Bencevic on 13.10.2022..
//

import SwiftUI

class InfoViewController: UIViewController {

    var contentView = UIHostingController(rootView: InfoView(viewModel: .init()))
    var viewModel: InfoViewModel
    
    init(viewModel: InfoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(contentView)
        
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(contentView.view)
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            contentView.view.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            contentView.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
    }
}
