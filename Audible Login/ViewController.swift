//
//  ViewController.swift
//  Audible Login
//
//  Created by PoGo on 10/20/17.
//  Copyright © 2017 PoGo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let cellId = "cellId"
    let loginCellId = "loginCellId"
    
    let pages: [Page] = {
        
        let firstPage = Page(title: "Share a great listen", message: "It's free to send your books to the people in your life. Every recipient's first book is on us.", imageName: "page1")
        
        let secondPage = Page(title: "Send from your library", message: "Tap the More menu next to any book. Choose \"Send this Book\"", imageName: "page2")
        
        let thirdPage = Page(title: "Send from the player", message: "Tap the More menu in the upper corner. Choose \"Send this Book\"", imageName: "page3")
        
        return [firstPage, secondPage, thirdPage]
    }()
    
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.white
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
        
        
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = UIColor.lightGray
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = UIColor(displayP3Red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        pc.numberOfPages = self.pages.count + 1
        return pc
    }()
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.backgroundColor = UIColor.brown
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = UIColor.brown
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        pageControl.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageControl.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pageControlBottomAnchor = pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        pageControlBottomAnchor?.isActive = true
        
        skipButtonTopAnchor = skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        skipButtonTopAnchor?.isActive = true
        skipButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        skipButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        nextButtonTopAnchor = nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        nextButtonTopAnchor?.isActive = true
        nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        registerCells()
        
        
    }
    
    private func registerCells(){
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: loginCellId)

    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        if pageNumber == pages.count{
            pageControlBottomAnchor?.constant = 40
            nextButtonTopAnchor?.constant = -100
            skipButtonTopAnchor?.constant = -100
        }else{
            pageControlBottomAnchor?.constant = -10
            nextButtonTopAnchor?.constant = 50
            skipButtonTopAnchor?.constant = 50
        }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == pages.count {
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath)
            return loginCell
        }
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? PageCell{
            let page = pages[indexPath.row]
            cell.page = page
            return cell
            
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}

