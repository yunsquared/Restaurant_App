//
//  filterCollectionViewCell.swift
//  yw458_p5
//
//  Created by Yunyun S. Wang on 4/14/19.
//  Copyright © 2019 Yunyun S. Wang. All rights reserved.
//

import UIKit

class filterCollectionViewCell: UICollectionViewCell {
    
    var filterLabels: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        filterLabels = UILabel()
        filterLabels.translatesAutoresizingMaskIntoConstraints = false
        filterLabels.contentMode = .scaleAspectFit
        contentView.addSubview(filterLabels)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterLabels.topAnchor.constraint(equalTo: contentView.topAnchor),
            filterLabels.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            filterLabels.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            filterLabels.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        
    }
    
    func configure(Name: FoodStyleEnum) {


        filterLabels.text = Name.rawValue


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
