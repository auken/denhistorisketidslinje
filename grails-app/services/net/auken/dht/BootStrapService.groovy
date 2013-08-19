package net.auken.dht

class BootStrapService {

    static transactional = true

    def grailsApplication
    def createRegions() {
        List<String> regionNames = ['Nordamerika', 'Sydamerika', 'Norden', 'Europa', 'Afrika', 'Mellemøsten', 'Australien', 'Kina', 'Sovjet']
        regionNames.each { String regionName ->
            new Region(name: regionName.toUpperCase()).save(failOnError: true)
        }
    }

    def createEntries() {
        File dataFiles = grailsApplication?.parentContext?.getResource("data-files")?.file
        dataFiles.eachFile { File file ->
            List<String> tokenizedFileName = file.name.tokenize("-")*.trim()
            String regionName = tokenizedFileName.get(1).tokenize(" ").get(0)
            Region entryRegion = Region.findByNameIlike(regionName.trim())
            if (entryRegion) {
                Entry entry = new Entry()
                entry.heading = tokenizedFileName.get(0)
                entry.year = tokenizedFileName.get(1).tokenize(" ").get(1).tokenize(".").get(0).toInteger()
                entry.description = file.text
                entry.region = entryRegion
                entry.save(failOnError: true);
                createMapLocation(entry);
            }
        }
    }


    def createRole() {
        Role adminRole = new Role(authority: DhtConstants.ROLE_ADMIN)
        Role userRole = new Role(authority: DhtConstants.ROLE_USER)
        adminRole.save(flush: true, failOnError: true)
        userRole.save(flush: true, failOnError: true)

    }

    def createUser(String username, String password, boolean enable) {
        User user = new User(username: username, password: password, enabled: enable).save(flush: true, failOnError: true)
        assignRole(user)

    }

    def assignRole(User user) {
        Role adminRole = Role.get(1)
        Role userRole = Role.get(2)
        if ((user.username).equals("admin")) {
            UserRole.create(user, adminRole, true)
        } else {
            UserRole.create(user, userRole, true)
        }
    }

    def createGame() {
        Game game = new Game(name: 'GameBoard 1')
        game.save(flush: true)
    }

    def createSteps() {
        Game game = Game.first()
        new Step(name: 'Step 1', maxToolBoxEntriesAllowed: 6, occurrenceOrder: 1, game: game).save(flush: true)
        new Step(name: 'Step 2', maxToolBoxEntriesAllowed: 18, occurrenceOrder: 2, game: game).save(flush: true)
        new Step(name: 'Step 3', maxToolBoxEntriesAllowed: 5, occurrenceOrder: 3, game: game).save(flush: true)
        new Step(name: 'Step 3A', maxToolBoxEntriesAllowed: 5, occurrenceOrder: 4, game: game).save(flush: true)
        new Step(name: 'Step 4', maxToolBoxEntriesAllowed: 13, occurrenceOrder: 5, game: game).save(flush: true)
        new Step(name: 'Step 5', maxToolBoxEntriesAllowed: 10, occurrenceOrder: 6, game: game).save(flush: true)
        new Step(name: 'Step 6', maxToolBoxEntriesAllowed: 10, occurrenceOrder: 7, game: game).save(flush: true)
        new Step(name: 'Step 6A', maxToolBoxEntriesAllowed: 40, occurrenceOrder: 8, game: game).save(flush: true)
    }

    def createToolboxEntries() {
        Step step = Step.findByOccurrenceOrder(1)
        (1..6).each { Integer number ->
            createToolBoxEntry("Historic Period - ${number}", CategoryType.HISTORICAL_PERIOD, step)
        }
        step = Step.findByOccurrenceOrder(2)
        (1..18).each { Integer number ->
            createToolBoxEntry("Some dummy event - ${number}", CategoryType.EVENT, step)
        }
        step = Step.findByOccurrenceOrder(5)
        (1..8).each { Integer number ->
            createToolBoxEntry("Stylistic Culture Style - ${number}", CategoryType.STYLISTIC_STYLE, step)
        }
        (1..5).each { Integer number ->
            createToolBoxEntry("Government Style - ${number}", CategoryType.GOVERNMENT_STYLE, step)
        }
    }

    void createToolBoxEntry(String statement, CategoryType type, Step step) {
        new ToolBoxEntry(statement: statement, type: type, step: step).save(flush: true)
    }

    void createMapLocation(Entry entry) {
        new MapLocation(topPosition: 40, leftPosition: 50, entry: entry, noOfLocation: 1).save(flush: true);
    }

}
