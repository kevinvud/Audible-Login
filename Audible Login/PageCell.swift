//
//  PageCell.swift
//  Audible Login
//
//  Created by PoGo on 10/20/17.
//  Copyright © 2017 PoGo. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "page1")
        iv.clipsToBounds = true
        return iv
        
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
        
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
}
