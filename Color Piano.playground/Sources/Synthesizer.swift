import AVFoundation
import UIKit

/*
  Modified version of the sample code found in https://gist.github.com/michaeldorner/746c659476429a86a9970faaa6f95ec4
 */

public class Synthesizer {
    
    public static var shared = Synthesizer()
    
    // The number of audio samples per buffer. A lower value reduces latency for
    // changes but requires more processing but increases the risk of being unable
    // to fill the buffers in time. A setting of 1024 represents about 23ms of
    // samples.
    let kSamplesPerBuffer: AVAudioFrameCount = 1024
    
    // The audio engine manages the sound system.
    let audioEngine: AVAudioEngine = AVAudioEngine()
    
    // The player node schedules the playback of the audio buffers.
    let playerNode: AVAudioPlayerNode = AVAudioPlayerNode()
    
    // Use standard non-interleaved PCM audio.
    let audioFormat = AVAudioFormat(standardFormatWithSampleRate: 44100.0, channels: 2)
    
    // A circular queue of audio buffers.
    var audioBuffers: [AVAudioPCMBuffer] = [AVAudioPCMBuffer]()
    
    // The index of the next buffer to fill.
    var bufferIndex: Int = 0
    
    // The dispatch queue to render audio samples.
    let audioQueue: DispatchQueue = DispatchQueue(label: "SynthesizerQueue", attributes: [])
    
    // A semaphore to gate the number of buffers processed.
    let audioSemaphore: DispatchSemaphore
    
    private init() {
        // init the semaphore
        audioSemaphore = DispatchSemaphore(value: 10)
        
        // Create a pool of audio buffers.
        for _ in 0 ..< 10 {
            audioBuffers.append(AVAudioPCMBuffer(pcmFormat: audioFormat!,
                                                 frameCapacity: kSamplesPerBuffer)!)
        }
        
        // Attach and connect the player node.
        audioEngine.attach(playerNode)
        audioEngine.connect(playerNode, to: audioEngine.mainMixerNode, format: audioFormat)
        
        do {
            try audioEngine.start()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    private func play(_ frequency: Float32, modulatorAmplitude: Float32, length: Int) {
        let unitVelocity = Float32(2.0 * .pi / (audioFormat?.sampleRate)!)
        let angularFrequency = frequency * unitVelocity
        audioQueue.async {
            var sampleTime: Float32 = 0
            var time = 0
            while time < length {
                // Wait for a buffer to become available.
                let _ = self.audioSemaphore.wait(timeout: DispatchTime.distantFuture)
                
                // Fill the buffer with new samples.
                let audioBuffer = self.audioBuffers[self.bufferIndex]
                let leftChannel = audioBuffer.floatChannelData?[0]
                let rightChannel = audioBuffer.floatChannelData?[1]
                for sampleIndex in 0 ..< Int(self.kSamplesPerBuffer) {
                    let sample = sin(angularFrequency * sampleTime) * modulatorAmplitude // sin wave A * sin(ø * w)
                    leftChannel?[sampleIndex] = sample
                    rightChannel?[sampleIndex] = sample
                    sampleTime += 1.0
                }
                
                audioBuffer.frameLength = self.kSamplesPerBuffer
                
                // Schedule the buffer for playback and release it for reuse after
                // playback has finished.
                self.playerNode.scheduleBuffer(audioBuffer) {
                    self.audioSemaphore.signal()
                    return
                }
                
                self.bufferIndex = (self.bufferIndex + 1) % self.audioBuffers.count
                
                time += 1
            }
        }
        
        playerNode.play()
    }
    
    public func play(sheet: [(key: PianoKeys, length: Int)], volume modulatorAmplitude: Float32) {
        for note in sheet {
            self.play(note.key != .empty ? note.key.rawValue : 0,
                      modulatorAmplitude: modulatorAmplitude,
                      length: note.length)
        }
    }
    
    public func play(image: UIImage?, volume modulatorAmplitude: Float32, length: Int) {
        if let matrix = image?.cgImage?.soundMatrix {
            for i in 0 ..< matrix[0].count * matrix.count {
                let coordinate = HilbertCurve.getCoordinate(from: i, n: matrix[0].count * matrix.count)
                let frequency = Float32(matrix[coordinate.x][coordinate.y].frequency)
                if frequency > 17 {
                    Synthesizer.shared.play(frequency,
                                            modulatorAmplitude: modulatorAmplitude,
                                            length: length)
                }
            }
        }
    }
}

