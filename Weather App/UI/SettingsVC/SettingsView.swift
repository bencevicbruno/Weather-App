//
//  SettingsView.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import UIKit

class SettingsView: UIView {
    
    var onCelsiusTapped: ((Bool) -> Void)?
    var onFahrenheitTapped: ((Bool) -> Void)?
    var onHumidityTapped: ((Bool) -> Void)?
    var onPressureTapped: ((Bool) -> Void)?
    var onWindSpeedTapped: ((Bool) -> Void)?
    
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
    
    private lazy var celsiusCheckButton: UIButton = {
        let button = createCheckButton { [weak self] isChecked in
            self?.onCelsiusTapped?(isChecked)
        }
        addSubview(button)
        return button
    }()
    
    private lazy var fahrenheitCheckButton: UIButton = {
        let button = createCheckButton { [weak self] isChecked in
            self?.onFahrenheitTapped?(isChecked)
        }
        addSubview(button)
        return button
    }()
    
    private lazy var optionalChecksStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        addSubview(stackView)
        return stackView
    }()
    
    private lazy var humidityIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_humidity")
        addSubview(imageView)
        return imageView
    }()
    
    private lazy var humidityCheckButton: UIButton = {
        let button = createCheckButton { [weak self] isChecked in
            self?.onHumidityTapped?(isChecked)
        }
        optionalChecksStackView.addArrangedSubview(button)
        return button
    }()
    
    private lazy var pressureIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_pressure")
        addSubview(imageView)
        return imageView
    }()
    
    private lazy var pressureCheckButton: UIButton = {
        let button = createCheckButton { [weak self] isChecked in
            self?.onPressureTapped?(isChecked)
        }
        optionalChecksStackView.addArrangedSubview(button)
        return button
    }()
    
    private lazy var windSpeedIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_wind_speed")
        addSubview(imageView)
        return imageView
    }()
    
    private lazy var windSpeedCheckButton: UIButton = {
        let button = createCheckButton { [weak self] isChecked in
            self?.onWindSpeedTapped?(isChecked)
        }
        optionalChecksStackView.addArrangedSubview(button)
        return button
    }()
    
    // MARK: - Data setup
    
    func setupData(useCelsius: Bool? = nil, showHumidity: Bool? = nil, showPressure: Bool? = nil, showWindSpeed: Bool? = nil) {
        if let useCelsius = useCelsius {
            setButtonChecked(celsiusCheckButton, isChecked: useCelsius)
            setButtonChecked(fahrenheitCheckButton, isChecked: !useCelsius)
        }
        
        if let showHumidity = showHumidity {
            setButtonChecked(humidityCheckButton, isChecked: showHumidity)
        }
        
        if let showPressure = showPressure {
            setButtonChecked(pressureCheckButton, isChecked: showPressure)
        }
        
        if let showWindSpeed = showWindSpeed {
            setButtonChecked(windSpeedCheckButton, isChecked: showWindSpeed)
        }
    }
}

private extension SettingsView {
    
    func setup() {
        let padding: CGFloat = 10
        let iconCheckmarkDistance: CGFloat = 40
        
        backgroundImage.anchorToSuperview(ignoreSafeArea: true)
        
        optionalChecksStackView.anchor(bottom: (safeAreaLayoutGuide.bottomAnchor, 4 * padding), leading: (safeAreaLayoutGuide.leadingAnchor, 50), trailing: (safeAreaLayoutGuide.trailingAnchor, 50))
        
        humidityIcon.anchor(size: CGSize(width: 60, height: 60))
        humidityIcon.anchor(bottom: (humidityCheckButton.topAnchor, iconCheckmarkDistance))
        humidityIcon.centerXAnchor.constraint(equalTo: humidityCheckButton.centerXAnchor).isActive = true
        humidityCheckButton.anchor(size: CGSize(width: 40, height: 40))
        
        pressureIcon.anchor(size: CGSize(width: 60, height: 60))
        pressureIcon.anchor(bottom: (pressureCheckButton.topAnchor, iconCheckmarkDistance))
        pressureIcon.centerXAnchor.constraint(equalTo: pressureCheckButton.centerXAnchor).isActive = true
        pressureCheckButton.anchor(size: CGSize(width: 40, height: 40))
        
        windSpeedIcon.anchor(size: CGSize(width: 60, height: 60))
        windSpeedIcon.anchor(bottom: (windSpeedCheckButton.topAnchor, iconCheckmarkDistance))
        windSpeedIcon.centerXAnchor.constraint(equalTo: windSpeedCheckButton.centerXAnchor).isActive = true
        windSpeedCheckButton.anchor(size: CGSize(width: 40, height: 40))
    }
    
    func createCheckButton(onTapped: ((Bool) -> Void)? = nil) -> UIButton {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.white.cgColor
        button.addAction(UIAction { [weak button] action in
            let willBecomeChecked = button?.image(for: .normal) == nil
            onTapped?(willBecomeChecked)
        }, for: .touchUpInside)
        return button
    }
    
    func setButtonChecked(_ button: UIButton, isChecked: Bool) {
        button.setImage(isChecked ? UIImage(named: "icon_check") : nil, for: .normal)
    }
}
