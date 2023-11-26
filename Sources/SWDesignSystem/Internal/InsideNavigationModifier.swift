import SwiftUI

/// На iOS 16+ используем `NavigationStack`, ниже - `NavigationView`
struct InsideNavigationModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                content
            }
        } else {
            NavigationView {
                content
            }
            .navigationViewStyle(.stack)
        }
    }
}
