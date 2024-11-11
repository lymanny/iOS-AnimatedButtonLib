//
//  UIButton.swift
//  AnimatedButtonLib
//
//  Created by lymanny on 11/11/24.
//

import UIKit

public extension UIButton {
    
    func pulsate(completion: @escaping () -> Void) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        // Add animation and trigger completion after animation finishes
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            completion()
        }
        layer.add(pulse, forKey: "pulse")
        CATransaction.commit()
    }
    
    func flash(completion: @escaping () -> Void) {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.2
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        // Add animation and trigger completion after animation finishes
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            completion()
        }
        layer.add(flash, forKey: "flashAnimation")
        CATransaction.commit()
    }
    
    func shake(completion: @escaping () -> Void) {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        // Add animation and trigger completion after animation finishes
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            completion()
        }
        layer.add(shake, forKey: "position")
        CATransaction.commit()
    }
    
    func press(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.05, animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity
            }, completion: { _ in
                completion()
            })
        })
    }
    
}
