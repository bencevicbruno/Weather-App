//
//  SettingsView.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/6/21.
//

import UIKit

class SettingsView: UIView {
    private lazy var backgroundImage = UIImageView()
    
    private lazy var celsiusCheckButton = UIButton()
    private lazy var celsiusLabel = UILabel()
    private lazy var fahrenheitCheckButton = UIButton()
    private lazy var fahrenheitLabel = UILabel()
    
    private lazy var humidityIconImage = UIImageView()
    private lazy var humidityCheckButton = UIButton()
    private lazy var pressureIconImage = UIImageView()
    private lazy var pressureCheckButton = UIButton()
    private lazy var windIconImage = UIImageView()
    private lazy var windCheckButton = UIButton()
    
    var onCelsiusTapped: ((Bool) -> Void)?
    var onFahrenheitTapped: ((Bool) -> Void)?
    var onHumidityTapped: ((Bool) -> Void)?
    var onPressureTapped: ((Bool) -> Void)?
    var onWindTapped: ((Bool) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        setupBackgroundImage()
        
        setupCheckButton(celsiusCheckButton, action: #selector(onCelsiusCheckButtonTapped))
        setupLabel(celsiusLabel, text: "Celsius")
        setupCheckButton(fahrenheitCheckButton, action: #selector(onFahrenheitCheckButtonTapped))
        setupLabel(fahrenheitLabel, text: "Fahrenheit")
        
        setupImageView(humidityIconImage, image: "humidity")
        setupCheckButton(humidityCheckButton, action: #selector(onHumidityCheckButtonTapped))
        setupImageView(pressureIconImage, image: "pressure")
        setupCheckButton(pressureCheckButton, action: #selector(onPressureCheckButtonTapped))
        setupImageView(windIconImage, image: "wind")
        setupCheckButton(windCheckButton, action: #selector(onWindCheckButtonTapped))
    }
    
    private func setupBackgroundImage() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        self.addSubview(backgroundImage)
    }
    
    private func setupCheckButton(_ checkButton: UIButton, action: Selector) {
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.layer.backgroundColor = UIColor.white.cgColor
        checkButton.addTarget(self, action: action, for: .touchUpInside)
        self.addSubview(checkButton)
    }
    
    private func setupLabel(_ label: UILabel, text: String) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.systemFont(ofSize: 30)
        self.addSubview(label)
    }
    
    private func setupImageView(_ imageView: UIImageView, image: String) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: image)
        self.addSubview(imageView)
    }
    
    private func setupConstraints() {
        let SPACE_BETWEEN_ELEMENTS: CGFloat = 20
        
        let CHECK_SIZE: CGFloat = 40
        let SPACE_FROM_CHECK_TO_EDGE: CGFloat = 20
        
        let SPACE_BETWEEN_ICONS: CGFloat = 30
        let ICON_OFFSET_FROM_CENTER_Y: CGFloat = 100
        let ICON_SIZE_MULTIPLIER: CGFloat = 0.2
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            
            celsiusCheckButton.widthAnchor.constraint(equalToConstant: CHECK_SIZE),
            celsiusCheckButton.heightAnchor.constraint(equalTo: celsiusCheckButton.widthAnchor),
            celsiusCheckButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: SPACE_FROM_CHECK_TO_EDGE),
            celsiusCheckButton.bottomAnchor.constraint(equalTo: fahrenheitCheckButton.topAnchor, constant: -SPACE_BETWEEN_ELEMENTS),
            
            celsiusLabel.centerYAnchor.constraint(equalTo: celsiusCheckButton.centerYAnchor),
            celsiusLabel.leftAnchor.constraint(equalTo: celsiusCheckButton.rightAnchor, constant: SPACE_BETWEEN_ELEMENTS),
            
            fahrenheitCheckButton.widthAnchor.constraint(equalToConstant: CHECK_SIZE),
            fahrenheitCheckButton.heightAnchor.constraint(equalTo: celsiusCheckButton.widthAnchor),
            fahrenheitCheckButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: SPACE_FROM_CHECK_TO_EDGE),
            fahrenheitCheckButton.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            
            fahrenheitLabel.centerYAnchor.constraint(equalTo: fahrenheitCheckButton.centerYAnchor),
            fahrenheitLabel.leftAnchor.constraint(equalTo: fahrenheitCheckButton.rightAnchor, constant: SPACE_BETWEEN_ELEMENTS),
            
            humidityIconImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: ICON_SIZE_MULTIPLIER),
            humidityIconImage.heightAnchor.constraint(equalTo: humidityIconImage.widthAnchor),
            humidityIconImage.rightAnchor.constraint(equalTo: pressureIconImage.leftAnchor, constant: -SPACE_BETWEEN_ICONS),
            humidityIconImage.topAnchor.constraint(equalTo: self.centerYAnchor, constant: ICON_OFFSET_FROM_CENTER_Y),
            
            humidityCheckButton.widthAnchor.constraint(equalToConstant: CHECK_SIZE),
            humidityCheckButton.heightAnchor.constraint(equalTo: humidityCheckButton.widthAnchor),
            humidityCheckButton.centerXAnchor.constraint(equalTo: humidityIconImage.centerXAnchor),
            humidityCheckButton.topAnchor.constraint(equalTo: humidityIconImage.bottomAnchor, constant: SPACE_BETWEEN_ELEMENTS),
            
            pressureIconImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: ICON_SIZE_MULTIPLIER),
            pressureIconImage.heightAnchor.constraint(equalTo: pressureIconImage.widthAnchor),
            pressureIconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pressureIconImage.topAnchor.constraint(equalTo: self.centerYAnchor, constant: ICON_OFFSET_FROM_CENTER_Y),
            
            pressureCheckButton.widthAnchor.constraint(equalToConstant: CHECK_SIZE),
            pressureCheckButton.heightAnchor.constraint(equalTo: pressureCheckButton.widthAnchor),
            pressureCheckButton.centerXAnchor.constraint(equalTo: pressureIconImage.centerXAnchor),
            pressureCheckButton.topAnchor.constraint(equalTo: pressureIconImage.bottomAnchor, constant: SPACE_BETWEEN_ELEMENTS),
            
            windIconImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: ICON_SIZE_MULTIPLIER),
            windIconImage.heightAnchor.constraint(equalTo: windIconImage.widthAnchor),
            windIconImage.leftAnchor.constraint(equalTo: pressureIconImage.rightAnchor, constant: SPACE_BETWEEN_ICONS),
            windIconImage.topAnchor.constraint(equalTo: self.centerYAnchor, constant: ICON_OFFSET_FROM_CENTER_Y),
            
            windCheckButton.widthAnchor.constraint(equalToConstant: CHECK_SIZE),
            windCheckButton.heightAnchor.constraint(equalTo: windCheckButton.widthAnchor),
            windCheckButton.centerXAnchor.constraint(equalTo: windIconImage.centerXAnchor),
            windCheckButton.topAnchor.constraint(equalTo: windIconImage.bottomAnchor, constant: SPACE_BETWEEN_ELEMENTS)
        ])
    }
    
    @objc func onCelsiusCheckButtonTapped() {
        onCelsiusTapped?(isButtonChecked(celsiusCheckButton))
    }
    
    @objc func onFahrenheitCheckButtonTapped() {
        onFahrenheitTapped?(isButtonChecked(fahrenheitCheckButton))
    }
    
    @objc func onHumidityCheckButtonTapped() {
        onHumidityTapped?(isButtonChecked(humidityCheckButton))
    }
    
    @objc func onPressureCheckButtonTapped() {
        onPressureTapped?(isButtonChecked(pressureCheckButton))
    }
    
    @objc func onWindCheckButtonTapped() {
        onWindTapped?(isButtonChecked(windCheckButton))
    }
    
    public func setupData(data: SettingsData) {
        if let useCelsius = data.useCelsius {
            setButtonChecked(celsiusCheckButton, useCelsius)
            setButtonChecked(fahrenheitCheckButton, !useCelsius)
        }
        
        if let showHumidity = data.showHumidity {
            setButtonChecked(humidityCheckButton, showHumidity)
        }
        
        if let showPressure = data.showPressure {
            setButtonChecked(pressureCheckButton, showPressure)
        }
        
        if let showWind = data.showWind {
            setButtonChecked(windCheckButton, showWind)
        }
    }
    
    private func setButtonChecked(_ button: UIButton, _ checked: Bool) {
        button.setImage(checked ? UIImage(named: "check") : nil, for: .normal)
    }
    
    private func isButtonChecked(_ button: UIButton) -> Bool {
        return button.image(for: .normal) != nil
    }
}
