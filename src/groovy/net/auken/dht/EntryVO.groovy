package net.auken.dht

class EntryVO {
    int entryId
    int year
    String regionName
    String description
    String heading
    int divNumber

    EntryVO(Entry entry, Integer key) {
        entryId = entry.id
        year = entry.year
        regionName = entry.region.name
        heading = entry.heading
        description = entry.description
        switch (key) {
            case 2025..1900:
                divNumber = (key - year)
                break
            case 1900..1500:
                divNumber = (key - year) / 2
                break
            case 1500..1000:
                divNumber = (key - year) / 4
                break
            default: break
        }
    }

    @Override
    public String toString() {
        return "$year : $heading"
    }
}