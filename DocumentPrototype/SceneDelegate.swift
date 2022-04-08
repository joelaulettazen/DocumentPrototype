//
//  SceneDelegate.swift
//  DocumentPrototype
//
//  Created by Joseph Lauletta on 4/7/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private lazy var rootNavController = UINavigationController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        routeToDocumentList()
        
        window?.rootViewController = rootNavController
        window?.makeKeyAndVisible()
    }
    
    // MARK: - Routing
    
    private func routeToDocumentList() {
        let documentList = composeDocumentList()
        rootNavController.pushViewController(documentList, animated: false)
    }
    
    private func routeToDocumentReader(for document: Document) {
        let documentReader = composeDocumentReader(for: document)
        rootNavController.pushViewController(documentReader, animated: true)
    }
    
    // MARK: - UI Composition
    
    private func composeDocumentList() -> UIViewController {
        let viewModel = DocumentListViewModel(documentSelectionAction: routeToDocumentReader(for:))
        return DocumentList(viewModel: viewModel)
    }
    
    private func composeDocumentReader(for document: Document) -> UIViewController {
        let previewDataSource = QuickLookDataSource(documentURL: document.url)
        let preview = QuickLookPreview(previewDataSource: previewDataSource)
        return preview
    }
}

