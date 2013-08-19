package net.auken.dht

class Entry {

    String heading
    String description
    Integer year
    static hasMany = [mapLocations: MapLocation]
    static belongsTo = [region: Region]
    static constraints = {
    }

    static mapping = {
        description(type: 'text')
    }

    @Override
    public String toString() {
        return "$year: $heading"
    }

    public String showDescription() {
        return description.length() > 100 ? description.subSequence(0, 100) : description
    }
}
