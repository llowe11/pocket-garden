import SwiftUI
import Foundation
struct flowerDetailView: View {
    let flower: Flower
    @State private var roomSize: String = ""
    @State private var numberOfPlants: Int? = nil
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                flower.image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .clipShape(Rectangle())
                    .cornerRadius(20)

                Text("Описание:")
                    .font(.headline)
                Text(flower.description)

                Text("Условия роста:")
                    .font(.headline)
                Text(flower.conditions)

                Text("Температура:")
                    .font(.headline)
                Text(flower.temperature)

                Text("Время цветения:")
                    .font(.headline)
                Text(flower.blossomTime)
                Spacer()
                
                VStack {
                    Text("Расчитать количество растений:")
                        .font(.headline)
                        .padding(.bottom, 10)

                    TextField("Введите размер комнаты (м²)", text: $roomSize)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.bottom, 10)

                    Button(action: calculateNumberOfPlants) {
                        Text("Рассчитать")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    if let numberOfPlants = numberOfPlants {
                        Text("Вы можете разместить \(numberOfPlants) растений(е) этого вида в комнате.")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 20)
                            .foregroundColor(.green)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 10)
            }
            .padding()
        }
        .navigationTitle(flower.name)
    }


    private func calculateNumberOfPlants() {
        guard let roomArea = Int(roomSize) else {
            return
        }
        
        numberOfPlants = Int(roomArea / flower.radius)
    }
}
