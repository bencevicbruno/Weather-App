//
//  HomeView.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import UIKit

class HomeView: UIView {
    private lazy var backgroundImage = UIImageView()
    private lazy var conditionImage = UIImageView()
    private lazy var currentTemperatureLabel = UILabel()
    private lazy var cityNameLabel = UILabel()
    private lazy var minTemperatureLabel = UILabel()
    private lazy var maxTemperatureLabel = UILabel()
    private var humidityLabel = UILabel()
    private var pressureLabel = UILabel()
    private var windLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let testData = HomeData(condition: "sun.max", currentTemperature: 21, cityName: "London", minTemperature: 14.5, maxTemperature: 31.2, humidity: 0.79, pressure: 1016.7, wind: nil /*4.34*/)
        
        setupView()
        setupData(data: testData, useFahrenheit: false)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        setupBackgroundImage()
        setupConditionImage()
        setupCurrentTemperatureLabel()
        setupCityNameLabel()
        setMinMaxTemperatureLabel(minTemperatureLabel)
        setMinMaxTemperatureLabel(maxTemperatureLabel)
        setupOptionalLabel(humidityLabel)
        setupOptionalLabel(pressureLabel)
        setupOptionalLabel(windLabel)
    }
    
    private func setupBackgroundImage() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        self.addSubview(backgroundImage)
    }
    
    private func setupConditionImage() {
        conditionImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(conditionImage)
    }
    
    private func setupCurrentTemperatureLabel() {
        currentTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(currentTemperatureLabel)
    }
    
    private func setupCityNameLabel() {
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.font = UIFont.systemFont(ofSize: 30)
        self.addSubview(cityNameLabel)
    }
    
    private func setMinMaxTemperatureLabel(_ label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 30)
        self.addSubview(label)
    }
    
    private func setupOptionalLabel(_ label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        self.addSubview(label)
    }
    
    private func setupConstraints() {
        let OFFSET_FROM_TOP: CGFloat = 50
        let OFFSET_FROM_SIDE: CGFloat = 10
        let MIN_MAX_TEMPERATURE_OFFSET: CGFloat = 25
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor),
            
            conditionImage.topAnchor.constraint(equalTo: self.topAnchor, constant: OFFSET_FROM_TOP),
            conditionImage.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -OFFSET_FROM_SIDE),
            conditionImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25),
            conditionImage.heightAnchor.constraint(equalTo: conditionImage.widthAnchor),
            
            currentTemperatureLabel.topAnchor.constraint(equalTo: conditionImage.bottomAnchor, constant: 10),
            currentTemperatureLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -OFFSET_FROM_SIDE),
            
            cityNameLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 10),
            cityNameLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -OFFSET_FROM_SIDE),
            
            minTemperatureLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -MIN_MAX_TEMPERATURE_OFFSET * 2),
            minTemperatureLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: -MIN_MAX_TEMPERATURE_OFFSET),
            
            maxTemperatureLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -MIN_MAX_TEMPERATURE_OFFSET * 2),
            maxTemperatureLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: MIN_MAX_TEMPERATURE_OFFSET)
        ])
        
        setupConstraintsForOptionalLabels()
    }
    
    private func setupConstraintsForOptionalLabels() {
        let visibleLabels = [humidityLabel, pressureLabel, windLabel].filter { !$0.isHidden }
        
        let HORIZONTAL_OFFSET: CGFloat = 15
        let BOTTOM_OFFSET: CGFloat = -30
        
        if visibleLabels.count == 1 {
            let label = visibleLabels[0]
            
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                label.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: BOTTOM_OFFSET)
            ])
        } else if visibleLabels.count == 2 {
            let label1 = visibleLabels[0]
            let label2 = visibleLabels[1]

            NSLayoutConstraint.activate([
                label1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: -HORIZONTAL_OFFSET * 5),
                label1.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: BOTTOM_OFFSET),
                label2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: HORIZONTAL_OFFSET * 5),
                label2.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: BOTTOM_OFFSET)
            ])
        } else if visibleLabels.count == 3 {
            let label1 = visibleLabels[0]
            let label2 = visibleLabels[1]
            let label3 = visibleLabels[2]

            NSLayoutConstraint.activate([
                label1.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: HORIZONTAL_OFFSET),
                label1.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: BOTTOM_OFFSET),
                label2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                label2.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: BOTTOM_OFFSET),
                label3.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -HORIZONTAL_OFFSET),
                label3.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: BOTTOM_OFFSET),
            ])
        } else {
            fatalError("Layout not implemented for more than 3 optional labels!")
        }
    }
}

extension HomeView {
    public func setupData(data: HomeData, useFahrenheit: Bool) {
        conditionImage.image = UIImage(systemName: data.condition)?.withTintColor(UIColor(red: 0.1, green: 0.3, blue: 0.3, alpha: 1.0), renderingMode: .alwaysOriginal)
        
        let currentTemperature = useFahrenheit ? data.currentTemperature : Int(convertToFahrenheit(Float(data.currentTemperature)))
        let attributedString = NSMutableAttributedString(string: "\(currentTemperature)", attributes: [.font: UIFont(name: "AvenirNext-Bold", size: 85)!])
        attributedString.append(NSMutableAttributedString(string: useFahrenheit ? "°C" : "°F", attributes: [.font: UIFont.systemFont(ofSize: 100)]))
        currentTemperatureLabel.attributedText = attributedString
        
        cityNameLabel.text = data.cityName
        
        let minTemperature = useFahrenheit ? data.minTemperature : convertToFahrenheit(data.minTemperature)
        minTemperatureLabel.text = "min\n\(minTemperature) \(useFahrenheit ? "C" : "F")"
        let maxTemperature = useFahrenheit ? data.maxTemperature : convertToFahrenheit(data.maxTemperature)
        maxTemperatureLabel.text = "max\n\(maxTemperature) \(useFahrenheit ? "C" : "F")"
        
        if let humidity = data.humidity {
            humidityLabel.isHidden = false
            let attributedString = NSMutableAttributedString(string: "Humidity\n", attributes: [.font: UIFont.systemFont(ofSize: 20)])
            attributedString.append(NSMutableAttributedString(string: "\(humidity) %", attributes: [.font: UIFont.systemFont(ofSize: 27)]))
            humidityLabel.attributedText = attributedString
        } else {
            humidityLabel.isHidden = true
        }
        
        if let pressure = data.pressure {
            pressureLabel.isHidden = false
            let attributedString = NSMutableAttributedString(string: "Pressure\n", attributes: [.font: UIFont.systemFont(ofSize: 20)])
            attributedString.append(NSMutableAttributedString(string: "\(pressure) hpa", attributes: [.font: UIFont.systemFont(ofSize: 27)]))
            pressureLabel.attributedText = attributedString
        } else {
            pressureLabel.isHidden = true
        }
        
        if let wind = data.wind {
            windLabel.isHidden = false
            let attributedString = NSMutableAttributedString(string: "Wind\n", attributes: [.font: UIFont.systemFont(ofSize: 20)])
            attributedString.append(NSMutableAttributedString(string: "\(wind) mph", attributes: [.font: UIFont.systemFont(ofSize: 27)]))
            windLabel.attributedText = attributedString
        } else {
            windLabel.isHidden = true
        }
    }
    
    private func convertToFahrenheit(_ celsius: Float) -> Float {
        return celsius * 1.8 + 32
    }
    
    private func convertToCelsius(_ fahrenheit: Float) -> Float {
        return (fahrenheit - 32) / 1.8
    }
}
