//
//  SearchStackView.swift
//  Weather
//
//  Created by hakkı can şengönül on 24.11.2022.
//

import UIKit
class SearchStackView: UIStackView {
     // MARK: - Properties
    private let locationButton = UIButton(type: .system)
    private let searchTextField = UITextField()
    private let searchButton = UIButton(type: .system)
    
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
        //searchTextField style
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search"
        searchTextField.font = UIFont.preferredFont(forTextStyle: .title1)
        searchTextField.borderStyle = .roundedRect
        searchTextField.textAlignment = .right
        searchTextField.backgroundColor = .systemFill
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
