//
//  BordersCollectionView.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 19/03/21.
//

import UIKit

class BordersCollectionView: UICollectionView {
    
    var cnsWidth: NSLayoutConstraint?
    
    private var borders: [String] = []
    
    override var contentSize: CGSize {
        didSet {
            cnsWidth?.constant = contentSize.width
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupCollection()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollection()
    }
    
    private func setupCollection() {
        register(UINib(nibName: "BorderCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: BorderCollectionViewCell.idCell)
        dataSource = self
    }
    
    func setBordersData(bordersData: [String]) {
        self.borders = bordersData
        reloadData()
    }

}

extension BordersCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return borders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BorderCollectionViewCell.idCell, for: indexPath) as? BorderCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupCell(countryCode: borders[indexPath.row]) 
        
        return cell
    }
    
}


