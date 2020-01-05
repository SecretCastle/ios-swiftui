//
//  ContentView.swift
//  iLocation
//
//  Created by SecretCastle on 2019/12/24.
//  Copyright © 2019 SecretCastle. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
  @EnvironmentObject var userData: UserData
  var landmark: Landmark
  
  var landmarkIndex: Int {
    userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
  }
  
  var body: some View {
    VStack {
      MapView(coordinate: landmark.locationCoordinate)
        .edgesIgnoringSafeArea(.top)
        .frame(height: 300)
      CircleImage(image: landmark.image)
        .offset(y: -100)
        .padding(.bottom, -100)
      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
          Button(action: {
            self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
          }) {
            if self.userData.landmarks[self.landmarkIndex].isFavorite {
              Image(systemName: "star.fill").foregroundColor(.yellow)
            } else {
              Image(systemName: "star").foregroundColor(Color.gray)
            }
          }
        }
        HStack {
          Text(landmark.park)
            .font(.subheadline)
          Spacer()
          Text(landmark.state)
            .font(.subheadline)
        }
      }
      .padding(10)
      Spacer()
    }
    .navigationBarTitle(Text(landmark.name), displayMode: .inline)
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkDetail(landmark: landmarkData[0])
      .environmentObject(UserData())
  }
}
