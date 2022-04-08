//
//  DocumentListViewModel.swift
//  DocumentPrototype
//
//  Created by Joseph Lauletta on 4/7/22.
//

import Combine
import Foundation

final class DocumentListViewModel: ObservableObject {
    
    private let documentSelectionAction: ((Document) -> Void)?
    
    init(documentSelectionAction: ((Document) -> Void)?) {
        self.documentSelectionAction = documentSelectionAction
    }

    var documents = [
        Document(title: "Apple Developer Agreement", format: .pdf, url: Bundle.main.url(forResource: "Apple-Developer-Agreement-20211213-English", withExtension: "pdf")!),
        Document(title: "Xcode and Apple SDKs Agreement", format: .pdf, url: Bundle.main.url(forResource: "xcode", withExtension: "pdf")!),
        Document(title: "Apple Developer Forums Agreement", format: .pdf, url: Bundle.main.url(forResource: "Apple-Developer-Forums-Agreement-20200618-English", withExtension: "pdf")!),
        Document(title: "Lorem Ipsum", format: .docx, url: Bundle.main.url(forResource: "LoremIpsumDocx", withExtension: "docx")!),
        Document(title: "Lorem Ipsum", format: .doc, url: Bundle.main.url(forResource: "LoremIpsumDoc", withExtension: "doc")!),
    ]

    func didSelect(document: Document) {
        documentSelectionAction?(document)
    }
}
