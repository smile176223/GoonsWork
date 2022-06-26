//
//  UIApplication+Helper.swift
//  GoonsWork
//
//  Created by Hao on 2022/6/26.
//

import UIKit

extension UIApplication {
    static let getWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first
    static let statusBarHeight = UIApplication.getWindow?.windowScene?.statusBarManager?.statusBarFrame.height
}
