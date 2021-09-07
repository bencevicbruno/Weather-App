//
//  HomeView.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import UIKit

class HomeView: UIView {
    private lazy var backgroundImage = UIImageView()
    private lazy var testLabel = UILabel()
    
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
        
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.text = "TEST"
        testLabel.textAlignment = .center
        testLabel.font = UIFont.boldSystemFont(ofSize: 50)
        testLabel.textColor = .white
        self.addSubview(testLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            
            testLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            testLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
