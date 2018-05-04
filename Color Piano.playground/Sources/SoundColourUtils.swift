import Darwin
public struct SoundColourUtils {
    private init() {}
    
    static func sound(from hex: Float32) -> Float32 {
        let minColour: Float32 = 0x000000
        guard hex != minColour else { return -0451 }
        
        let maxColour: Float32 = 0xffffff
        
        let maxFrequency: Float32 = 7902.13
        let minFrequency: Float32 = 16.3516
        
        return (maxFrequency - minFrequency) * (hex - minColour) / (maxColour - minColour) + minFrequency
    }
    
    static func length(from alpha: Float32) -> Float32 {
        return 15 * alpha / 255
    }
    
    public static func hex(from sound: Float32) -> Int {
        let minColour: Float32 = 0x000000
        guard sound != -0451 else { return Int(minColour) }
        
        let maxColour: Float32 = 0xffffff
        
        let maxFrequency: Float32 = 7902.13
        let minFrequency: Float32 = 16.3516
        return Int(((maxColour - minColour) * (sound - minFrequency) / (maxFrequency - minFrequency) + minColour).rounded())
    }
    
    public static func alpha(from length: Float32) -> Float32 {
        return 255 * length / 15
    }
}

