import SwiftUI

/// Вьюшка для профиля с базовой информацией
///
/// Фото, пол, возраст, страна и город
public struct ProfileView: View {
    private let imageURL: URL?
    private let login: String
    private let genderWithAge: String
    private let countryAndCity: String

    /// Инициализирует `ProfileView`
    /// - Parameters:
    ///   - imageURL: URL` картинки
    ///   - login: Имя пользователя (логин)
    ///   - genderWithAge: Пол и возраст
    ///   - countryAndCity: Страна и город
    public init(
        imageURL: URL?,
        login: String,
        genderWithAge: String,
        countryAndCity: String
    ) {
        self.imageURL = imageURL
        self.login = login
        self.genderWithAge = genderWithAge
        self.countryAndCity = countryAndCity
    }

    public var body: some View {
        VStack(spacing: 12) {
            CachedImage(url: imageURL, mode: .profileAvatar)
                .borderedRoundedRectClipShape()
            VStack(spacing: 8) {
                Text(login)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.swMainText)
                    .font(.system(size: 22, weight: .bold))
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 8) {
                        Icons.Regular.person.view
                            .symbolVariant(.circle)
                        Text(genderWithAge)
                    }
                    HStack(spacing: 8) {
                        Icons.Regular.location.view
                            .symbolVariant(.circle)
                        Text(countryAndCity)
                            .lineLimit(2)
                    }
                }
                .foregroundStyle(Color.swSmallElements)
            }
        }
    }
}

#if DEBUG
#Preview {
    ProfileView(
        imageURL: nil,
        login: "Beautifulbutterfly101",
        genderWithAge: "Женщина, 30 лет",
        countryAndCity: "Россия, Краснодар"
    )
    .padding(.horizontal, 40)
}
#endif
