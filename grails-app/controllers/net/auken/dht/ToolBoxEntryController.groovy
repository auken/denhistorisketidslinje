package net.auken.dht

import org.springframework.dao.DataIntegrityViolationException

class ToolBoxEntryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [toolBoxEntryInstanceList: ToolBoxEntry.list(params), toolBoxEntryInstanceTotal: ToolBoxEntry.count()]
    }

    def create() {
        [toolBoxEntryInstance: new ToolBoxEntry(params)]
    }

    def save() {
        def toolBoxEntryInstance = new ToolBoxEntry(params)
        if (!toolBoxEntryInstance.save(flush: true)) {
            render(view: "create", model: [toolBoxEntryInstance: toolBoxEntryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'toolBoxEntry.label', default: 'ToolBoxEntry'), toolBoxEntryInstance.id])
        redirect(action: "show", id: toolBoxEntryInstance.id)
    }

    def show(Long id) {
        def toolBoxEntryInstance = ToolBoxEntry.get(id)
        if (!toolBoxEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'toolBoxEntry.label', default: 'ToolBoxEntry'), id])
            redirect(action: "list")
            return
        }

        [toolBoxEntryInstance: toolBoxEntryInstance]
    }

    def edit(Long id) {
        def toolBoxEntryInstance = ToolBoxEntry.get(id)
        if (!toolBoxEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'toolBoxEntry.label', default: 'ToolBoxEntry'), id])
            redirect(action: "list")
            return
        }

        [toolBoxEntryInstance: toolBoxEntryInstance]
    }

    def update(Long id, Long version) {
        def toolBoxEntryInstance = ToolBoxEntry.get(id)
        if (!toolBoxEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'toolBoxEntry.label', default: 'ToolBoxEntry'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (toolBoxEntryInstance.version > version) {
                toolBoxEntryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'toolBoxEntry.label', default: 'ToolBoxEntry')] as Object[],
                          "Another user has updated this ToolBoxEntry while you were editing")
                render(view: "edit", model: [toolBoxEntryInstance: toolBoxEntryInstance])
                return
            }
        }

        toolBoxEntryInstance.properties = params

        if (!toolBoxEntryInstance.save(flush: true)) {
            render(view: "edit", model: [toolBoxEntryInstance: toolBoxEntryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'toolBoxEntry.label', default: 'ToolBoxEntry'), toolBoxEntryInstance.id])
        redirect(action: "show", id: toolBoxEntryInstance.id)
    }

    def delete(Long id) {
        def toolBoxEntryInstance = ToolBoxEntry.get(id)
        if (!toolBoxEntryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'toolBoxEntry.label', default: 'ToolBoxEntry'), id])
            redirect(action: "list")
            return
        }

        try {
            toolBoxEntryInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'toolBoxEntry.label', default: 'ToolBoxEntry'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'toolBoxEntry.label', default: 'ToolBoxEntry'), id])
            redirect(action: "show", id: id)
        }
    }
}
