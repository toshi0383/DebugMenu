//
//  CaseSelectableDebugItem.swift
//  App
//
//  Created by Tomoya Hirano on 2020/05/14.
//

import UIKit

public struct CaseSelectableDebugItem<T: CaseIterable & RawRepresentable>: DebugItem
where T.RawValue: Equatable {
    public init(currentValue: T, didSelected: @escaping (T) -> Void) {
        self.action = .didSelect { (controller, completions) in
            let vc = CaseSelectableTableController<T>(
                currentValue: currentValue,
                didSelected: didSelected
            )
            controller.navigationController?.pushViewController(vc, animated: true)
        }
    }
    public var debugItemTitle: String { String(describing: T.self) }
    public let action: DebugItemAction
}
