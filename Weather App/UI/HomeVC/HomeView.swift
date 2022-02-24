//
//  HomeView.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import UIKit

class HomeView: UIView {
    
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
    
    private lazy var conditionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        return imageView
    }()
    
    private lazy var currentTemperatureLabel: UILabel = {
        let label = UILabel()
        addSubview(label)
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        addSubview(label)
        return label
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 30)
        addSubview(label)
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 30)
        addSubview(label)
        return label
    }()
    
    private lazy var optionalLabelsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        addSubview(stackView)
        return stackView
    }()
    
    private lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        optionalLabelsStack.addArrangedSubview(label)
        return label
    }()
    
    private lazy var pressureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        optionalLabelsStack.addArrangedSubview(label)
        return label
    }()
    
    private lazy var windSpeedLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        optionalLabelsStack.addArrangedSubview(label)
        return label
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
    
    // MARK: - Data setup
    
    func setupData(data: HomeData, settings: SettingsData) {
        let isScreenSmall = UIScreen.main.isSmall
        
        // Hide loading or error label and show others
        self.subviews.forEach { subview in
            subview.isHidden = subview == loadingLabel || subview == errorLabel
        }
        
        // Condition & Location
        conditionImage.image = UIImage(systemName: data.condition)?.withTintColor(UIColor(red: 0.1, green: 0.3, blue: 0.3, alpha: 1.0), renderingMode: .alwaysOriginal)
        locationLabel.text = data.cityName
        
        // Current temperature
        let currentTemperature = Int(settings.useCelsius ? data.currentTemperature.rounded : data.currentTemperature.convertedToFahrenheit.rounded)
        let currentTemperatureText = NSMutableAttributedString()
        currentTemperatureText.append(NSMutableAttributedString(
            string: "\(currentTemperature)",
            attributes: [.font: UIFont(name: "AvenirNext-Bold", size: isScreenSmall ? 65 : 85)!]))
        currentTemperatureText.append(NSMutableAttributedString(
            string: settings.useCelsius ? "°C" : "°F",
            attributes: [.font: UIFont.systemFont(ofSize: isScreenSmall ? 80 : 100)]))
        currentTemperatureLabel.attributedText = currentTemperatureText
        
        // Min & max temperature
        let minTemperature = settings.useCelsius ? data.minTemperature : data.minTemperature.convertedToFahrenheit
        minTemperatureLabel.text = "min\n\(minTemperature) \(settings.useCelsius ? "C" : "F")"
        let maxTemperature = settings.useCelsius ? data.maxTemperature : data.maxTemperature.convertedToFahrenheit
        maxTemperatureLabel.text = "max\n\(maxTemperature) \(settings.useCelsius ? "C" : "F")"
        
        // Optional labels
        let optionalLabelTitleFont = UIFont.systemFont(ofSize: isScreenSmall ? 18 : 20)
        let optionalLabelValueFont = UIFont.systemFont(ofSize: isScreenSmall ? 20 : 27)
        
        if settings.showHumidity {
            let attributedString = NSMutableAttributedString(string: "Humidity\n", attributes: [.font: optionalLabelTitleFont])
            attributedString.append(NSMutableAttributedString(string: "\(data.humidity) %", attributes: [.font: optionalLabelValueFont]))
            humidityLabel.attributedText = attributedString
            optionalLabelsStack.setVisible(humidityLabel)
        } else {
            optionalLabelsStack.setHidden(humidityLabel)
        }
        
        if settings.showPressure {
            let attributedString = NSMutableAttributedString(string: "Pressure\n", attributes: [.font: optionalLabelTitleFont])
            attributedString.append(NSMutableAttributedString(string: "\(data.pressure) hpa", attributes: [.font: optionalLabelValueFont]))
            pressureLabel.attributedText = attributedString
            optionalLabelsStack.setVisible(pressureLabel)
        } else {
            optionalLabelsStack.setHidden(pressureLabel)
        }
        
        if settings.showWindSpeed {
            let attributedString = NSMutableAttributedString(string: "Wind\n", attributes: [.font: optionalLabelTitleFont])
            attributedString.append(NSMutableAttributedString(string: "\(data.wind) mph", attributes: [.font: optionalLabelValueFont]))
            windSpeedLabel.attributedText = attributedString
            optionalLabelsStack.setVisible(windSpeedLabel)
        } else {
            optionalLabelsStack.setHidden(windSpeedLabel)
        }
    }
    
    func showLoading() {
        self.subviews.forEach { subview in
            subview.isHidden = subview != loadingLabel && subview != backgroundImage
        }
    }
    
    func showError(_ message: String) {
        errorLabel.text = "Error:\n\(message)"
        
        self.subviews.forEach { subview in
            subview.isHidden = subview != errorLabel && subview != backgroundImage
        }
    }
}

private extension HomeView {
    
    func setup() {
        let isScreenSmall = UIScreen.main.isSmall
        
        let padding: CGFloat = 10
        let minMaxTempLabelDistance: CGFloat = isScreenSmall ? 15 : 25
        
        backgroundImage.anchorToSuperview(ignoreSafeArea: true)
        conditionImage.anchor(top: (topAnchor, isScreenSmall ? padding : 3 * padding), trailing: (safeAreaLayoutGuide.trailingAnchor, 0))
        conditionImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.33).isActive = true
        conditionImage.heightAnchor.constraint(equalTo: conditionImage.widthAnchor).isActive = true
        currentTemperatureLabel.anchor(top: (conditionImage.bottomAnchor, 10), trailing: (safeAreaLayoutGuide.trailingAnchor, padding))
        locationLabel.anchor(top: (currentTemperatureLabel.bottomAnchor, 10), trailing: (safeAreaLayoutGuide.trailingAnchor, padding))
        
        minTemperatureLabel.anchor(top: (safeAreaLayoutGuide.centerYAnchor, -2 * minMaxTempLabelDistance), trailing: (safeAreaLayoutGuide.centerXAnchor, minMaxTempLabelDistance))
        maxTemperatureLabel.anchor(top: (safeAreaLayoutGuide.centerYAnchor, -2 * minMaxTempLabelDistance), leading: (safeAreaLayoutGuide.centerXAnchor, minMaxTempLabelDistance))
        
        optionalLabelsStack.anchor(bottom: (safeAreaLayoutGuide.bottomAnchor, padding), leading: (safeAreaLayoutGuide.leadingAnchor, padding), trailing: (safeAreaLayoutGuide.trailingAnchor, padding))
        
        loadingLabel.centerInSuperview(ignoreSafeArea: true)
        errorLabel.centerInSuperview(ignoreSafeArea: true)
    }
}
