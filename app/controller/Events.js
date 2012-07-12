Ext.define("Historiske.controller.Events", {
    extend: "Ext.app.Controller",

    config: {
        refs: {
            eventsListContainer: "eventslistcontainer",
            eventEditor: "eventeditor"
        },
        control: {
            eventsListContainer: {
                newEventCommand: "onNewEventCommand",
                editEventCommand: "onEditEventCommand"
            },
            eventEditor: {
                saveEventCommand: "onSaveEventCommand",
                deleteEventCommand: "onDeleteEventCommand",
                homeEventCommand: "onHomeEventCommand",
            }
        }
    },

    onNewEventCommand: function() {
        var now = new Date();
        var eventId = (now.getTime()).toString() + (this.getRandomInt(0,100)).toString();
        var record = Ext.create("Historiske.model.Event", { id: eventId });
        this.activateEventEditor(record);
    },

    onEditEventCommand: function(list, record) {
        this.activateEventEditor(record);
    },

    onSaveEventCommand: function() {
        console.log("onSaveEventCommand");
        var eventEditor = this.getEventEditor();
        var currentEvent = eventEditor.getRecord();
        var newValues = eventEditor.getValues(); 
        currentEvent.set("title", newValues.title);
        currentEvent.set("description", newValues.description);
        currentEvent.set("when", newValues.when);
        currentEvent.set("region", newValues.region);
        currentEvent.set("subregion", newValues.subregion);
        var errors = currentEvent.validate();
        if ( !errors.isValid() ) {
            Ext.Msg.alert('Wait!', errors.getByField("title")[0].getMessage(),
                                   Ext.emptyFn);
            currentEvent.reject();
            return;
        }
        var eventStore = Ext.getStore("Events");
        if (null == eventStore.findRecord('id', eventStore.data.id)) {
            eventStore.add(currentEvent);
        }
        eventStore.sync();
        eventStore.sort([{ property: 'when', direction: 'DESC'}]);
        this.activateEventList();
    },

    onDeleteEventCommand: function() {
        console.log("onDeleteEventCommand");
        var eventEditor = this.getEventEditor();
        var currentEvent = eventEditor.getRecord();
        var eventStore = Ext.getStore("Events");
        eventStore.remove( currentEvent );
        eventStore.sync();
        this.activateEventList(); 
    },

    onHomeEventCommand: function() {
        this.activateEventList();
    },

    launch: function() {
        this.callParent(arguments);
        Ext.getStore("Events").load();
        console.log("launch");
    },

    activateEventEditor: function(record) {
        var eventEditor = this.getEventEditor();
        eventEditor.setRecord(record);
        Ext.Viewport.animateActiveItem(eventEditor, 
                            this.slideLeftTransition);
    },

    activateEventList: function() {
        Ext.Viewport.animateActiveItem(this.getEventsListContainer(),
                                       this.slideRightTransition);
    },

    slideLeftTransition: { type: 'slide', direction: 'left' },
    slideRightTransition: { type: 'slide', direction: 'right' },

    getRandomInt: function(min, max) {
        return Math.floor(Math.random() * (max-min+1)) + min;
    }
}); 
