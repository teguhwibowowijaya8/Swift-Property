//
//  TermPointTableViewCell.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 08/03/23.
//

import UIKit

class TermPointTableViewCell: UITableViewCell {
    
    static let identifier = "TermPointTableViewCell"
    
    private var point: String = ""
    private var pointAttributedString: NSAttributedString {
        return NSAttributedString(string: point, attributes: [
            .font: TextSize.title
        ])
    }
    
    private var pointDetail: String = ""
    private var pointDetailAttributedString: NSAttributedString {
        return NSAttributedString(string: "\n\n\(pointDetail)", attributes: [
            .font: TextSize.subTitle,
            .foregroundColor: MainColor.silver
        ])
    }
    
    
    private lazy var pointTextView: UITextView = {
        let pointTextView = UITextView()
        pointTextView.isEditable = false
        pointTextView.isSelectable = false
        pointTextView.isScrollEnabled = false
        pointTextView.backgroundColor = .clear
        pointTextView.translatesAutoresizingMaskIntoConstraints = false
        return pointTextView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureText(point: String, detail: String) {
        self.point = point
        self.pointDetail = detail
        
        let pointAttributedText = NSMutableAttributedString()
        pointAttributedText.append(pointAttributedString)
        pointAttributedText.append(pointDetailAttributedString)
        
        pointTextView.attributedText = pointAttributedText
    }

    func setupCell() {
        self.backgroundColor = .clear
        self.contentView.addSubview(pointTextView)
        
        NSLayoutConstraint.activate([
            pointTextView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            pointTextView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20),
            pointTextView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20),
            pointTextView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0)
        ])
    }
}
