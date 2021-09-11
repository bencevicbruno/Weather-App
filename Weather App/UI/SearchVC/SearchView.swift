//
//  SearchView.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import Foundation
import UIKit

class SearchView: UIView {
    private lazy var backgroundImage = UIImageView()
    private lazy var searchField = UITextField()
    private lazy var searchButton = UIButton()
    private lazy var resultsTable = UITableView()
    
    var onCellTapped: ((Int) -> Void)?
    
    private var resultsSource = ["heyy"]//[String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        let grayColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        self.addSubview(backgroundImage)
        
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.text = "Search"
        searchField.textColor = grayColor
        searchField.font = UIFont.systemFont(ofSize: 25)
        searchField.setHorizontalPadding(10)
        searchField.layer.backgroundColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        searchField.layer.cornerRadius = 5
        searchField.layer.borderColor = grayColor.cgColor
        searchField.layer.borderWidth = 1.5
        self.addSubview(searchField)
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setImage(UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 45)))?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        self.addSubview(searchButton)
        
        resultsTable.translatesAutoresizingMaskIntoConstraints = false
        resultsTable.backgroundColor = .blue
        resultsTable.register(UITableViewCell.self, forCellReuseIdentifier: "LocationCell")
        resultsTable.delegate = self
        resultsTable.dataSource = self
        self.addSubview(resultsTable)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            
            searchField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchField.topAnchor.constraint(equalTo: self.topAnchor, constant: 140),
            searchField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            searchField.heightAnchor.constraint(equalToConstant: 45),
            
            searchButton.leftAnchor.constraint(equalTo: searchField.rightAnchor, constant: 5),
            searchButton.topAnchor.constraint(equalTo: searchField.topAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 45),
            searchButton.heightAnchor.constraint(equalTo: searchButton.widthAnchor),
            
            resultsTable.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resultsTable.widthAnchor.constraint(equalTo: searchField.widthAnchor),
            resultsTable.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 50),
            resultsTable.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    public func setTableData(_ data: [String]) {
        self.resultsSource = data
        resultsTable.reloadData()
    }
}

extension SearchView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onCellTapped?(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}

extension SearchView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        cell.textLabel?.text = resultsSource[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30)
        
        return cell
    }
}
