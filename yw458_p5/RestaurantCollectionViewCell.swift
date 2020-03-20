//
//  RestaurantCollectionViewCell.swift
//  yw458_p5
//
//  Created by Yunyun S. Wang on 4/11/19.
//  Copyright © 2019 Yunyun S. Wang. All rights reserved.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell { //set up views in cell
    
    var photoImageView: UIImageView!
    var restaurantNameLabel: UILabel!
    var foodStyleLabel: UILabel!
    var priceLabel: UILabel!
    
    let picHeight: CGFloat = 50
    let picWidth: CGFloat = 50
    let padding: CGFloat = 10
    let labelHeight: CGFloat = 12
    
    //let stringFoodStyle = " ".join(FoodStyleEnum)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        photoImageView = UIImageView(frame: .zero)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        contentView.addSubview(photoImageView)
        
        //restaurantNameLabel
        restaurantNameLabel = UILabel()
        restaurantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantNameLabel.font = UIFont.systemFont(ofSize: 12)
        contentView.addSubview(restaurantNameLabel)
        
        //foodStyleLabel
        foodStyleLabel = UILabel()
        foodStyleLabel.translatesAutoresizingMaskIntoConstraints = false
        foodStyleLabel.font = UIFont.systemFont(ofSize: 12)
        contentView.addSubview(foodStyleLabel)
        
        //priceLabel
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 12)
        contentView.addSubview(priceLabel)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: picWidth),
            photoImageView.heightAnchor.constraint(equalToConstant: picHeight)
            ])
        
        NSLayoutConstraint.activate([
            //restaurantNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            restaurantNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: padding),
            restaurantNameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: padding),
            restaurantNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            foodStyleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: padding),
            foodStyleLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: padding),
            foodStyleLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: padding),
            priceLabel.topAnchor.constraint(equalTo: foodStyleLabel.bottomAnchor, constant: padding),
            priceLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
    }
    
    func configure(for restaurant: Restaurant) {
        photoImageView.image = restaurant.displayImage
        restaurantNameLabel.text = restaurant.restaurantName
        foodStyleLabel.text = restaurant.foodStyle2.joined(separator: ", ")
        priceLabel.text = restaurant.price
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
