//
//  SettingsView.swift
//  Weather App
//
//  Created by Bruno Bencevic on 13.10.2022..
//

import Foundation
import UIKit

final class SettingsView: UIView {
    
    // MARK: - Properties
    
    var onCelsiusTapped: ((Bool) -> Void)?
    var onFahrenheitTapped: ((Bool) -> Void)?
    var onHumidityTapped: ((Bool) -> Void)?
    var onPressureTapped: ((Bool) -> Void)?
    var onWindSpeedTapped: ((Bool) -> Void)?
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(data: SettingsData) {
        setButtonChecked(celsiusCheckButton, isChecked: data.useCelsius)
        setButtonChecked(fahrenheitCheckButton, isChecked: !data.useCelsius)
        
        setButtonChecked(humidityCheckButton, isChecked: data.showHumidity)
        setButtonChecked(pressureCheckButton, isChecked: data.showPressure)
        setButtonChecked(windSpeedCheckButton, isChecked: data.showWindSpeed)
    }
    
    // MARK: - UI Components
    
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
    
    private lazy var celsiusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Celsius"
        addSubview(label)
        return label
    }()
    
    private lazy var fahrenheitCheckButton: UIButton = {
        let button = createCheckButton { [weak self] isChecked in
            self?.onFahrenheitTapped?(isChecked)
        }
        addSubview(button)
        return button
    }()
    
    private lazy var fahrenheitLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Fahrenheit"
        addSubview(label)
        return label
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
    
    func createCheckButton(onTapped: ((Bool) -> Void)? = nil) -> UIButton {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.white.cgColor
        button.addAction(UIAction { [weak button] action in
            let willBecomeChecked = button?.image(for: .normal) == nil
            onTapped?(willBecomeChecked)
        }, for: .touchUpInside)
        return button
    }
    
    // MARK: - Setup & Misc
    
    func setup() {
        let padding: CGFloat = 10
        let iconCheckmarkDistance: CGFloat = 40
        
        backgroundImage.anchorToSuperview(ignoreSafeArea: true)
        
        celsiusCheckButton.anchor(bottom: (fahrenheitCheckButton.topAnchor, 20), leading: (safeAreaLayoutGuide.leadingAnchor, padding), size: CGSize(width: 40, height: 40))
        celsiusLabel.alignCenterY(with: celsiusCheckButton)
        celsiusLabel.anchor(leading: (celsiusCheckButton.trailingAnchor, 2 * padding))
        fahrenheitCheckButton.anchor(bottom: (safeAreaLayoutGuide.centerYAnchor, 5 * padding), leading: (safeAreaLayoutGuide.leadingAnchor, padding), size: CGSize(width: 40, height: 40))
        fahrenheitLabel.alignCenterY(with: fahrenheitCheckButton)
        fahrenheitLabel.anchor(leading: (fahrenheitCheckButton.trailingAnchor, 2 * padding))
        
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
    
    func setButtonChecked(_ button: UIButton, isChecked: Bool) {
        button.setImage(isChecked ? UIImage(named: "icon_check") : nil, for: .normal)
    }
}
