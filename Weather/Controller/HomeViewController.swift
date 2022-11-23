//
//  ViewController.swift
//  Weather
//
//  Created by hakkı can şengönül on 23.11.2022.
//

import UIKit

class HomeViewController: UIViewController {
     // MARK: - Properties
    private let backgroundImageView = UIImageView()
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
 // MARK: - Helpers
extension HomeViewController{
    private func style(){
        //backgroundImageView style
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = #imageLiteral(resourceName: "background")
        
    }
    private func layout(){
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor)
        ])
        
    }
}

