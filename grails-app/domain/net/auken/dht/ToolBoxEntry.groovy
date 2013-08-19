package net.auken.dht

class ToolBoxEntry {

    String statement
    CategoryType type

    static belongsTo = [step: Step]

    static constraints = {
    }

    @Override
    String toString(){
        return statement
    }
}
