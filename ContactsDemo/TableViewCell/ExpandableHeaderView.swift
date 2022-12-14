//
//  ExpandableHeaderView.swift
//  ContactsDemo
//
//  Created by ALEKSEY SUSLOV on 10.08.2022.
//

import UIKit

class ExpandableHeaderView: UITableViewHeaderFooterView {
    var delegate: ExpandableHederViewDelegate?
    var sectionIndex: Int?
    
    convenience init(title: String, sectionIndex: Int, delegate: ExpandableHederViewDelegate) {
        self.init()
        self.delegate = delegate
        self.sectionIndex = sectionIndex
        
        var content = defaultContentConfiguration()
        content.text = title
        content.textProperties.color = .white
        contentConfiguration = content
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction))
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .darkGray
    }
    
    @objc private func selectHeaderAction(gesterRecognizer: UITapGestureRecognizer) {
        guard let headerView = gesterRecognizer.view as? ExpandableHeaderView else { return }
        guard let sectionIndex = headerView.sectionIndex else { return }
        delegate?.toggle(sectionIndex: sectionIndex)
    }
}
    