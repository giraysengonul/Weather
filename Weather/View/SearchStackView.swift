//
//  SearchStackView.swift
//  Weather
//
//  Created by hakkı can şengönül on 24.11.2022.
//

import UIKit
protocol SearchStackViewDelegate: AnyObject {
    func didFetchWeather(_ searchStackView: SearchStackView, weatherModel: WeatherModel)
    func didFailWithError(_ searchStackView: SearchStackView, error: ServiceError)
}
class SearchStackView: UIStackView {
     // MARK: - Properties
    weak var delegate: SearchStackViewDelegate?
    private let locationButton = UIButton(type: .system)
    private let searchTextField = UITextField()
    private let searchButton = UIButton(type: .system)
    private let service = WeatherService()
     // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension SearchStackView{
    private func style(){
        //locationButton style
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        locationButton.tintColor = .label
        locationButton.layer.cornerRadius = 40 / 2
        locationButton.contentVerticalAlignment = .fill
        locationButton.contentHorizontalAlignment = .fill
        //searchButton style
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.layer.cornerRadius = 40 / 2
        searchButton.tintColor = .label
        searchButton.contentVerticalAlignment = .fill
        searchButton.contentHorizontalAlignment = .fill
        searchButton.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
        //searchTextField style
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search"
        searchTextField.font = UIFont.preferredFont(forTextStyle: .title1)
        searchTextField.borderStyle = .roundedRect
        searchTextField.textAlignment = .right
        searchTextField.backgroundColor = .systemFill
        searchTextField.delegate = self
    }
    private func layout(){
        addArrangedSubview(locationButton)
        addArrangedSubview(searchTextField)
        addArrangedSubview(searchButton)
        
        NSLayoutConstraint.activate([
            //locationButton layout
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            locationButton.widthAnchor.constraint(equalToConstant: 40),
            //searchButton layout
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}
 // MARK: - Selector
extension SearchStackView{
    @objc private func handleSearchButton(_ sender: UIButton){
        self.searchTextField.endEditing(true)
    }
}
 // MARK: - UITextFieldDelegate
extension SearchStackView: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return self.searchTextField.endEditing(true)
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != ""{
            return true
        }else{
            searchTextField.placeholder = "Search"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let cityName = searchTextField.text else { return  }
        service.fetchWeather(forCityName: cityName) { result in
            switch result{
            case .success(let result):
                self.delegate?.didFetchWeather(self, weatherModel: result)
            case .failure(let error):
                self.delegate?.didFailWithError(self, error: error)
            }
        }
        self.searchTextField.text = ""
    }
    
}
