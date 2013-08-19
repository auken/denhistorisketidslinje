package net.auken.dht

public enum CategoryType {
    HISTORICAL_PERIOD('Historical Period'),
    STYLISTIC_STYLE('Stylistic Style'),
    GOVERNMENT_STYLE('Government Style'),
    EVENT('Event'),
    OTHERS('Others')

    String name

    public boolean isHistoricalPeriod() {
        return this.equals(CategoryType.HISTORICAL_PERIOD)
    }

    public boolean isCultureStyle() {
        return this.equals(CategoryType.STYLISTIC_STYLE)
    }

    public boolean isGovernmentStyle() {
        return this.equals(CategoryType.GOVERNMENT_STYLE)
    }

    public boolean isEvent() {
        return this.equals(CategoryType.EVENT)
    }

    public boolean isOthers() {
        return this.equals(CategoryType.OTHERS)
    }

    CategoryType(String type) {
        this.name = type
    }
}