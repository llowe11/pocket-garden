import SwiftUI
import Foundation

struct InfoModalView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                
                Text("О приложении:")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                    .padding(.top, 30)
                Text("Мобильное приложение по подбору")
                Text("фитонцидных растений для биофильного")
                Text("дизайна интерьера")
                    .padding(.bottom, 5)
                Divider()
                Text("Индивидуальная работа")
                    .padding(.bottom, 5)
                Text("7-й класс, русский язык")
                    .padding(.bottom, 5)
                Text("Назарбаев Интеллектуальная школа")
                Text("физико-математического направления")
                Text("г. Тараз")
                    .padding(.bottom, 15)

                Divider()

                Text("Контакты:")
                    .font(.headline)
                    .padding(.bottom, 5)
                Text("Телефон: +7 809 22 400 723")
                    .padding(.bottom, 5)
                Text("Email: aizeretolepbergen6@gmail.com")
                    .padding(.bottom, 15)

                Divider()

                Text("Разработчики:")
                    .font(.headline)
                    .padding(.bottom, 5)
                Text("Төлепберген Айзере")
                    .padding(.bottom, 5)
                Text("Владислав Ким")
                    .padding(.bottom, 5)
                Text("Учитель:")
                    .font(.headline)
                    .padding(.bottom, 5)
                Text("Аксенова Инна Валерьевна")
                    .padding(.bottom, 15)

                Divider()

                Text("Адрес:")
                    .font(.headline)
                    .padding(.bottom, 5)
                Text("Жамбылская область, Меркенский район,")
                Text("Село Мерке, улица Т.Рыскулова, 125")
                    .padding(.bottom, 15)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Информация")
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    InfoModalView()
}
