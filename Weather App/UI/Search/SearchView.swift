//
//  SearchView.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

final class SearchView: UIView {
    
    var onSearchButtonTapped: ((String?) -> Void)?
    var onLocationTapped: ((String) -> Void)?
    
    private var locations = [String]()
    
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
            self.onSearchButtonTapped?(self.searchField.text)
        }, for: .touchUpInside)
        addSubview(button)
        return button
    }()
    
    private lazy var locationsTable: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LocationCell")
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
        return tableView
    }()
    
    private lazy var loadingLabel: UILabel = {
        let label = UILabel()
        label.text = " Loading... "
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.layer.backgroundColor = UIColor.white.withAlphaComponent(0.2).cgColor
        label.layer.cornerRadius = 10
        label.isHidden = true
        addSubview(label)
        return label
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.layer.backgroundColor = UIColor.red.withAlphaComponent(0.2).cgColor
        label.layer.cornerRadius = 10
        label.isHidden = true
        addSubview(label)
        return label
    }()
    
    private lazy var noResultsFoundLabel: UILabel = {
        let label = UILabel()
        label.text = "No results found."
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.layer.backgroundColor = UIColor.white.withAlphaComponent(0.2).cgColor
        label.layer.cornerRadius = 10
        label.isHidden = true
        addSubview(label)
        return label
    }()
    
    // MARK: - Data setup
    
    func setupData(locations: [String]) {
        if locations.isEmpty {
            locationsTable.isHidden = true
            noResultsFoundLabel.isHidden = false
            errorLabel.isHidden = true
            loadingLabel.isHidden = true
        } else {
            self.locations = locations
            locationsTable.reloadData()
            
            locationsTable.isHidden = false
            noResultsFoundLabel.isHidden = true
            errorLabel.isHidden = true
            loadingLabel.isHidden = true
        }
    }
    
    func showLoading() {
        locationsTable.isHidden = true
        noResultsFoundLabel.isHidden = true
        errorLabel.isHidden = true
        loadingLabel.isHidden = false
    }
    
    func showError(_ message: String) {
        errorLabel.text = "Error:\n\(message)"
        
        locationsTable.isHidden = true
        noResultsFoundLabel.isHidden = true
        errorLabel.isHidden = false
        loadingLabel.isHidden = true
    }
}

private extension SearchView {
    
    func setup() {
        let padding: CGFloat = 10
        
        backgroundImage.anchorToSuperview(ignoreSafeArea: true)
        searchField.anchor(top: (safeAreaLayoutGuide.topAnchor, 20), leading: (safeAreaLayoutGuide.leadingAnchor, 20), trailing: (safeAreaLayoutGuide.trailingAnchor, 60), size: CGSize(width: 0, height: 40))
        searchButton.anchor(leading: (searchField.trailingAnchor, 5), trailing: (safeAreaLayoutGuide.trailingAnchor, 5))
        searchButton.aspectRatio(1)
        searchButton.alignCenterY(with: searchField)
        
        locationsTable.anchor(top: (searchField.bottomAnchor, 10), bottom: (safeAreaLayoutGuide.bottomAnchor, 10), leading: (safeAreaLayoutGuide.leadingAnchor, 10), trailing: (safeAreaLayoutGuide.trailingAnchor, 10))
        
        loadingLabel.centerInSuperview()
        loadingLabel.anchor(leading: (safeAreaLayoutGuide.leadingAnchor, padding), trailing: (safeAreaLayoutGuide.trailingAnchor, padding))
        errorLabel.centerInSuperview()
        errorLabel.anchor(leading: (safeAreaLayoutGuide.leadingAnchor, padding), trailing: (safeAreaLayoutGuide.trailingAnchor, padding))
        noResultsFoundLabel.centerInSuperview()
        noResultsFoundLabel.anchor(leading: (safeAreaLayoutGuide.leadingAnchor, padding), trailing: (safeAreaLayoutGuide.trailingAnchor, padding))
    }
}

extension SearchView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onLocationTapped?(locations[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension SearchView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        cell.textLabel?.text = locations[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.backgroundColor = .clear
        
        return cell
    }
}
