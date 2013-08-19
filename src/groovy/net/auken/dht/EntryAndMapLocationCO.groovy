package net.auken.dht

import grails.validation.Validateable

@Validateable
class EntryAndMapLocationCO {

    String heading
    String description
    Integer year
    List<Integer> topPosition
    List<Integer> leftPosition
    Integer noOfLocation
    Region region

    static constraints = {
        topPosition range: (0..93)
        leftPosition range: (0..96)
    }
}