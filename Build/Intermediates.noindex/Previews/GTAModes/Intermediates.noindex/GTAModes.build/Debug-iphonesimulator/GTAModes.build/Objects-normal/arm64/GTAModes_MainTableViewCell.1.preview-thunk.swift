@_private(sourceFile: "GTAModes_MainTableViewCell.swift") import GTAModes
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import Foundation
import Kingfisher
import UIKit

extension GTAModes_MainTableViewCell {
    @_dynamicReplacement(for: gta_setupLayout()) private func __preview__gta_setupLayout() {
        #sourceLocation(file: "/Users/vladimirkhalin/Downloads/iOS-Mods-for-GTA-5-REF--PROJECT-300-main/GTAModes/GTAModes/Common/UI/Cells/MainTableViewCell/GTAModes_MainTableViewCell.swift", line: 64)
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.gta_layout {
            $0.top.equal(to: contentView.topAnchor, offsetBy: __designTimeFloat("#142268.[3].[13].[2].modifier[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: 6.0))
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: __designTimeFloat("#142268.[3].[13].[2].modifier[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: -6.0))
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: __designTimeFloat("#142268.[3].[13].[2].modifier[0].arg[0].value.[2].modifier[0].arg[1].value", fallback: 20.0))
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: __designTimeFloat("#142268.[3].[13].[2].modifier[0].arg[0].value.[3].modifier[0].arg[1].value", fallback: -20.0))
        }
        containerView.withCornerRadius()
        containerView.backgroundColor = .clear
        
        containerView.addSubview(backgroundImageView)
        backgroundImageView.gta_layout {
            $0.top.equal(to: containerView.topAnchor)
            $0.bottom.equal(to: containerView.bottomAnchor)
            $0.leading.equal(to: containerView.leadingAnchor)
            $0.trailing.equal(to: containerView.trailingAnchor)
        }
        
//        backgroundImageView.addSubview(bottomBlackView)
//        bottomBlackView.gta_layout {
//            $0.bottom.equal(to: backgroundImageView.bottomAnchor)
//            $0.leading.equal(to: backgroundImageView.leadingAnchor)
//            $0.trailing.equal(to: backgroundImageView.trailingAnchor)
//            $0.height.equal(to: 60.0)
//        }
//        let blurEffect = UIBlurEffect(style: .light)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.alpha = 0.5
//        blurEffectView.frame = bottomBlackView.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        bottomBlackView.addSubview(blurEffectView)
//        
//        bottomBlackView.backgroundColor = UIColor(named: "mainBlackColor")?.withAlphaComponent(0.5)
        
        bottomBlackView.addSubview(lockImageView)
        lockImageView.gta_layout {
            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: __designTimeFloat("#142268.[3].[13].[8].modifier[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: -12.0))
            $0.leading.equal(to: bottomBlackView.leadingAnchor, offsetBy: __designTimeFloat("#142268.[3].[13].[8].modifier[0].arg[0].value.[1].modifier[0].arg[1].value", fallback: 18.0))
            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: __designTimeFloat("#142268.[3].[13].[8].modifier[0].arg[0].value.[2].modifier[0].arg[1].value", fallback: 12.0))
            $0.height.equal(to: __designTimeFloat("#142268.[3].[13].[8].modifier[0].arg[0].value.[3].modifier[0].arg[0].value", fallback: 32.0))
            
            lockConstraints = [
                $0.width.equal(to: __designTimeFloat("#142268.[3].[13].[8].modifier[0].arg[0].value.[4].[0]", fallback: 32.0), isActive: __designTimeBoolean("#142268.[3].[13].[8].modifier[0].arg[0].value.[4].[1]", fallback: false))
            ]
            
            notLockConstraints = [
                $0.width.equal(to: __designTimeFloat("#142268.[3].[13].[8].modifier[0].arg[0].value.[5].[0]", fallback: 0.0), isActive: __designTimeBoolean("#142268.[3].[13].[8].modifier[0].arg[0].value.[5].[1]", fallback: false))
            ]
            
        }
        lockImageView.contentMode = .scaleAspectFill
        
        
        
//        bottomBlackView.addSubview(titleLabel)
//        titleLabel.gta_layout {
//            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: -12.0)
//            $0.leading.equal(to: lockImageView.trailingAnchor, offsetBy: 8.0)
//            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: 12.0)
//        }
//        
//        bottomBlackView.addSubview(rightImageView)
//        rightImageView.gta_layout {
//            $0.bottom.equal(to: bottomBlackView.bottomAnchor, offsetBy: -12.0)
//            $0.trailing.equal(to: bottomBlackView.trailingAnchor, offsetBy: -18.0)
//            $0.top.equal(to: bottomBlackView.topAnchor, offsetBy: 12.0)
//            $0.height.equal(to: 30.0)
//            $0.width.equal(to: 30.0)
//        }
//        rightImageView.image = UIImage(named: "rightIcon")
//        containerView.bringSubviewToFront(bottomBlackView)
        
    
#sourceLocation()
    }
}

extension GTAModes_MainTableViewCell {
    @_dynamicReplacement(for: prepareForReuse()) private func __preview__prepareForReuse() {
        #sourceLocation(file: "/Users/vladimirkhalin/Downloads/iOS-Mods-for-GTA-5-REF--PROJECT-300-main/GTAModes/GTAModes/Common/UI/Cells/MainTableViewCell/GTAModes_MainTableViewCell.swift", line: 56)
        super.prepareForReuse()
        
        backgroundImageView.image = nil
        lockImageView.image = nil
        titleLabel.text = __designTimeString("#142268.[3].[12].[3].[0]", fallback: "")
    
#sourceLocation()
    }
}

extension GTAModes_MainTableViewCell {
    @_dynamicReplacement(for: gta_configure(_:fontSize:isLock:)) private func __preview__gta_configure(_ value: MainItem, fontSize: CGFloat, isLock: Bool) {
        #sourceLocation(file: "/Users/vladimirkhalin/Downloads/iOS-Mods-for-GTA-5-REF--PROJECT-300-main/GTAModes/GTAModes/Common/UI/Cells/MainTableViewCell/GTAModes_MainTableViewCell.swift", line: 40)
        titleLabel.text = value.title.uppercased()
        backgroundImageView.contentMode = .scaleAspectFill
        titleLabel.font = UIFont(name: __designTimeString("#142268.[3].[11].[2].[0]", fallback: "Inter-Bold"), size: fontSize)
        titleLabel.textColor = .white
        backgroundImageView.kf.setImage(with: URL(string: value.imagePath))
        if isLock {
            NSLayoutConstraint.deactivate(notLockConstraints)
            NSLayoutConstraint.activate(lockConstraints)
        } else {
            NSLayoutConstraint.deactivate(lockConstraints)
            NSLayoutConstraint.activate(notLockConstraints)
        }
        lockImageView.image = isLock ? UIImage(named: __designTimeString("#142268.[3].[11].[6].[0]", fallback: "lockIcon")) : nil
    
#sourceLocation()
    }
}

import class GTAModes.GTAModes_MainTableViewCell

