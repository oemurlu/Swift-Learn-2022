//
//  CourseCell.swift
//  Test-Course-App
//
//  Created by Osman Emre Ömürlü on 6.02.2024.
//

import UIKit

class CourseCell: UITableViewCell {

    static let reuseID = "cell"
    var nameLabel: UILabel!
    var detailLabel: UILabel!
    
    private let padding: CGFloat = 16
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureNameLabel()
        configureDetailLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(course: Course) {
        nameLabel.text = course._name
        
        if course._numberOfLessons > 30 {
            detailLabel.text = "Lessons 30+ Check it out!"
            accessoryType = .detailDisclosureButton
        } else {
            detailLabel.text = "Lessons: \(course._numberOfLessons)"
            accessoryType = .none
        }
    }
    
    private func configureNameLabel() {
        nameLabel = UILabel(frame: .zero)
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding)
        ])
        
    }
    
    private func configureDetailLabel() {
        detailLabel = UILabel(frame: .zero)
        addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        detailLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        NSLayoutConstraint.activate([
            detailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            detailLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding / 2),
            detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding / 2)
        ])
        
    }

}
