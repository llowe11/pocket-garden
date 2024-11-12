
import SwiftUI

struct ContentView: View {
        var body: some View {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                        ForEach(flowers) { flower in
                            NavigationLink(destination: flowerDetailView(flower: flower)) {
                                VStack {
                                    flower.image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 120, height: 120)
                                        .clipShape(Circle())
                                        .shadow(radius: 5)
                                    Text(flower.name)
                                        .font(.headline)
                                        .padding(.top, 5)
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(Color.black)
                                        
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Комнатные растения")
            }
        }
    }


#Preview {
    ContentView()
}
