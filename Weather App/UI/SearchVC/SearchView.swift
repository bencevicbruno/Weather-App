//
//  SearchView.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SearchView: UIView {
    
    var onSearchButtonTapped: ((String) -> Void)?
    var onLocationTapped: ((String) -> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Components
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image_background")
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        return imageView
    }()
    
    private lazy var searchField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.setHorizontalPadding(10)
        textField.layer.backgroundColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.5
        addSubview(textField)
        return textField
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_magnifying_glass"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            guard let searchText = self.searchField.text else { return }
            self.onSearchButtonTapped?(searchText)
        }, for: .touchUpInside)
        addSubview(button)
        return button
    }()
    
    private lazy var searchResults: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LocationCell")
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
        return tableView
    }()
}

private extension SearchView {
    
    func setup() {
        backgroundImage.anchorToSuperview(ignoreSafeArea: true)
        searchField.anchor(top: (safeAreaLayoutGuide.topAnchor, 20), leading: (safeAreaLayoutGuide.leadingAnchor, 20), trailing: (safeAreaLayoutGuide.trailingAnchor, 60), size: CGSize(width: 0, height: 40))
        searchButton.anchor(leading: (searchField.trailingAnchor, 5), trailing: (safeAreaLayoutGuide.trailingAnchor, 5))
        searchButton.aspectRatio(1)
        searchButton.alignCenterY(with: searchField)
    }
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    
}
