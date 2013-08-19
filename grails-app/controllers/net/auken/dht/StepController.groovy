package net.auken.dht

import org.springframework.dao.DataIntegrityViolationException

class StepController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [stepInstanceList: Step.list(params), stepInstanceTotal: Step.count()]
    }

    def create() {
        [stepInstance: new Step(params)]
    }

    def save() {
        def stepInstance = new Step(params)
        if (!stepInstance.save(flush: true)) {
            render(view: "create", model: [stepInstance: stepInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'step.label', default: 'Step'), stepInstance.id])
        redirect(action: "show", id: stepInstance.id)
    }

    def show(Long id) {
        def stepInstance = Step.get(id)
        if (!stepInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'step.label', default: 'Step'), id])
            redirect(action: "list")
            return
        }

        [stepInstance: stepInstance]
    }

    def edit(Long id) {
        def stepInstance = Step.get(id)
        if (!stepInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'step.label', default: 'Step'), id])
            redirect(action: "list")
            return
        }

        [stepInstance: stepInstance]
    }

    def update(Long id, Long version) {
        def stepInstance = Step.get(id)
        if (!stepInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'step.label', default: 'Step'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (stepInstance.version > version) {
                stepInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'step.label', default: 'Step')] as Object[],
                          "Another user has updated this Step while you were editing")
                render(view: "edit", model: [stepInstance: stepInstance])
                return
            }
        }

        stepInstance.properties = params

        if (!stepInstance.save(flush: true)) {
            render(view: "edit", model: [stepInstance: stepInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'step.label', default: 'Step'), stepInstance.id])
        redirect(action: "show", id: stepInstance.id)
    }

    def delete(Long id) {
        def stepInstance = Step.get(id)
        if (!stepInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'step.label', default: 'Step'), id])
            redirect(action: "list")
            return
        }

        try {
            stepInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'step.label', default: 'Step'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'step.label', default: 'Step'), id])
            redirect(action: "show", id: id)
        }
    }
}
