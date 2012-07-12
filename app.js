Ext.application( {
    name: "Historiske",
    models: ["Event"],
    stores: ["Events"],
    controllers: ["Events"],
    views: ["EventsList", "EventsListContainer", "EventEditor"],
    launch: function() {
        var eventListContainer = {
            xtype: "eventslistcontainer"
        };
        var eventsEditor = {
            xtype: "eventeditor"
        };
        Ext.Viewport.add( [eventListContainer, eventsEditor] );
     }
}); 

