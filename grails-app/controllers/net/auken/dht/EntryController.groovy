package net.auken.dht

import org.springframework.dao.DataIntegrityViolationException

class EntryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }


    def showEntries() {
        List<Entry> northAndSouthAmericaEntries = []
        List<Entry> kinaAndAustralienEntries = []
        Map regionWiseEntries = Entry.list().groupBy {
            it.region.name.toLowerCase()
        }
        northAndSouthAmericaEntries = regionWiseEntries['nordamerika'] ? (regionWiseEntries['sydamerika'] ? (regionWiseEntries['nordamerika'] + regionWiseEntries['sydamerika']) : regionWiseEntries['nordamerika']) : (regionWiseEntries['sydamerika'] ?: null)
        kinaAndAustralienEntries = regionWiseEntries['australien'] ? (regionWiseEntries['kina'] ? (regionWiseEntries['australien'] + regionWiseEntries['kina']) : regionWiseEntries['australien']) : (regionWiseEntries['kina'] ?: null)
        render view: 'showEntries', model: [regionWiseEntries: regionWiseEntries, northAndSouthAmericaEntries: northAndSouthAmericaEntries, kinaAndAustralienEntries: kinaAndAustralienEntries]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [entryInstanceList: Entry.list(params), entryInstanceTotal: Entry.count()]
    }

    def create() {
        [entryInstance: new Entry(params), locationInstance: new MapLocation(params)]
    }

    def save(EntryAndMapLocationCO entryAndMapLocationCO) {

        def entryInstance = new Entry(entryAndMapLocationCO.properties);
        if (!entryInstance.save(flush: true)) {
            render(view: "create", model: [entryInstance: entryInstance])
            return
        }
        int locationSize = entryAndMapLocationCO.noOfLocation as Integer;
        locationSize.times {
            new MapLocation(noOfLocation: entryAndMapLocationCO.noOfLocation, topPosition: entryAndMapLocationCO.topPosition[it], leftPosition: entryAndMapLocationCO.leftPosition[it], entry: entryInstance).save(failOnError: true)
        }
        flash.message = message(code: 'default.created.message', args: [message(code: 'entry.label', default: 'Entry'), entryInstance.id])
        redirect(action: "show", id: entryInstance.id)
    }

    def show(Long id) {
        def entryInstance = Entry.get(id)
        if (!entryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entry.label', default: 'Entry'), id])
            redirect(action: "list")
            return
        }
        [entryInstance: entryInstance]
    }

    def edit(Long id) {
        def entryInstance = Entry.get(id);
        if (!entryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entry.label', default: 'Entry'), id])
            redirect(action: "list")
            return
        }

        [entryInstance: entryInstance]
    }

    def update(Long id, Long version, EntryAndMapLocationCO entryAndMapLocationCO) {
        def entryInstance = Entry.get(id)
        MapLocation mapLocation = MapLocation.findByEntry(entryInstance);
        if (!entryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entry.label', default: 'Entry'), id])
            redirect(action: "list")
            return
        }

        int previousNoOfLocation = mapLocation.noOfLocation;
        if (version != null) {
            if (entryInstance.version > version) {
                entryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'entry.label', default: 'Entry')] as Object[],
                        "Another user has updated this Entry while you were editing")
                render(view: "edit", model: [entryInstance: entryInstance])
                return
            }
        }
        entryInstance.properties = entryAndMapLocationCO.properties
        int noOfLocation = entryAndMapLocationCO.noOfLocation
        int differenceInNoOfLocation = noOfLocation - previousNoOfLocation
        if (noOfLocation <= previousNoOfLocation) {
            noOfLocation.times {
                mapLocation.topPosition = entryAndMapLocationCO.topPosition[it]
                mapLocation.leftPosition = entryAndMapLocationCO.leftPosition[it]
                mapLocation.entry = entryInstance
                mapLocation.noOfLocation = entryAndMapLocationCO.noOfLocation
            }
        } else {
            noOfLocation.times {
                mapLocation.topPosition = entryAndMapLocationCO.topPosition[it]
                mapLocation.leftPosition = entryAndMapLocationCO.leftPosition[it]
                mapLocation.entry = entryInstance
                mapLocation.noOfLocation = entryAndMapLocationCO.noOfLocation
            }
            differenceInNoOfLocation.times {
                new MapLocation(noOfLocation: entryAndMapLocationCO.noOfLocation, topPosition: entryAndMapLocationCO.topPosition[it], leftPosition: entryAndMapLocationCO.leftPosition[it], entry: entryInstance).save(failOnError: true)
            }
        }

        if (!entryInstance.save(flush: true) && (!mapLocation.save(flush: true))) {
            render(view: "edit", model: [entryInstance: entryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'entry.label', default: 'Entry'), entryInstance.id])
        redirect(action: "show", id: entryInstance.id)
    }

    def delete(Long id) {
        def entryInstance = Entry.get(id)
        if (!entryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entry.label', default: 'Entry'), id])
            redirect(action: "list")
            return
        }

        try {
            entryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'entry.label', default: 'Entry'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'entry.label', default: 'Entry'), id])
            redirect(action: "show", id: id)
        }
    }
}
