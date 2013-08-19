package net.auken.dht

class Game {

    String name
    static hasMany = [steps: Step]

    static constraints = {
    }

    @Override
    String toString() {
        return name
    }
}
