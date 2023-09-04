//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by tb on 9/1/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var body: some View {
        ScrollView{
            VStack{
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    HStack{
                        Text(landmark.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        FavoriteButton(isSet: $modelData.landmarks[
                            modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
                        ].isFavorite)
                    }
                    
                    HStack{
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About \(landmark.name)")
                        .font(.title2)
                        .foregroundColor(.black)
                    Text(landmark.description)
                }
                .padding()
            }
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
        .environmentObject(ModelData())
}
