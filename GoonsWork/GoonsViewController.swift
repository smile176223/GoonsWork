//
//  GoonsViewController.swift
//  GoonsWork
//
//  Created by Hao on 2022/6/23.
//

import UIKit

class GoonsViewController: UIViewController, UIScrollViewDelegate {
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "果思設計"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS APP"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dogImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dog")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let redUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMaxXMinYCorner]
        return view
    }()
    
    private let appearance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupScrollView()
        setupViews()
        scrollView.delegate = self
    }
    
    private func setupNav() {
        self.title = "果思設計"
        self.navigationController?.navigationBar.subviews.first?.alpha = 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.setAlpha()
    }
    
    private func setAlpha() {
        guard let navgationBarHeight = navigationController?.navigationBar.frame.height,
              let statusBarHeight = UIApplication.statusBarHeight else {
            return
        }
        
        let offsetY = scrollView.contentOffset.y
        let alpha = 1 + (offsetY / (navgationBarHeight + statusBarHeight))
        self.navigationController?.navigationBar.subviews.first?.alpha = alpha
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        let titleAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(alpha)]
        appearance.titleTextAttributes = titleAttribute
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    private func setupScrollView(){
        guard let navgationBarHeight = navigationController?.navigationBar.frame.height,
              let statusBarHeight = UIApplication.statusBarHeight else {
            return
        }
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -(navgationBarHeight + statusBarHeight)).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: navgationBarHeight + statusBarHeight).isActive = true
        self.scrollView.bounces = false
        self.scrollView.showsVerticalScrollIndicator = false
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    private func setupViews(){
        guard let navgationBarHeight = navigationController?.navigationBar.frame.height,
              let statusBarHeight = UIApplication.statusBarHeight else {
            return
        }
        contentView.addSubview(dogImageView)
        dogImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        dogImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        dogImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        dogImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true

        contentView.addSubview(redUIView)
        redUIView.topAnchor.constraint(equalTo: dogImageView.bottomAnchor, constant: -50).isActive = true
        redUIView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        redUIView.heightAnchor.constraint(equalToConstant: 900).isActive = true
        redUIView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        redUIView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (navgationBarHeight + statusBarHeight)).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40).isActive = true
        
        contentView.addSubview(secondTitleLabel)
        secondTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        secondTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        secondTitleLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
    }
}
