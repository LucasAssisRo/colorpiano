import UIKit

public class ColorPianoView: UIView {
    
    var pixelView: UIView!
    var colorView: UIView!
    var colorButtons: [NoteButton] = []
    var noteButtons: [NoteButton] = []
    var selectedButton: NoteButton?
    var playButton: UIButton!
    var order: CGFloat = 1
    
    public var volume: Float32 = 1
    public var length: Int = 10
    
    override public var bounds: CGRect {
        didSet {
            if self.bounds.width < self.bounds.height {
                self.pixelView.center = CGPoint(x: self.bounds.midX,
                                                y: 40 + self.pixelView.bounds.midY)
                self.colorView.center = CGPoint(x: self.bounds.midX,
                                                y: -self.colorView.bounds.height + self.bounds.maxY)
                
                self.playButton.center = CGPoint(x: self.bounds.midX,
                                                 y: -40 - self.playButton.bounds.height - self.colorView.bounds.height + self.bounds.maxY)
            } else {
                self.pixelView.center = CGPoint(x: 40 + self.pixelView.bounds.midX,
                                                y: self.bounds.midY)
                self.colorView.center = CGPoint(x: -self.colorView.bounds.width + self.bounds.maxX,
                                                y: self.bounds.midY)
                self.playButton.center = CGPoint(x: -self.colorView.bounds.width + self.bounds.maxX,
                                                 y: -40 - self.playButton.bounds.height + self.bounds.midY)
            }
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public convenience init(size: CGFloat) {
        self.init(frame: UIScreen.main.bounds)
        self.order = size
        if self.order < 1 {
            self.order = 1
        } else if self.order > 3 {
            self.order = 3
        }
        
        let bigPixelSize: CGFloat
        switch self.order {
        case 1:
            bigPixelSize = 128
        case 2:
            bigPixelSize = 64
        default:
            bigPixelSize = 32
        }
        
        self.backgroundColor = .white
        self.pixelView = UIView()
        self.pixelView.bounds.size = CGSize(width: 256, height: 256)
        
        for i in 0 ..< Int(pow(2, self.order) * pow(2, self.order)) {
            let matrixPosition = HilbertCurve.getCoordinate(from: i, n: Int(self.order + 2))
            let bigPixelButton = NoteButton()
            bigPixelButton.bounds.size = CGSize(width: bigPixelSize,
                                                height: bigPixelSize)
            bigPixelButton.center = CGPoint(x: bigPixelSize / 2 + bigPixelSize * CGFloat(matrixPosition.x),
                                            y: bigPixelSize / 2 + bigPixelSize * CGFloat(matrixPosition.y))
            bigPixelButton.setTitle("\(i + 1)", for: .normal)
            bigPixelButton.backgroundColor = .black
            bigPixelButton.layer.borderWidth = 1
            bigPixelButton.layer.borderColor = UIColor.white.cgColor
            bigPixelButton.addTarget(self, action: #selector(colorSquare(_:)), for: .touchUpInside)
            self.noteButtons.append(bigPixelButton)
            self.pixelView.addSubview(bigPixelButton)
        }
        
        self.colorView = UIView()
        self.colorView.bounds.size = CGSize(width: 256, height: 128)
        
        var key = PianoKeys.empty
        var hex = SoundColourUtils.hex(from: key.rawValue)
        let emptyButton = NoteButton()
        emptyButton.setTitle(key.stringValue, for: .normal)
        emptyButton.backgroundColor = UIColor(red: CGFloat((hex & 0xff0000) >> 16) / 255,
                                              green: CGFloat((hex & 0x00ff00) >> 8) / 255,
                                              blue: CGFloat((hex & 0x0000ff)) / 255,
                                              alpha: 1)
        colorButtons.append(emptyButton)
        
        key = .C4
        hex = SoundColourUtils.hex(from: key.rawValue)
        let c4Button = NoteButton()
        c4Button.setTitle(key.stringValue, for: .normal)
        c4Button.backgroundColor = UIColor(red: CGFloat((hex & 0xff0000) >> 16) / 255,
                                              green: CGFloat((hex & 0x00ff00) >> 8) / 255,
                                              blue: CGFloat((hex & 0x0000ff)) / 255,
                                              alpha: 1)
        colorButtons.append(c4Button)
        
        key = .D4
        hex = SoundColourUtils.hex(from: key.rawValue)
        let d4Button = NoteButton()
        d4Button.setTitle(key.stringValue, for: .normal)
        d4Button.backgroundColor = UIColor(red: CGFloat((hex & 0xff0000) >> 16) / 255,
                                              green: CGFloat((hex & 0x00ff00) >> 8) / 255,
                                              blue: CGFloat((hex & 0x0000ff)) / 255,
                                              alpha: 1)
        colorButtons.append(d4Button)
        
        key = .E4
        hex = SoundColourUtils.hex(from: key.rawValue)
        let e4Button = NoteButton()
        e4Button.setTitle(key.stringValue, for: .normal)
        e4Button.backgroundColor = UIColor(red: CGFloat((hex & 0xff0000) >> 16) / 255,
                                              green: CGFloat((hex & 0x00ff00) >> 8) / 255,
                                              blue: CGFloat((hex & 0x0000ff)) / 255,
                                              alpha: 1)
        colorButtons.append(e4Button)
        
        key = .F4
        hex = SoundColourUtils.hex(from: key.rawValue)
        let f4Button = NoteButton()
        f4Button.setTitle(key.stringValue, for: .normal)
        f4Button.backgroundColor = UIColor(red: CGFloat((hex & 0xff0000) >> 16) / 255,
                                              green: CGFloat((hex & 0x00ff00) >> 8) / 255,
                                              blue: CGFloat((hex & 0x0000ff)) / 255,
                                              alpha: 1)
        colorButtons.append(f4Button)
       
        key = .G4
        hex = SoundColourUtils.hex(from: key.rawValue)
        let g4Button = NoteButton()
        g4Button.setTitle(key.stringValue, for: .normal)
        g4Button.backgroundColor = UIColor(red: CGFloat((hex & 0xff0000) >> 16) / 255,
                                              green: CGFloat((hex & 0x00ff00) >> 8) / 255,
                                              blue: CGFloat((hex & 0x0000ff)) / 255,
                                              alpha: 1)
        colorButtons.append(g4Button)
        
        key = .A4
        hex = SoundColourUtils.hex(from: key.rawValue)
        let a4Button = NoteButton()
        a4Button.setTitle(key.stringValue, for: .normal)
        a4Button.backgroundColor = UIColor(red: CGFloat((hex & 0xff0000) >> 16) / 255,
                                              green: CGFloat((hex & 0x00ff00) >> 8) / 255,
                                              blue: CGFloat((hex & 0x0000ff)) / 255,
                                              alpha: 1)
        colorButtons.append(a4Button)
        
        key = .B4
        hex = SoundColourUtils.hex(from: key.rawValue)
        let b4Button = NoteButton()
        b4Button.setTitle(key.stringValue, for: .normal)
        b4Button.backgroundColor = UIColor(red: CGFloat((hex & 0xff0000) >> 16) / 255,
                                              green: CGFloat((hex & 0x00ff00) >> 8) / 255,
                                              blue: CGFloat((hex & 0x0000ff)) / 255,
                                              alpha: 1)
        colorButtons.append(b4Button)
        
        let noteButtonSize: CGFloat = 64
        
        for i in 0 ..< colorButtons.count {
            let button = colorButtons[i]
            button.bounds.size = CGSize(width: noteButtonSize, height: noteButtonSize)
            button.center = CGPoint(x: noteButtonSize / 2 + noteButtonSize * CGFloat(i % 4),
                                    y: noteButtonSize * (i < 4 ? 0.5 : 1.5))
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
            button.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
            self.colorView.addSubview(button)
        }

        self.selectButton(colorButtons[0])
        
        self.playButton = UIButton()
        self.playButton.setTitle("Play", for: .normal)
        self.playButton.setTitleColor(.orange, for: .normal)
        self.playButton.setTitleColor(UIColor.orange.withAlphaComponent(0.6), for: .selected)
        self.playButton.frame.size = CGSize(width: 50, height: 50)
        self.playButton.addTarget(self, action: #selector(play(_:)), for: .touchUpInside)
        
        self.addSubview(self.pixelView)
        self.addSubview(self.colorView)
        self.addSubview(self.playButton)
    }
    
    @IBAction func selectButton(_ sender: NoteButton) {
        guard sender != self.selectedButton else { return }
        sender.layer.borderColor = UIColor.orange.cgColor
        sender.layer.borderWidth = 2
        self.selectedButton?.layer.borderColor = UIColor.white.cgColor
        self.selectedButton?.layer.borderWidth = 1
        self.selectedButton = sender
    }
    
    @IBAction func colorSquare(_ sender: NoteButton) {
        sender.backgroundColor = self.selectedButton?.backgroundColor
        sender.note = PianoKeys.from(selectedButton?.title(for: .normal))
    }
    
    @IBAction func play(_ sender: UIButton) {
        var notes: [(key: PianoKeys, length: Int)] = []
        for i in 0 ..< Int(pow(2, self.order) * pow(2, self.order)) {
            let note = (key: self.noteButtons[i].note, length: length)
            notes.append(note)
        }
        
        Synthesizer.shared.play(sheet: notes, volume: Float32(volume))
    }
}

class NoteButton: UIButton {
    var note = PianoKeys.empty
}
