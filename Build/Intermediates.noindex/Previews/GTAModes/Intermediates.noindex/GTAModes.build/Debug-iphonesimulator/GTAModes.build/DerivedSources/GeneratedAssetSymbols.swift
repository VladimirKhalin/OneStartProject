import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

    /// The "backOne" asset catalog color resource.
    static let backOne = ColorResource(name: "backOne", bundle: resourceBundle)

    /// The "backThree" asset catalog color resource.
    static let backThree = ColorResource(name: "backThree", bundle: resourceBundle)

    /// The "backTwo" asset catalog color resource.
    static let backTwo = ColorResource(name: "backTwo", bundle: resourceBundle)

    /// The "blueColor" asset catalog color resource.
    static let blue = ColorResource(name: "blueColor", bundle: resourceBundle)

    /// The "blueLight" asset catalog color resource.
    static let blueLight = ColorResource(name: "blueLight", bundle: resourceBundle)

    /// The "cellLineColor" asset catalog color resource.
    static let cellLine = ColorResource(name: "cellLineColor", bundle: resourceBundle)

    /// The "checkCellBlue" asset catalog color resource.
    static let checkCellBlue = ColorResource(name: "checkCellBlue", bundle: resourceBundle)

    /// The "greenColor" asset catalog color resource.
    static let green = ColorResource(name: "greenColor", bundle: resourceBundle)

    /// The "mainBlackColor" asset catalog color resource.
    static let mainBlack = ColorResource(name: "mainBlackColor", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "WaterBackground" asset catalog image resource.
    static let waterBackground = ImageResource(name: "WaterBackground", bundle: resourceBundle)

    /// The "backIcon" asset catalog image resource.
    static let backIcon = ImageResource(name: "backIcon", bundle: resourceBundle)

    /// The "backToMainIcon" asset catalog image resource.
    static let backToMainIcon = ImageResource(name: "backToMainIcon", bundle: resourceBundle)

    /// The "bg" asset catalog image resource.
    static let bg = ImageResource(name: "bg", bundle: resourceBundle)

    /// The "checkIcon" asset catalog image resource.
    static let checkIcon = ImageResource(name: "checkIcon", bundle: resourceBundle)

    /// The "closeIcon" asset catalog image resource.
    static let closeIcon = ImageResource(name: "closeIcon", bundle: resourceBundle)

    /// The "downloadIcon" asset catalog image resource.
    static let downloadIcon = ImageResource(name: "downloadIcon", bundle: resourceBundle)

    /// The "fav" asset catalog image resource.
    static let fav = ImageResource(name: "fav", bundle: resourceBundle)

    /// The "favoriteNoIcon" asset catalog image resource.
    static let favoriteNoIcon = ImageResource(name: "favoriteNoIcon", bundle: resourceBundle)

    /// The "favoriteYesIcon" asset catalog image resource.
    static let favoriteYesIcon = ImageResource(name: "favoriteYesIcon", bundle: resourceBundle)

    /// The "filterIcon" asset catalog image resource.
    static let filterIcon = ImageResource(name: "filterIcon", bundle: resourceBundle)

    /// The "lockIcon" asset catalog image resource.
    static let lockIcon = ImageResource(name: "lockIcon", bundle: resourceBundle)

    /// The "longCellIcon" asset catalog image resource.
    static let longCellIcon = ImageResource(name: "longCellIcon", bundle: resourceBundle)

    /// The "m_a" asset catalog image resource.
    static let mA = ImageResource(name: "m_a", bundle: resourceBundle)

    /// The "m_b" asset catalog image resource.
    static let mB = ImageResource(name: "m_b", bundle: resourceBundle)

    /// The "m_down" asset catalog image resource.
    static let mDown = ImageResource(name: "m_down", bundle: resourceBundle)

    /// The "m_lb" asset catalog image resource.
    static let mLb = ImageResource(name: "m_lb", bundle: resourceBundle)

    /// The "m_left" asset catalog image resource.
    static let mLeft = ImageResource(name: "m_left", bundle: resourceBundle)

    /// The "m_lt" asset catalog image resource.
    static let mLt = ImageResource(name: "m_lt", bundle: resourceBundle)

    /// The "m_rb" asset catalog image resource.
    static let mRb = ImageResource(name: "m_rb", bundle: resourceBundle)

    /// The "m_right" asset catalog image resource.
    static let mRight = ImageResource(name: "m_right", bundle: resourceBundle)

    /// The "m_rt" asset catalog image resource.
    static let mRt = ImageResource(name: "m_rt", bundle: resourceBundle)

    /// The "m_up" asset catalog image resource.
    static let mUp = ImageResource(name: "m_up", bundle: resourceBundle)

    /// The "m_x" asset catalog image resource.
    static let mX = ImageResource(name: "m_x", bundle: resourceBundle)

    /// The "m_y" asset catalog image resource.
    static let mY = ImageResource(name: "m_y", bundle: resourceBundle)

    /// The "rightIcon" asset catalog image resource.
    static let rightIcon = ImageResource(name: "rightIcon", bundle: resourceBundle)

    /// The "s_circle" asset catalog image resource.
    static let sCircle = ImageResource(name: "s_circle", bundle: resourceBundle)

    /// The "s_cross" asset catalog image resource.
    static let sCross = ImageResource(name: "s_cross", bundle: resourceBundle)

    /// The "s_down" asset catalog image resource.
    static let sDown = ImageResource(name: "s_down", bundle: resourceBundle)

    /// The "s_l1" asset catalog image resource.
    static let sL1 = ImageResource(name: "s_l1", bundle: resourceBundle)

    /// The "s_l2" asset catalog image resource.
    static let sL2 = ImageResource(name: "s_l2", bundle: resourceBundle)

    /// The "s_left" asset catalog image resource.
    static let sLeft = ImageResource(name: "s_left", bundle: resourceBundle)

    /// The "s_r1" asset catalog image resource.
    static let sR1 = ImageResource(name: "s_r1", bundle: resourceBundle)

    /// The "s_r2" asset catalog image resource.
    static let sR2 = ImageResource(name: "s_r2", bundle: resourceBundle)

    /// The "s_right" asset catalog image resource.
    static let sRight = ImageResource(name: "s_right", bundle: resourceBundle)

    /// The "s_square" asset catalog image resource.
    static let sSquare = ImageResource(name: "s_square", bundle: resourceBundle)

    /// The "s_triangle" asset catalog image resource.
    static let sTriangle = ImageResource(name: "s_triangle", bundle: resourceBundle)

    /// The "s_up" asset catalog image resource.
    static let sUp = ImageResource(name: "s_up", bundle: resourceBundle)

    /// The "searchIcon" asset catalog image resource.
    static let searchIcon = ImageResource(name: "searchIcon", bundle: resourceBundle)

    /// The "shareIcon" asset catalog image resource.
    static let shareIcon = ImageResource(name: "shareIcon", bundle: resourceBundle)

    /// The "shotCellIcon" asset catalog image resource.
    static let shotCellIcon = ImageResource(name: "shotCellIcon", bundle: resourceBundle)

    /// The "sony" asset catalog image resource.
    static let sony = ImageResource(name: "sony", bundle: resourceBundle)

    /// The "win" asset catalog image resource.
    static let win = ImageResource(name: "win", bundle: resourceBundle)

    /// The "xbox" asset catalog image resource.
    static let xbox = ImageResource(name: "xbox", bundle: resourceBundle)

}

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Hashable {

    /// An asset catalog color resource name.
    fileprivate let name: String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Hashable {

    /// An asset catalog image resource name.
    fileprivate let name: String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif