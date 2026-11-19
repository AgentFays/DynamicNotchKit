# Halo fork — `halo-transparent-background`

Fork of [MrKai77/DynamicNotchKit](https://github.com/MrKai77/DynamicNotchKit) (MIT), branched from 1.1.0 (`cd0b3e5`), used by the Halo macOS app.

**What the patch adds** — one additive, backward-compatible option set, `DynamicNotch.appearance: DynamicNotchAppearance`:

- `background: .opaque | .transparent | .custom(AnyShapeStyle)` — in notch style, `.transparent` keeps black only in the hardware-notch band (expanded state) so the content can draw its own glass that shows the desktop; compact/hidden states stay fully black. Stock `.opaque` by default.
- `contentInsets` — the padding around the expanded content (was a hard-coded 15 pt; Halo uses 0).
- `usesSystemMaterialWhenFloating` — set `false` to drop the kit's `.popover` material, hairline and clip in floating style when the content brings its own material.
- `showsShadow` — turn off the kit's drop shadow around the shape.

Touched files: `DynamicNotch/DynamicNotchAppearance.swift` (new), `DynamicNotch/DynamicNotch.swift`, `Views/NotchView.swift`, `Views/NotchlessView.swift`, `Views/NotchContentView.swift`. All defaults reproduce upstream behaviour exactly; the `NotchShape` mask is unchanged and still clips everything.
