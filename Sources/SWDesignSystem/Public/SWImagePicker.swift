import SwiftUI

/// Пикер для одной фотографии с возможностью обрезки
public struct SWImagePicker: UIViewControllerRepresentable {
    let completion: (UIImage) -> Void
    @Environment(\.dismiss) private var dismiss
    
    /// Инициализатор
    /// - Parameter completion: Возвращает выбранную фотографию
    public init(completion: @escaping (UIImage) -> Void) {
        self.completion = completion
    }

    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }

    public func updateUIViewController(_: UIImagePickerController, context _: Context) {}

    public func makeCoordinator() -> Coordinator { .init(self) }

    public final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        private let parent: SWImagePicker

        init(_ parent: SWImagePicker) {
            self.parent = parent
        }

        public func imagePickerController(
            _: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
        ) {
            if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                parent.completion(image)
            }
            parent.dismiss()
        }

        public func imagePickerControllerDidCancel(_: UIImagePickerController) {
            parent.dismiss()
        }
    }
}
