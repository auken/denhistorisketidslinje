Ext.define( "Historiske.view.EventsListContainer", {
    extend: "Ext.Container",
    alias: "widget.eventslistcontainer",

    initialize: function() {
        this.callParent(arguments);
        var newButton = {
            xtype: "button",
            text: 'New',
            ui: 'action',
            handler: this.onNewButtonTap,
            scope: this
        };
        var topToolbar = {
            xtype: "toolbar",
            title: 'Den Historiske Tidslinje - List View',
            docked: "top",
            items: [
                { xtype: 'spacer' },
                newButton
            ]
        };
        var eventsList = {
            xtype: "eventslist",
            store: Ext.getStore("Events"),
            listeners: {
                disclose: { fn: this.onEventsListDisclose, scope: this }
            }
        };
        this.add([topToolbar, eventsList]);
    },

    onNewButtonTap: function() {
        console.log("onNewButtonTap");
        this.fireEvent("newEventCommand", this);
    },

    onEventsListDisclose: function(list, record, target, index, evt, options) {
        console.log("onEventsListDisclose");
        this.fireEvent('editEventCommand', this, record);
    },

    config: {
        layout: {
            type: 'fit'
        }
    }
});
