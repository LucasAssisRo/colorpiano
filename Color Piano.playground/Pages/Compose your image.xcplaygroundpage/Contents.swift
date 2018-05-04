//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code
//: [Previous](@previous)
/*:
 **Generate Image**
 ================
 
 The idea illustrated on the first two pages can also be implemented backwards, transforming a song into an image.
 
 Still using the Hilbert curve, we will now keep notes that are close to each other on the same region of the image, and use the same table to interpolate colors.
 
 ---
 * Experiment:
     Using the suggestions at the bottom of the screen, change the variables in the rectangular text fields to compose the image that will generate your song.
 
     Use .empty to skip pixels.
 */
//Sheet
var note01: PianoKeys = /*#-editable-code note*/.C5/*#-end-editable-code*/
var note02: PianoKeys = /*#-editable-code note*/.D5/*#-end-editable-code*/
var note03: PianoKeys = /*#-editable-code note*/.E5/*#-end-editable-code*/
var note04: PianoKeys = /*#-editable-code note*/.F5/*#-end-editable-code*/
var note05: PianoKeys = /*#-editable-code note*/.G5/*#-end-editable-code*/
var note06: PianoKeys = /*#-editable-code note*/.A5/*#-end-editable-code*/
var note07: PianoKeys = /*#-editable-code note*/.B5/*#-end-editable-code*/
var note08: PianoKeys = /*#-editable-code note*/.C6/*#-end-editable-code*/
var note09: PianoKeys = /*#-editable-code note*/.A8/*#-end-editable-code*/
var note10: PianoKeys = /*#-editable-code note*/.E6/*#-end-editable-code*/
var note11: PianoKeys = /*#-editable-code note*/.F6/*#-end-editable-code*/
var note12: PianoKeys = /*#-editable-code note*/.G6/*#-end-editable-code*/
var note13: PianoKeys = /*#-editable-code note*/.A6/*#-end-editable-code*/
var note14: PianoKeys = /*#-editable-code note*/.B6/*#-end-editable-code*/
var note15: PianoKeys = /*#-editable-code note*/.C7/*#-end-editable-code*/
var note16: PianoKeys = /*#-editable-code note*/.D7/*#-end-editable-code*/

//Piano Settings
var volume = /*#-editable-code volume*/0.5/*#-end-editable-code*/
var noteDuration = /*#-editable-code duration*/10/*#-end-editable-code*/
//#-hidden-code
let intNote = Int(noteDuration)
var notes = [
    (key: note01, length: intNote),
    (key: note02, length: intNote),
    (key: note03, length: intNote),
    (key: note04, length: intNote),
    (key: note05, length: intNote),
    (key: note06, length: intNote),
    (key: note07, length: intNote),
    (key: note08, length: intNote),
    (key: note09, length: intNote),
    (key: note10, length: intNote),
    (key: note11, length: intNote),
    (key: note12, length: intNote),
    (key: note13, length: intNote),
    (key: note14, length: intNote),
    (key: note15, length: intNote),
    (key: note16, length: intNote)
]

PlaygroundPage.current.liveView = MusicGridView(notes: notes)
Synthesizer.shared.play(sheet: notes, volume: Float32(volume))
//#-end-hidden-code
