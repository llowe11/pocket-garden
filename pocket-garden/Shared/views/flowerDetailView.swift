import SwiftUI
import Foundation

struct flowerDetailView: View {
    let flower: Flower
    @State private var roomSize: String = ""
    @State private var numberOfPlants: Int? = nil
    @State private var isModalPresented: Bool = false
    @State private var inputError: String? = nil

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                flower.image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipShape(Rectangle())
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .frame(maxWidth: .infinity, alignment: .center)

                Text(flower.engName)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)

                Divider()

                VStack(alignment: .leading, spacing: 10) {
                    Text("Описание:")
                        .font(.headline)
                    Text(flower.description)
                        .padding(.bottom, 10)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Условия роста:")
                        .font(.headline)
                    Text(flower.conditions)
                        .padding(.bottom, 10)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Температура:")
                        .font(.headline)
                    Text(flower.temperature)
                        .padding(.bottom, 10)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Время цветения:")
                        .font(.headline)
                    Text(flower.blossomTime)
                        .padding(.bottom, 10)
                }

                Text("Необходимая площадь:")
                    .font(.headline)
                Text("\(flower.radius) м²")
                                
                Button(action: {
                    isModalPresented.toggle()
                }) {
                    Text("Рассчитать")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationTitle(flower.name)
        .sheet(isPresented: $isModalPresented) {
            VStack {
                Text("Введите размер комнаты (м²)")
                    .font(.headline)
                    .padding(.bottom, 10)

                TextField("Размер комнаты", text: $roomSize)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.bottom, 20)

                if let error = inputError {
                    Text(error)
                        .foregroundColor(.red)
                        .padding(.bottom, 10)
                }

                Button(action: calculateNumberOfPlants) {
                    Text("Рассчитать")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                if let numberOfPlants = numberOfPlants {
                    Text("Вы можете разместить \(numberOfPlants) растений(е).")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundColor(.green)
                }
            }
            .padding()
        }
    }

    private func calculateNumberOfPlants() {
        guard let roomArea = Double(roomSize), roomArea > 0 else {
            inputError = "Пожалуйста, введите корректное число."
            return
        }
        
        inputError = nil
        numberOfPlants = Int(roomArea / Double(flower.radius))
    }
}
