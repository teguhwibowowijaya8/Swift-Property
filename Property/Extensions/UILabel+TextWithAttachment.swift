//
//  UILabel+TextWithAttachment.swift
//  Property
//
//  Created by Teguh Wibowo Wijaya on 06/03/23.
//

import UIKit


enum ImageAttachmentType {
    case named
    case systemName
}

extension UILabel {
    func textWithAttachment(
        text: String,
        imageName: String,
        imageType: ImageAttachmentType = .named,
        font: UIFont = TextSize.detail
    ) {
        let attachment = NSTextAttachment()
        if imageType == .named { attachment.image = UIImage(named: imageName) }
        else {
            attachment.image = UIImage(systemName: imageName)
            attachment.image = attachment.image?.withTintColor(MainColor.silver)
        }
        
        let textAttachment = NSMutableAttributedString(attachment: attachment)
        textAttachment.append(NSAttributedString(string: " \(text)"))
        
        self.attributedText = textAttachment
        self.textColor = MainColor.silver
        self.font = TextSize.detail
    }
}
