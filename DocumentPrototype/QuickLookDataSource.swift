//
//  QuickLookDataSource.swift
//  DocumentPrototype
//
//  Created by Joseph Lauletta on 4/7/22.
//

import QuickLook

final class QuickLookDataSource: QLPreviewControllerDataSource {
    private let documentURL: URL
    
    init(documentURL: URL) {
        self.documentURL = documentURL
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int { 1 }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        documentURL as QLPreviewItem
    }
}
