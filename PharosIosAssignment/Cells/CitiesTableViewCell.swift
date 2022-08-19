//
//  CitiesTableViewCell.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/20/22.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        

        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCityNameLabelConstrains()
        setCityLocationImageConstrains()
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCityLocationImageConstrains(){
        contentView.addSubview(cityLocationImageView)
        cityLocationImageView.translatesAutoresizingMaskIntoConstraints = false
        cityLocationImageView.leadingAnchor.constraint(equalTo: CityCellNameLabel.trailingAnchor, constant: 8).isActive = true
        cityLocationImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 8).isActive = true
        cityLocationImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        cityLocationImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor,constant: -16).isActive = true
    }
    
    func setCityNameLabelConstrains(){
        contentView.addSubview(CityCellNameLabel)
        CityCellNameLabel.translatesAutoresizingMaskIntoConstraints = false
        CityCellNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        CityCellNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 8).isActive = true
        CityCellNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true
        CityCellNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9).isActive = true
    }
    

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    private let cityLocationImageView: UIImageView = {
       let image = UIImageView()
       
       return image
       
   }()
    
    private let CityCellNameLabel: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center

        
        return label
        
    }()
    
    
    func setMyDate(){
        
        self.CityCellNameLabel.text = "IAM A CELL"
        self.cityLocationImageView.image = UIImage(named: "PassportID")
    }

}
