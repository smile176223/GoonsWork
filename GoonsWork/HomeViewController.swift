//
//  HomeViewController.swift
//  GoonsWork
//
//  Created by Hao on 2022/6/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nextPageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        self.title = "第一頁"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let image = UIImage(named: "icons8-back-24")
        self.navigationController?.navigationBar.backIndicatorImage = image
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        nextPageButton.backgroundColor = .black
    }
    
    @IBAction func nextPageButtonTap(_ sender: UIButton) {
        guard let goonsVC = storyboard?.instantiateViewController(withIdentifier: "\(GoonsViewController.self)") as? GoonsViewController else {
            return
        }
        self.navigationController?.pushViewController(goonsVC, animated: true)
    }
}

