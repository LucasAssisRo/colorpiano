public enum PianoKeys: Float {
    case C0 = 16.3716 // Out of tune to not be converted to black
    case CSharp0 = 17.3239
    case D0 = 18.3540
    case DSharp0 = 19.4454
    case E0 = 20.6017
    case F0 = 21.8268
    case FSharp0 = 23.1247
    case G0 = 24.4997
    case GSharp0 = 25.9565
    case A0 = 27.5000
    case ASharp0 = 29.1352
    case B0 = 30.8677
    case C1 = 32.7032
    case CSharp1 = 34.6478
    case D1 = 36.7081
    case DSharp1 = 38.8909
    case E1 = 41.2034
    case F1 = 43.6535
    case FSharp1 = 46.2493
    case G1 = 48.9994
    case GSharp1 = 51.9131
    case A1 = 55.0000
    case ASharp1 = 58.2705
    case B1 = 61.7354
    case C2 = 65.4064
    case CSharp2 = 69.2957
    case D2 = 73.4162
    case DSharp2 = 77.7817
    case E2 = 82.4069
    case F2 = 87.3071
    case FSharp2 = 92.4986
    case G2 = 97.9989
    case GSharp2 = 103.826
    case A2 = 110.000
    case ASharp2 = 116.541
    case B2 = 123.471
    case C3 = 130.813
    case CSharp3 = 138.591
    case D3 = 146.832
    case DSharp3 = 155.563
    case E3 = 164.814
    case F3 = 174.614
    case FSharp3 = 184.997
    case G3 = 195.998
    case GSharp3 = 207.652
    case A3 = 220.000
    case ASharp3 = 233.082
    case B3 = 246.942
    case C4 = 261.626
    case CSharp4 = 277.183
    case D4 = 293.665
    case DSharp4 = 311.127
    case E4 = 329.628
    case F4 = 349.228
    case FSharp4 = 369.994
    case G4 = 391.995
    case GSharp4 = 415.305
    case A4 = 440.000
    case ASharp4 = 466.164
    case B4 = 493.883
    case C5 = 523.251
    case CSharp5 = 554.365
    case D5 = 587.330
    case DSharp5 = 622.254
    case E5 = 659.255
    case F5 = 698.456
    case FSharp5 = 739.989
    case G5 = 783.991
    case GSharp5 = 830.609
    case A5 = 880.000
    case ASharp5 = 932.328
    case B5 = 987.767
    case C6 = 1046.50
    case CSharp6 = 1108.73
    case D6 = 1174.66
    case DSharp6 = 1244.51
    case E6 = 1318.51
    case F6 = 1396.91
    case FSharp6 = 1479.98
    case G6 = 1567.98
    case GSharp6 = 1661.22
    case A6 = 1760.00
    case ASharp6 = 1864.66
    case B6 = 1975.53
    case C7 = 2093.00
    case CSharp7 = 2217.46
    case D7 = 2349.32
    case DSharp7 = 2489.02
    case E7 = 2637.02
    case F7 = 2793.83
    case FSharp7 = 2959.96
    case G7 = 3135.96
    case GSharp7 = 3322.44
    case A7 = 3520.00
    case ASharp7 = 3729.31
    case B7 = 3951.07
    case C8 = 4186.01
    case CSharp8 = 4434.92
    case D8 = 4698.64
    case DSharp8 = 4978.03
    case E8 = 5274.04
    case F8 = 5587.65
    case FSharp8 = 5919.91
    case G8 = 6271.93
    case GSharp8 = 6644.88
    case A8 = 7040.00
    case ASharp8 = 7458.62
    case B8 = 7902.13
    case empty = -0451
    
    public var stringValue: String {
        switch self {
        case .C0: return "C0"
        case .CSharp0: return "C#0"
        case .D0: return "D0"
        case .DSharp0: return "D#0"
        case .E0: return "E0"
        case .F0: return "F0"
        case .FSharp0: return "F#0"
        case .G0: return "G0"
        case .GSharp0: return "G#0"
        case .A0: return "A0"
        case .ASharp0: return "A#0"
        case .B0: return "B0"
        case .C1: return "C1"
        case .CSharp1: return "C#1"
        case .D1: return "D1"
        case .DSharp1: return "D#1"
        case .E1: return "E1"
        case .F1: return "F1"
        case .FSharp1: return "F#1"
        case .G1: return "G1#"
        case .GSharp1: return "G#1"
        case .A1: return "A1"
        case .ASharp1: return "A#1"
        case .B1: return "B1"
        case .C2: return "C2"
        case .CSharp2: return "C#2"
        case .D2: return "D2"
        case .DSharp2: return "D#2"
        case .E2: return "E2"
        case .F2: return "F2"
        case .FSharp2: return "F#2"
        case .G2: return "G2"
        case .GSharp2: return "G#2"
        case .A2: return "A2"
        case .ASharp2: return "A#2"
        case .B2: return "B2"
        case .C3: return "C3"
        case .CSharp3: return "C#0"
        case .D3: return "D3"
        case .DSharp3: return "D#3"
        case .E3: return "E3"
        case .F3: return "F3"
        case .FSharp3: return "F#3"
        case .G3: return "G3"
        case .GSharp3: return "G#3"
        case .A3: return "A3"
        case .ASharp3: return "A#3"
        case .B3: return "B3"
        case .C4: return "C4"
        case .CSharp4: return "C#4"
        case .D4: return "D4"
        case .DSharp4: return "D#4"
        case .E4: return "E4"
        case .F4: return "F4"
        case .FSharp4: return "F#4"
        case .G4: return "G4"
        case .GSharp4: return "G#4"
        case .A4 : return "A4"
        case .ASharp4: return "A#4"
        case .B4: return "B4"
        case .C5: return "C5"
        case .CSharp5: return "C#5"
        case .D5: return "D5"
        case .DSharp5: return "D#5"
        case .E5: return "E5"
        case .F5: return "F5"
        case .FSharp5: return "F#5"
        case .G5: return "G5"
        case .GSharp5: return "G#5"
        case .A5: return "A5"
        case .ASharp5: return "A#5"
        case .B5: return "B5"
        case .C6: return "C6"
        case .CSharp6: return "C#6"
        case .D6: return "D6"
        case .DSharp6: return "D#6"
        case .E6: return "E6"
        case .F6: return "F6"
        case .FSharp6: return "F#6"
        case .G6: return "G6"
        case .GSharp6: return "G#6"
        case .A6: return "A6"
        case .ASharp6: return "A#6"
        case .B6: return "B6"
        case .C7: return "C7"
        case .CSharp7: return "C#7"
        case .D7: return "D7"
        case .DSharp7: return "D#7"
        case .E7: return "E7"
        case .F7: return "F7"
        case .FSharp7: return "F#7"
        case .G7: return "G7"
        case .GSharp7: return "G#7"
        case .A7: return "A7"
        case .ASharp7: return "A#7"
        case .B7: return "B7"
        case .C8: return "C8"
        case .CSharp8: return "C#8"
        case .D8: return "D8"
        case .DSharp8: return "D#8"
        case .E8: return "E8"
        case .F8: return "F8"
        case .FSharp8: return "F#8"
        case .G8: return "G8"
        case .GSharp8: return "G#8"
        case .A8: return "A8"
        case .ASharp8: return "A#8"
        case .B8: return "B8"
        case .empty: return "Empty"
        }
    }
    
    public static func from(_ string: String?) -> PianoKeys {
        guard let string = string  else { return .empty }
        
            switch string {
            case "C4": return .C4
            case "D4": return .D4
            case "E4": return .E4
            case "F4":
                return .F4
            case "G4":
                return .G4
            case "A4":
                return .A4
            case "B4":
                return .B4
            default:
                return.empty
            }
    }
}
