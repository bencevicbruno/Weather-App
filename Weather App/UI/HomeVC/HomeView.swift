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
    private lazy var humidityLabel = UILabel()
    private lazy var pressureLabel = UILabel()
    private lazy var windLabel = UILabel()
    
    private lazy var optionalViews = [humidityLabel, pressureLabel, windLabel]
    
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
    }
    
    private func setupConstraintsForOptionalLabels() {
        let visibleLabels = optionalViews.filter { self.subviews.contains($0) }
        
        let HORIZONTAL_OFFSET: CGFloat = 15
        let BOTTOM_OFFSET: CGFloat = -30
        
        if visibleLabels.isEmpty { return }
        
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
    public func setupData(data: HomeData, settings: SettingsData) {
        optionalViews.forEach {
            $0.removeFromSuperview()
        }
        
        conditionImage.image = UIImage(systemName: data.condition)?.withTintColor(UIColor(red: 0.1, green: 0.3, blue: 0.3, alpha: 1.0), renderingMode: .alwaysOriginal)
        cityNameLabel.text = data.cityName
        
        let useCelsius = settings.useCelsius ?? true
        setupTemperatures(current: data.currentTemperature, min: data.minTemperature, max: data.maxTemperature, useCelsius: useCelsius)
        
        let showHumidity = settings.showHumidity ?? true
        if showHumidity {
            let attributedString = NSMutableAttributedString(string: "Humidity\n", attributes: [.font: UIFont.systemFont(ofSize: 20)])
            attributedString.append(NSMutableAttributedString(string: "\(data.humidity) %", attributes: [.font: UIFont.systemFont(ofSize: 27)]))
            humidityLabel.attributedText = attributedString
            self.addSubview(humidityLabel)
        } else {
            humidityLabel.removeFromSuperview()
        }
        
        let showPressure = settings.showPressure ?? true
        if showPressure {
            let attributedString = NSMutableAttributedString(string: "Pressure\n", attributes: [.font: UIFont.systemFont(ofSize: 20)])
            attributedString.append(NSMutableAttributedString(string: "\(data.pressure) hpa", attributes: [.font: UIFont.systemFont(ofSize: 27)]))
            pressureLabel.attributedText = attributedString
            self.addSubview(pressureLabel)
        } else {
            pressureLabel.removeFromSuperview()
        }
        
        let showWind = settings.showWind ?? true
        if showWind {
            let attributedString = NSMutableAttributedString(string: "Wind\n", attributes: [.font: UIFont.systemFont(ofSize: 20)])
            attributedString.append(NSMutableAttributedString(string: "\(data.wind) mph", attributes: [.font: UIFont.systemFont(ofSize: 27)]))
            windLabel.attributedText = attributedString
            self.addSubview(windLabel)
        } else {
            windLabel.removeFromSuperview()
        }
        
        setupConstraintsForOptionalLabels()
    }
    
    private func setupTemperatures(current: Int, min: Float, max: Float, useCelsius: Bool) {
        let currentTemperature = useCelsius ? current : Int(convertToFahrenheitAndRound(Float(current)))
        let attributedString = NSMutableAttributedString(string: "\(currentTemperature)", attributes: [.font: UIFont(name: "AvenirNext-Bold", size: 85)!])
        attributedString.append(NSMutableAttributedString(string: useCelsius ? "°C" : "°F", attributes: [.font: UIFont.systemFont(ofSize: 100)]))
        currentTemperatureLabel.attributedText = attributedString
        
        let minTemperature = useCelsius ? min : convertToFahrenheitAndRound(min)
        minTemperatureLabel.text = "min\n\(minTemperature) \(useCelsius ? "C" : "F")"
        let maxTemperature = useCelsius ? max : convertToFahrenheitAndRound(max)
        maxTemperatureLabel.text = "max\n\(maxTemperature) \(useCelsius ? "C" : "F")"
    }
    
    private func convertToFahrenheitAndRound(_ celsius: Float) -> Float {
        return ((celsius * 1.8 + 32) * 100).rounded() / 100
    }
}
