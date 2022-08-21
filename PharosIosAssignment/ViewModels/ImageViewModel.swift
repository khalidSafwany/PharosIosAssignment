//
//  ImageViewModel.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/21/22.
//

import UIKit

class ImageViewModel: NSObject {
    
    private var imageService: ImageService?
    private var image: UIImage?{
        
        didSet{
            bindViewModelSuccessToImageView()
        }
    }
    
    var bindViewModelSuccessToImageView : (()->()) = {}
    var bindViewModelErrorToImageView : (()->()) = {}
    
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToImageView()
        }
        
    }
    
    
    override init() {
        imageService = ImageService()
    }
    
    func getImage()->UIImage{
        
        image ?? UIImage()
    }

    
    func downlaodImage(cityName: String){
        
        imageService?.downloadImage(url: cityName,  completion: { [weak self] returnedData, error in
                                    if let error : Error = error{
                                        
                                        let message = error.localizedDescription
                                        self?.showError = message
                                    }else{
                                        
                                        self?.image = UIImage(data: returnedData!)
                                        
                                    }
                                    
                                    
                                    
                                })
        
    }
        
}
