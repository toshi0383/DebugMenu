//
//  ToggleDebugItem.swift
//  DebugMenu
//
//  Created by Tomoya Hirano on 2020/12/18.
//

import Foundation

public struct ToggleDebugItem: DebugItem {
    public init(title: String, current: @escaping () -> Bool, onChange: @escaping (Bool) -> Void) {
        self.title = title
        self.action = .toggle(
            current: current,
            action: { (isOn, completions) in
                onChange(isOn)
                completions(.success())
            }
        )
    }

    let title: String
    public var debugItemTitle: String { title }
    public let action: DebugItemAction
}
