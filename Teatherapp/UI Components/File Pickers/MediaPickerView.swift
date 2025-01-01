import SwiftUI
import AVFoundation
import PhotosUI

struct MediaPickerView: View {
    @State private var mediaItems: [MediaItem] = []
    @State private var totalMediaSize: Int64 = 0 // Size in bytes
    @State private var showSizeExceededAlert = false

    let maxTotalSize: Int64 = 5 * 1024 * 1024 // 5 MB in bytes

    var body: some View {
        VStack {
            MediaPickerButton { mediaType, media in
                let mediaSize = calculateMediaSize(media: media)

                if totalMediaSize + mediaSize <= maxTotalSize {
                    totalMediaSize += mediaSize

                    switch mediaType {
                    case .photo(let image):
                        mediaItems.append(.photo(image))
                    case .video(let url):
                        mediaItems.append(.video(url))
                    }
                } else {
                    showSizeExceededAlert = true
                }
            }

            if !mediaItems.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(mediaItems, id: \.id) { item in
                            MediaPreview(item: item)
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding(.top, 16)
                }
                .alert("Media Size Limit Exceeded", isPresented: $showSizeExceededAlert) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("The total size of media cannot exceed 5 MB.")
                }
            }
        }
        .padding()
    }

    // Calculates the size of the media
    func calculateMediaSize(media: Any) -> Int64 {
        if let image = media as? UIImage, let data = image.jpegData(compressionQuality: 1.0) {
            return Int64(data.count)
        } else if let url = media as? URL {
            do {
                let attributes = try FileManager.default.attributesOfItem(atPath: url.path)
                return attributes[.size] as? Int64 ?? 0
            } catch {
                print("Error calculating video size: \(error)")
            }
        }
        return 0
    }
}

struct MediaPreview: View {
    let item: MediaItem

    var body: some View {
        switch item.type {
        case .photo(let image):
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
        case .video(let url):
            VideoThumbnailView(videoURL: url)
        }
    }
}

struct VideoThumbnailView: View {
    let videoURL: URL

    var body: some View {
        if let thumbnail = generateThumbnail(from: videoURL) {
            Image(uiImage: thumbnail)
                .resizable()
                .scaledToFill()
        } else {
            Text("No Thumbnail")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray)
        }
    }

    func generateThumbnail(from url: URL) -> UIImage? {
        let asset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true

        do {
            let cgImage = try imageGenerator.copyCGImage(at: .zero, actualTime: nil)
            return UIImage(cgImage: cgImage)
        } catch {
            print("Failed to generate thumbnail: \(error)")
            return nil
        }
    }
}

struct MediaItem: Identifiable {
    let id = UUID()
    let type: MediaType

    enum MediaType {
        case photo(UIImage)
        case video(URL)
    }

    static func photo(_ image: UIImage) -> MediaItem {
        MediaItem(type: .photo(image))
    }

    static func video(_ url: URL) -> MediaItem {
        MediaItem(type: .video(url))
    }
}

struct MediaPickerButton: View {
    var onMediaPicked: (MediaItem.MediaType, Any) -> Void

    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var mediaType: UIImagePickerController.SourceType = .camera
    @State private var mediaCaptureMode: UIImagePickerController.CameraCaptureMode = .photo

    var body: some View {
        Button("Select Media") {
            showActionSheet = true
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text("Select Media Type"),
                buttons: [
                    .default(Text("Take Photo")) {
                        mediaType = .camera
                        mediaCaptureMode = .photo
                        showImagePicker = true
                    },
                    .default(Text("Record Video")) {
                        mediaType = .camera
                        mediaCaptureMode = .video
                        showImagePicker = true
                    },
                    .cancel()
                ]
            )
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(
                mediaType: mediaType,
                captureMode: mediaCaptureMode,
                onMediaPicked: onMediaPicked
            )
        }
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    var mediaType: UIImagePickerController.SourceType
    var captureMode: UIImagePickerController.CameraCaptureMode
    var onMediaPicked: (MediaItem.MediaType, Any) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(onMediaPicked: onMediaPicked)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = mediaType
        picker.delegate = context.coordinator
        picker.cameraCaptureMode = captureMode
        picker.mediaTypes = captureMode == .photo ? ["public.image"] : ["public.movie"]
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let onMediaPicked: (MediaItem.MediaType, Any) -> Void

        init(onMediaPicked: @escaping (MediaItem.MediaType, Any) -> Void) {
            self.onMediaPicked = onMediaPicked
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                onMediaPicked(.photo(image), image)
            } else if let videoURL = info[.mediaURL] as? URL {
                onMediaPicked(.video(videoURL), videoURL)
            }
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

struct MediaPickerView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPickerView()
    }
}
