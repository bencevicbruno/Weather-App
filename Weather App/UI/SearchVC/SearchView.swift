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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        self.addSubview(backgroundImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }
}
