//
//  DocumentList.swift
//  DocumentPrototype
//
//  Created by Joseph Lauletta on 4/7/22.
//

import UIKit

final class DocumentList: UIViewController {
    private let viewModel: DocumentListViewModel
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(DocumentCell.self, forCellReuseIdentifier: DocumentCell.identifier)
        return table
    }()
    
    init(viewModel: DocumentListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViewController()
    }
    
    private func buildViewController() {
        configureNavigation()
        buildView()
    }
    
    private func configureNavigation() {
        title = "Document List"
    }
    
    private func buildView() {
        setViewAppearance()
        applySubviews()
        applySubviewConstraints()
    }
    
    private func setViewAppearance() {
        view.backgroundColor = UIColor.systemBackground
    }
    
    private func applySubviews() {
        view.addSubview(tableView)
    }
    
    private func applySubviewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension DocumentList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DocumentCell.identifier) as? DocumentCell else {
            return UITableViewCell()
        }
        let document = viewModel.documents[indexPath.row]
        
        cell.configure(
            documentTitle: document.title,
            documentFormatDescription: document.format.description
        )
        return cell
    }
}

extension DocumentList: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDocument = viewModel.documents[indexPath.row]
        viewModel.didSelect(document: selectedDocument)
    }
}

private extension DocumentCell {
    static var identifier: String {
        String(describing: self)
    }
}
