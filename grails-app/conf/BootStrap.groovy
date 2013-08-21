import net.auken.dht.*

class BootStrap {

    def bootStrapService

    def init = { servletContext ->
        if (!Region.count) {
            log.info "Creating Regions ..."
            bootStrapService.createRegions()
        }
        if (!Entry.count) {
            log.info "Creating Entries ..."
            bootStrapService.createEntries()
        }

        if (!Role.count) {
            bootStrapService.createRole()
            bootStrapService.createUser("admin", "admin", true)
            bootStrapService.createUser("esben", "esben123", true)
            bootStrapService.createUser("axel", "axel123", true)
            bootStrapService.createUser("lasse", "lasse123", true)
            bootStrapService.createUser("jonas", "jonas123", true)
        }

        if (!Game.count) {
            bootStrapService.createGame()
            bootStrapService.createSteps()
            bootStrapService.createToolboxEntries()
        }

        /*if (!MapLocation.count) {
            bootStrapService.createLocation()
        }*/
    }

    def destroy = {
    }
}
