import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark]{
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            VStack {
              
                VStack {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                    }
                    .padding() // Adding padding around the toggle
                }
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.vertical)
                
                List {
                    ForEach(filteredLandmarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                                .padding(.bottom)
                        }
                    }
                }
                .animation(.default, value: filteredLandmarks)
                .navigationTitle("Landmarks")
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
