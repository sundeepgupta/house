protocol Remixer {
    func result(phrases: [String]) -> [String]
}

class Repeater: Remixer {
    func result(phrases: [String]) -> [String] {
        return phrases.map { phrase -> String in
            return phrase + " " + phrase
        }
    }
}

class Reverser: Remixer {
    func result(phrases: [String]) -> [String] {
        return phrases.reverse()
    }
}

class Original: Remixer {
    func result(phrases: [String]) -> [String] {
        return phrases
    }
}

class Song {
    private let lineStart = "This is "
    private let lineEnd = "."
    private var phrases = [
        "the house that Jack built",
        "the malt that lay in",
        "the rat that ate"
    ]
    
    init(remixer: Remixer) {
        self.phrases = remixer.result(self.phrases)
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
let repeater = Repeater()
let song = Song(remixer: repeater)

//let song = Song(songType: "normal")
song.line(1)
song.line(2)
song.line(3)
song.recite()
//
//let repeatingSong = Song(songType: "repeat")
//repeatingSong.line(1)
//repeatingSong.line(2)
//repeatingSong.line(3)
//repeatingSong.recite()
//
//let reversingSong = Song(songType: "reverse")
//reversingSong.line(1)
//reversingSong.line(2)
//reversingSong.line(3)
//reversingSong.recite()
