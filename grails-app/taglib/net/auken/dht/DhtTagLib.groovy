package net.auken.dht

class DhtTagLib {

    static namespace = "dht"

    def renderRegionEntries = { attrs ->
        List<Entry> entries = attrs.entries
        Map<Integer, List<Entry>> yearWiseEntries = [:]
        [2025, 2000, 1975, 1950, 1925, 1900, 1850, 1800, 1750, 1700, 1650, 1600, 1550, 1500, 1400, 1300, 1200, 1100, 1000].each {
            yearWiseEntries[it] = []
        }
        entries.each { Entry entry ->
            switch (entry.year) {
                case 2025..2000:
                    yearWiseEntries[2025].add(entry)
                    break
                case 2000..1975:
                    yearWiseEntries[2000].add(entry)
                    break
                case 1975..1950:
                    yearWiseEntries[1975].add(entry)
                    break
                case 1950..1925:
                    yearWiseEntries[1950].add(entry)
                    break
                case 1925..1900:
                    yearWiseEntries[1925].add(entry)
                    break
                case 1900..1850:
                    yearWiseEntries[1900].add(entry)
                    break
                case 1850..1800:
                    yearWiseEntries[1850].add(entry)
                    break
                case 1800..1750:
                    yearWiseEntries[1800].add(entry)
                    break
                case 1750..1700:
                    yearWiseEntries[1750].add(entry)
                    break
                case 1700..1650:
                    yearWiseEntries[1700].add(entry)
                    break
                case 1650..1600:
                    yearWiseEntries[1650].add(entry)
                    break
                case 1600..1550:
                    yearWiseEntries[1600].add(entry)
                    break
                case 1550..1500:
                    yearWiseEntries[1550].add(entry)
                    break
                case 1500..1400:
                    yearWiseEntries[1500].add(entry)
                    break
                case 1400..1300:
                    yearWiseEntries[1400].add(entry)
                    break
                case 1300..1200:
                    yearWiseEntries[1300].add(entry)
                    break
                case 1200..1100:
                    yearWiseEntries[1200].add(entry)
                    break
                case 1100..1000:
                    yearWiseEntries[1100].add(entry)
                    break;
                default: break
            }
        }
        Map<Integer, List<EntryVO>> yearWiseEntryVOs = [:]
        yearWiseEntries.each { key, value ->
            List<EntryVO> entryVOs = []
            value = value.sort { it.year }.reverse()
            value.each { Entry entry ->
                entryVOs.add(new EntryVO(entry, key))
            }
            yearWiseEntryVOs.put(key, entryVOs)
        }
        yearWiseEntryVOs = yearWiseEntryVOs.sort { a, b -> b.key <=> a.key }
        out << g.render(template: "/entry/gridEntry", model: [yearWiseEntryVOs: yearWiseEntryVOs, createEmptyDiv: attrs.cr])
    }
}
