//
//  MapObject.swift
//  PharosIosAssignment
//
//  Created by Khalid hassan on 8/21/22.
//

import Foundation
import MapKit

class MapObject: NSObject, MKAnnotation {
  let title: String?
  let subtitle: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    subtitle: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.subtitle = subtitle
    self.coordinate = coordinate

    super.init()
  }
}
  
