//
//  UIView.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 07/03/23.
//

import UIKit

extension UIView {
    static func preventDimmingView() {
        guard let originalMethod = class_getInstanceMethod(UIView.self, #selector(addSubview)),
                let swizzledMethod = class_getInstanceMethod(UIView.self, #selector(swizzled_addSubview))
        else {return}
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    static func allowDimmingView() {
        guard let originalMethod = class_getInstanceMethod(UIView.self, #selector(addSubview)),
                let swizzledMethod = class_getInstanceMethod(UIView.self, #selector(swizzled_addSubview))
        else {return}
        
        method_exchangeImplementations(swizzledMethod, originalMethod)
    }
    
    @objc func swizzled_addSubview(_ view: UIView) {
//        let className = String(bytes: [95, 85, 73, 80, 97, 114, 97, 108, 108, 97, 120, 68, 105, 109, 109, 105, 110, 103, 86, 105, 101, 119], encoding: .utf8)!
        let className = "_UIParallaxDimmingView"
        guard let offendingClass = NSClassFromString(className)
        else { return swizzled_addSubview(view) }
        
        if view.isMember(of: offendingClass) { return }
        swizzled_addSubview(view)
    }
}
