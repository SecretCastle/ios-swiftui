//
//  CircleImage.swift
//  iLocation
//
//  Created by SecretCastle on 2019/12/24.
//  Copyright © 2019 SecretCastle. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
  var image: Image
  var body: some View {
    image
      .frame(width: 200, height: 200)
      .clipShape(Circle())
      .overlay(Circle().stroke(Color.white, lineWidth: 4))
      .shadow(radius: 10)
  }
}

struct CircleImage_Previews: PreviewProvider {
  static var previews: some View {
    CircleImage(image: Image("mountain"))
  }
}
