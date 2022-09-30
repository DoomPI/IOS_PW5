//
//  UIViewPin.swift
//  rslomtevPW3
//
//  Created by Роман Ломтев on 23.09.2022.
//

import UIKit

extension UIView {
    
    enum PinnedSide {
        case top
        case bottom
        case left
        case right
        case leading
        case trailing
    }
    
    func pin(to superview : UIView, _ sides: PinnedSide...) {
        translatesAutoresizingMaskIntoConstraints = false
        for pinnedSide in sides {
            switch pinnedSide {
            case .top:
                pinTop(to: superview)
            case .bottom:
                pinBottom(to: superview)
            case .leading:
                pinLeading(to: superview)
            case .trailing:
                pinTrailing(to: superview)
            case .left:
                pinLeft(to: superview)
            case .right:
                pinRight(to: superview)
            }
        }
    }
    
    func pin(to superview : UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        pinTop(to: superview)
        pinLeft(to: superview)
        pinRight(to: superview)
        pinBottom(to: superview)
    }
    
    func pin(to superView: UIView, _ sides: [PinnedSide: Double]) {
        translatesAutoresizingMaskIntoConstraints = false
        for side in sides {
            switch side.key {
            case .top:
                pinTop(to: superView, side.value)
            case .left:
                pinLeft(to: superView, side.value)
            case .right:
                pinRight(to: superView, side.value)
            case .bottom:
                pinBottom(to: superView, side.value)
            case .leading:
                pinLeading(to: superView, side.value)
            case .trailing:
                pinTrailing(to: superView, side.value)
            }
        }
    }
    
    func pinCenter(to superview: UIView) {
        pinCenterX(to: superview)
        pinCenterY(to: superview)
    }
    
    @discardableResult
    func pinCenterX(to superview: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinCenterY(to superview: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinLeading(to superview : UIView, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(
            equalTo: superview.leadingAnchor,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinLeading(to side: NSLayoutXAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leadingAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinTrailing(to superview: UIView, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(
            equalTo: superview.trailingAnchor,
            constant: CGFloat(const * -1)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinTrailing(to side: NSLayoutXAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = trailingAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const * -1)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinLeft(to superview: UIView, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leftAnchor.constraint(
            equalTo: superview.leftAnchor,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinLeft(to side: NSLayoutXAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = leftAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinRight(to superview: UIView, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = rightAnchor.constraint(
            equalTo: superview.rightAnchor,
            constant: CGFloat(const * -1)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinRight(to side: NSLayoutXAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = rightAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const * -1)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinTop(to superview : UIView, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(
            equalTo: superview.topAnchor,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinTop(to side: NSLayoutYAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = topAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinBottom(to superview : UIView, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(
            equalTo: superview.bottomAnchor,
            constant: CGFloat(const * -1)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinBottom(to side: NSLayoutYAxisAnchor, _ const: Double = 0) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = bottomAnchor.constraint(
            equalTo: side,
            constant: CGFloat(const * -1)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinHeight(to superview: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraint(
            equalTo: superview.heightAnchor
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinHeight(to side: NSLayoutDimension) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraint(
            equalTo: side
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinHeight(with constant: Double) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = heightAnchor.constraint(
            equalToConstant: CGFloat(constant)
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinWidth(to superview: UIView) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraint(
            equalTo: superview.widthAnchor
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinWidth(to side: NSLayoutDimension) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraint(
            equalTo: side
        )
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func pinWidth(with constant: Double) -> NSLayoutConstraint {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint = widthAnchor.constraint(equalToConstant: CGFloat(constant))
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    func setHeight(to height: Double) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: CGFloat(height))
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func setWidth(to width: Double) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalToConstant: CGFloat(width))
        constraint.isActive = true
        return constraint
    }
}

