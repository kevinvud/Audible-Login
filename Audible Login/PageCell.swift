//
//  PageCell.swift
//  Audible Login
//
//  Created by PoGo on 10/20/17.
//  Copyright © 2017 PoGo. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page?{
        didSet{
            guard let page = page else {
                return
            }
            
            var imageName = page.imageName
            if UIDevice.current.orientation.isLandscape {
                imageName += "_landscape"
            }
             imageView.image = UIImage(named: imageName)
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor: color])
            
            let bottomText = NSMutableAttributedString(string: "\n\n\(page.message)", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: color])

            attributedText.append(bottomText)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.characters.count
            
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
                
            textView.attributedText = attributedText
            
        }
        
        
    }
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        return iv
        
    }()
    
    let textView: UITextView = {
       let tv = UITextView()
        tv.isEditable = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.contentInset = UIEdgeInsetsMake(24, 0, 0, 0)
        return tv
        
    }()
    
    let lineSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Fatal error")
    }
    
    func setupViews(){
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparator)
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        textView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        textView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        lineSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineSeparator.bottomAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        lineSeparator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lineSeparator.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
        
    }
    
}
