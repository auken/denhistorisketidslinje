package net.auken.dht

class Step {

    String name
    Integer occurrenceOrder
    Integer maxToolBoxEntriesAllowed
    String helpText

    static belongsTo = [game: Game]
    static hasMany = [toolBoxEntries: ToolBoxEntry]

    static constraints = {
        maxToolBoxEntriesAllowed nullable: true
    }

    @Override
    String toString() {
        return name
    }
}
