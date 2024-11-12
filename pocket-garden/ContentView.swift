import SwiftUI

struct ContentView: View {
    @State private var showInfoModal = false
    
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
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
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
            .navigationTitle("PhytoSmart 🪴")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("NIS TARAZ")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showInfoModal.toggle()
                    }) {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .sheet(isPresented: $showInfoModal) {
            InfoModalView()
        }
    }
}

#Preview {
    ContentView()
}
