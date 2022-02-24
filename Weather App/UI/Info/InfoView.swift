//
//  InfoView.swift
//  Weather App
//
//  Created by Bruno Benčević on 24.02.2022..
//

import Foundation
import UIKit

final class InfoView: UIView {
    
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
    
    private lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.text = "\nThis WeatherApp project was made as the final project for the UIKit part of iOS Summer School at Cobe. This version of the app was later perfected to match all features from the SwiftUI version.\n"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 28)
        label.textColor = .white
        label.backgroundColor = .white.withAlphaComponent(0.1)
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        addSubview(label)
        return label
    }()
}

private extension InfoView {
    
    func setup() {
        backgroundImage.anchorToSuperview(ignoreSafeArea: true)
        infoLabel.centerInSuperview(ignoreSafeArea: true)
        infoLabel.anchor(size: CGSize(width: 250, height: 0))
    }
}
