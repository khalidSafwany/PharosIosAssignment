//
//  ImageService.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/21/22.
//

import Foundation

final class ImageService {
    
    
        
        // MARK: - Private functions
        private static func getData(url: URL,
                                    completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
        
        // MARK: - Public function
        
       
        public static func downloadImage(url: URL,
                                         completion: @escaping (Result<Data>) -> Void) {
            ImageService.getData(url: url) { data, response, error in
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data, error == nil else {
                    return
                }
                
                DispatchQueue.main.async() {
                    completion(.success(data))
                }
            }
        }
    }
    
public enum Result<T> {
    case success(T)
    case failure(Error)
}
