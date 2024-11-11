//
//  UIView.swift
//  AnimatedButtonLib
//
//  Created by lymanny on 11/11/24.
//

import UIKit

public extension UIView {
    
    /**
     Simply zooming in of a view: set view scale to 0 and zoom to Identity on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomIn(duration: TimeInterval = 0.2, completion: (() -> Void)? = nil) {
        self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: {
            self.transform = .identity
        }) { _ in
            completion?()
        }
    }
    
    /**
     Simply zooming out of a view: set view scale to Identity and zoom out to 0 on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomOut(duration: TimeInterval = 0.2, completion: (() -> Void)? = nil) {
        self.transform = .identity
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: {
            self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        }) { _ in
            completion?()
        }
    }
    
    /**
     Zoom in any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomInWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2, completion: (() -> Void)? = nil) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        
        UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }) { _ in
            UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: {
                self.transform = .identity
            }) { _ in
                completion?()
            }
        }
    }
    
    /**
     Zoom out any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomOutWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2, completion: (() -> Void)? = nil) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        
        UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }) { _ in
            UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseOut, animations: {
                self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            }) { _ in
                completion?()
            }
        }
    }
    
    func bounce(completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 2.0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            self.transform = .identity
            completion?()
        }
    }
    
    func fadeIn(duration: TimeInterval = 0.3, completion: (() -> Void)? = nil) {
        self.alpha = 0
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1
        }) { _ in
            completion?()
        }
    }
    
    func fadeOut(duration: TimeInterval = 0.3, completion: (() -> Void)? = nil) {
        self.alpha = 1
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0
        }) { _ in
            completion?()
        }
    }
    
}


