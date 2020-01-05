//
//  LandmarkList.swift
//  iLocation
//
//  Created by SecretCastle on 2019/12/24.
//  Copyright © 2019 SecretCastle. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
  @EnvironmentObject var userData: UserData;
  
  var body: some View {
    NavigationView {
      List {
        Toggle(isOn: $userData.showFavoritesOnly) {
          Text("Favorite Only")
        }
        ForEach(userData.landmarks) { landmark in
          if !self.userData.showFavoritesOnly || landmark.isFavorite {
            NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
              LandmarkRow(landmark: landmark)
            }
          }
        }
      }
      .navigationBarTitle(Text("Landmarks"))
    }
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(["iPhone SE", "iPhone XS Max", "iPhone 11"], id: \.self) {deviceName in
      LandmarkList()
        .previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
    
  }
}
