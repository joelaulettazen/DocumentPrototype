//
//  QuickLookPreview.swift
//  DocumentPrototype
//
//  Created by Joseph Lauletta on 4/8/22.
//

import UIKit
import QuickLook

final class QuickLookPreview: QLPreviewController {
    private let previewDataSource: QLPreviewControllerDataSource
    
    init(previewDataSource: QLPreviewControllerDataSource) {
        self.previewDataSource = previewDataSource
        super.init(nibName: nil, bundle: nil)
        configurePreview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurePreview() {
        self.dataSource = previewDataSource
        self.delegate = self
    }
}

extension QuickLookPreview: QLPreviewControllerDelegate {
    func previewController(_ controller: QLPreviewController, editingModeFor previewItem: QLPreviewItem) -> QLPreviewItemEditingMode {
        .disabled
    }
}
