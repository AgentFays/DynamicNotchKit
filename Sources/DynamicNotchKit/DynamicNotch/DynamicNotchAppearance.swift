//
//  DynamicNotchAppearance.swift
//  DynamicNotchKit
//
//  Created by Halo on 2026-11-19.
//

import SwiftUI

/// Appearance options for the window chrome drawn by ``DynamicNotch``.
///
/// The defaults reproduce the stock look exactly (opaque black notch, 15 pt content
/// insets, system material when floating, drop shadow), so existing code is unaffected.
///
/// Set the options on ``DynamicNotch/appearance`` before the notch is first presented:
/// ```swift
/// let notch = DynamicNotch(style: .notch) { MyGlassPanel() }
/// notch.appearance = DynamicNotchAppearance(
///     background: .transparent,
///     contentInsets: 0,
///     usesSystemMaterialWhenFloating: false
/// )
/// ```
public struct DynamicNotchAppearance: Sendable {
    /// What is drawn behind the content, in notch style.
    public enum Background: Sendable {
        /// Stock behaviour: an opaque black fill under the whole ``NotchShape``.
        case opaque

        /// Transparent chrome: only the hardware-notch band (the top strip, as tall as the notch /
        /// menu bar) stays black so the shape still grows out of the notch. Everything below is
        /// left to the expanded content, which can draw its own material (glass, blur…).
        /// In the compact and hidden states the whole shape stays black, as in ``opaque``.
        case transparent

        /// A custom fill under the whole shape, e.g. `.custom(AnyShapeStyle(.ultraThinMaterial))`.
        case custom(AnyShapeStyle)
    }

    /// Fill behind the content in notch style. Default: ``Background/opaque``.
    public var background: Background

    /// Padding applied around the expanded content on every side (the top edge additionally gets
    /// the notch height in notch style). Default: 15, the stock value.
    public var contentInsets: CGFloat

    /// In floating style, wrap the content in the kit's own `.popover` material with a hairline
    /// border. Set to `false` when the content provides its own material. Default: `true`.
    public var usesSystemMaterialWhenFloating: Bool

    /// Draw the kit's drop shadow around the whole shape. Default: `true`.
    public var showsShadow: Bool

    public init(
        background: Background = .opaque,
        contentInsets: CGFloat = 15,
        usesSystemMaterialWhenFloating: Bool = true,
        showsShadow: Bool = true
    ) {
        self.background = background
        self.contentInsets = contentInsets
        self.usesSystemMaterialWhenFloating = usesSystemMaterialWhenFloating
        self.showsShadow = showsShadow
    }

    /// The stock appearance.
    public static let `default` = DynamicNotchAppearance()
}
