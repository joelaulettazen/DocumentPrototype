//
//  Document.swift
//  DocumentPrototype
//
//  Created by Joseph Lauletta on 4/7/22.
//

import Foundation

struct Document: Identifiable, Equatable {
    enum Format {
        case pdf, docx, doc

        var description: String {
            switch self {
            case .pdf: return "PDF"
            case .docx: return "Word Docx"
            case .doc: return "Word Doc"
            }
        }
    }

    let id = UUID()
    let title: String
    let format: Format
    let url: URL
}

