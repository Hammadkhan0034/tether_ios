import SwiftUI
import AVFoundation

struct AudioRecorderView: View {
    @State private var isRecording = false
    @State private var audioFileURL: URL?
    @State private var audioPlayerManager = AudioPlayerManager()
    
    @State private var isPlaying = false
    @State private var audioDuration: Double = 1
    @State private var playbackProgress: Double = 0
    
    let recorder = AudioRecorder()

    var body: some View {
        VStack(spacing: 20) {
            Text("Audio Recorder")
                .font(.largeTitle)
            
            HStack(spacing: 30) {
                Image(systemName: "microphone.circle.fill").resizable().frame(width: 50,height: 50).foregroundStyle(isRecording ? Color.red : Color.green)
                        .cornerRadius(10).onTapGesture(perform: toggleRecording)
                
                Button(action: togglePlayback) {
                    Text(isPlaying ? "Stop Playback" : "Play Recording")
                        .padding()
                        .background(isPlaying ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            if let _ = audioFileURL {
                // Linear Progress Bar for playback progress
                ProgressView(value: playbackProgress, total: audioDuration)
                    .progressViewStyle(LinearProgressViewStyle())
                    .padding()
                    .accentColor(.blue)
                
                Text("\(formattedTime(for: playbackProgress)) / \(formattedTime(for: audioDuration))")
                    .font(.subheadline)
                    .padding(.top)
                
                // Upload Button
                Button(action: uploadAudio) {
                    Text("Upload Audio")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .onAppear {
            recorder.prepare()
        }
        .onDisappear {
            audioPlayerManager.timer?.invalidate()
        }
    }
    
    func toggleRecording() {
        if isRecording {
            recorder.stopRecording { url in
                audioFileURL = url
            }
        } else {
            recorder.startRecording()
        }
        isRecording.toggle()
    }
    
    func togglePlayback() {
        if isPlaying {
            audioPlayerManager.stopAudio()
        } else {
            guard let url = audioFileURL else { return }
            audioPlayerManager.playAudio(from: url)
        }
        isPlaying.toggle()
    }
    
    func uploadAudio() {
        guard let url = audioFileURL else { return }
        
        // Replace with your API URL
        let apiURL = URL(string: "https://yourapi.com/upload")!
        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        
        // Create the multipart form data
        var body = Data()
        
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let fileData = try? Data(contentsOf: url)
        let fileName = "audioRecording.m4a"
        
        // Add the audio file
//        body.append("--\(boundary)\r\n")
//        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n")
//        body.append("Content-Type: audio/m4a\r\n\r\n")
//        body.append(fileData ?? Data())
//        body.append("\r\n--\(boundary)--\r\n")
        
        request.httpBody = body
        
        // Upload the audio to the API
        URLSession.shared.uploadTask(with: request, from: body) { data, response, error in
            if let error = error {
                print("Upload failed: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("Upload successful!")
            }
        }.resume()
    }
    
    func formattedTime(for time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

class AudioRecorder: NSObject, AVAudioRecorderDelegate {
    private var audioRecorder: AVAudioRecorder?
    private var audioSession: AVAudioSession?
    private var audioURL: URL?
    
    func prepare() {
        audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession?.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
            try audioSession?.setActive(true)
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
    }
    
    func startRecording() {
        let fileName = "audioRecording.m4a"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        audioURL = documentsDirectory.appendingPathComponent(fileName)
        
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioURL!, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.record()
        } catch {
            print("Error starting recording: \(error.localizedDescription)")
        }
    }
    
    func stopRecording(completion: @escaping (URL) -> Void) {
        audioRecorder?.stop()
        if let url = audioURL {
            completion(url)
        }
    }
}


// Class for handling audio playback and delegate conformance
class AudioPlayerManager: NSObject, AVAudioPlayerDelegate {
    var audioPlayer: AVAudioPlayer?
    var audioDuration: Double = 1
    var playbackProgress: Double = 0
    var timer: Timer? = nil
    var isPlaying = false
    
    func playAudio(from url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            audioDuration = audioPlayer?.duration ?? 1
            isPlaying = true
            startProgressTimer()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    func stopAudio() {
        audioPlayer?.stop()
        timer?.invalidate()
        isPlaying = false
    }
    
    func startProgressTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if let player = self.audioPlayer {
                self.playbackProgress = player.currentTime
            }
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
        timer?.invalidate()
    }
}

struct AudioRecorder_Previews: PreviewProvider {
    static var previews: some View {
        AudioRecorderView()
        
    }
}


