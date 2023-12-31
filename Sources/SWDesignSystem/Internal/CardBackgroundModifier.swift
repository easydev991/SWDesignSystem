import SwiftUI

/// Модификатор, настраивающий фон для карточки
///
/// Карточка - это вьюшка, используемая в форме, или просто контент в рамке
struct CardBackgroundModifier: ViewModifier {
    let padding: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.swCardBackground)
                    .withShadow()
            }
    }
}

#if DEBUG
#Preview {
    VStack(spacing: 16) {
        Text("Light mode text")
            .insideCardBackground()
        Text("Dark mode text")
            .insideCardBackground()
            .environment(\.colorScheme, .dark)
    }
}
#endif
