package net.auken.dht

class MapLocation {
    Integer noOfLocation
    Integer topPosition
    Integer leftPosition
    static belongsTo = [entry: Entry]
    static constraints = {
        topPosition range: (0..93)
        leftPosition range: (0..96)
    }
}
