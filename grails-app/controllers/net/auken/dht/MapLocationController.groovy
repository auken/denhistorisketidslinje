package net.auken.dht

import org.springframework.dao.DataIntegrityViolationException

class MapLocationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [mapLocationInstanceList: MapLocation.list(params), mapLocationInstanceTotal: MapLocation.count()]
    }

    def create() {
        [mapLocationInstance: new MapLocation(params)]
    }

    def save() {
        def mapLocationInstance = new MapLocation(params)
        if (mapLocationInstance.validate()) {
            mapLocationInstance.save(flush: true)
            flash.message = message(code: 'default.created.message', args: [message(code: 'mapLocation.label', default: 'MapLocation'), mapLocationInstance.id])
            redirect(action: "show", id: mapLocationInstance.id)
        } else {
            flash.message = "Enter the value of top position between 0 to 93 and left between 0 to 96"
            render(view: "create", model: [mapLocationInstance: mapLocationInstance, errorMessage: flash.message])
            return
        }
    }

    def show(Long id) {
        def mapLocationInstance = MapLocation.get(id)
        if (!mapLocationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapLocation.label', default: 'MapLocation'), id])
            redirect(action: "list")
            return
        }

        [mapLocationInstance: mapLocationInstance]
    }

    def edit(Long id) {
        def mapLocationInstance = MapLocation.get(id)
        if (!mapLocationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapLocation.label', default: 'MapLocation'), id])
            redirect(action: "list")
            return
        }

        [mapLocationInstance: mapLocationInstance]
    }

    def update(Long id, Long version) {
        def mapLocationInstance = MapLocation.get(id)
        if (!mapLocationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapLocation.label', default: 'MapLocation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mapLocationInstance.version > version) {
                mapLocationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'mapLocation.label', default: 'MapLocation')] as Object[],
                        "Another user has updated this MapLocation while you were editing")
                render(view: "edit", model: [mapLocationInstance: mapLocationInstance])
                return
            }
        }
        mapLocationInstance.properties = params

        if (mapLocationInstance.validate()) {
            mapLocationInstance.save(flush: true)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'mapLocation.label', default: 'MapLocation'), mapLocationInstance.id])
            redirect(action: "show", id: mapLocationInstance.id)
        } else {
            flash.message = "Enter the value of top position between 0 to 93 and left between 0 to 96"
            render(view: "edit", model: [mapLocationInstance: mapLocationInstance, errorMessage: flash.message])
            return
        }
    }

    def delete(Long id) {
        def mapLocationInstance = MapLocation.get(id)
        if (!mapLocationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mapLocation.label', default: 'MapLocation'), id])
            redirect(action: "list")
            return
        }

        try {
            mapLocationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mapLocation.label', default: 'MapLocation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mapLocation.label', default: 'MapLocation'), id])
            redirect(action: "show", id: id)
        }
    }
}
