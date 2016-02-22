class Song {
    private let lineStart = "This is "
    private let lineEnd = "."
    private var phrases = [
        "the house that Jack built",
        "the malt that lay in",
        "the rat that ate"
    ]
    
    init(repeats: Bool) {
        if repeats {
//            var newPhrases = [String]()
//            for phrase in self.phrases {
//                newPhrases.append(phrase + " " + phrase)
//            }
//            self.phrases = newPhrases
            
            let newPhrases = self.phrases.map { phrase -> String in
                return phrase + " " + phrase
            }
            self.phrases = newPhrases
        }
    }
    
    func line(number: Int) -> String {
        let linePhrases = self.phrases[0...number-1].reverse()
        let line = linePhrases.joinWithSeparator(" ")
        return self.lineStart + line + self.lineEnd
    }
    
    func recite() -> String {
        var lines = [String]()
        for i in 1...self.phrases.count {
            lines.append(self.line(i))
        }
        return lines.joinWithSeparator("\n")
    }
}

let song = Song(repeats: false)
song.line(1)
song.line(2)
song.line(3)
song.recite()

let repeatingSong = Song(repeats: true)
repeatingSong.line(1)
repeatingSong.line(2)
repeatingSong.line(3)
repeatingSong.recite()
