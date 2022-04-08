//
//  DocumentCell.swift
//  DocumentPrototype
//
//  Created by Joseph Lauletta on 4/7/22.
//

import UIKit

final class DocumentCell: UITableViewCell {
    private let documentImage: UIImageView = {
        let image = UIImageView(image: .init(systemName: "doc"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    private let infoStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildCell() {
        configureStacks()
        applySubviews()
        applySubviewConstraints()
    }
    
    private func configureStacks() {
        configureMainStack()
        configureInfoStack()
    }
    
    private func configureMainStack() {
        mainStack.addArrangedSubview(documentImage)
        mainStack.addArrangedSubview(infoStack)
    }
    
    private func configureInfoStack() {
        infoStack.addArrangedSubview(titleLabel)
        infoStack.addArrangedSubview(descriptionLabel)
    }
    
    private func applySubviews() {
        contentView.addSubview(mainStack)
    }
    
    private func applySubviewConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(documentTitle: String, documentFormatDescription: String) {
        titleLabel.text = documentTitle
        descriptionLabel.text = documentFormatDescription
    }
}
