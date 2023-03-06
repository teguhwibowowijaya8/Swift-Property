//
//  UILabel+TextWithAttachment.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit

extension UILabel {
    func textWithAttachment(text: String, imageName: String) {
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: imageName)
        
        let textAttachment = NSMutableAttributedString(attachment: attachment)
        textAttachment.append(NSAttributedString(string: " \(text)"))
        
        self.attributedText = textAttachment
        self.textColor = MainColor.silver
        self.font = TextSize.detail
    }
}
