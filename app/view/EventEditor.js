Ext.define("Historiske.view.EventEditor", {
    extend: "Ext.form.Panel",

    requires: "Ext.form.FieldSet",

    alias: "widget.eventeditor",

    config: {
        scrollable: 'vertical',
    },

    initialize: function() {
        this.callParent (arguments);
        var now = new Date();

        var backButton = {
            xtype: "button",
            ui: "back",
            text: "Home",
            handler: this.onBackButtonTap,
            scope: this
        };

        var saveButton = {
            xtype: "button",
            ui: "active",
            text: "Save",
            handler: this.onSaveButtonTap,
            scope: this
        };

        var topToolbar = {
            xtype: "toolbar",
            docked: "top",
            title: "Edit Historical Events",
            items: [
                backButton,
                { xtype: "spacer" },
                saveButton
            ]
        };

        var deleteButton = {
            xtype: "button",
            iconCls: "trash",
            iconMask: true,
            handler: this.onDeleteButtonTap,
            scope: this
        };

        var bottomToolbar = {
            xtype: "toolbar",
            docked: "bottom",
            items: [
                deleteButton
            ]
        };

        var eventTitleEditor = {
            xtype: 'textfield',
            name: 'title',
            label: 'Title',
            required: true
        };
        var eventDescriptionEditor = {
            xtype: 'textareafield',
            name: 'description',
            label: 'Description'
        };
        var eventDatePicker = {
            xtype: 'textfield',
            name: 'when',
            label: 'Event Date',
            required: true,
            placeHolder: 'mm/dd/yyyy',
        };
        var eventRegion = {
            xtype: 'textfield',
            name: 'region',
            label: 'Region',
            required: true
        };
        var eventSubregion = {
            xtype: 'textfield',
            name: 'subregion',
            label: 'Sub-region'
        };
        this.add([
            topToolbar,
            {
                xtype: 'fieldset',
                items: [ eventTitleEditor ,
                         eventDescriptionEditor , 
                         eventDatePicker , 
                         eventRegion , 
                         eventSubregion ]
            },
            bottomToolbar
        ]);
    },
    onSaveButtonTap: function() {
        console.log("onSaveButtonTap");
        this.fireEvent("saveEventCommand", this);
    },
    onDeleteButtonTap: function() {
        console.log("onDeleteButtonTap");
        this.fireEvent("deleteEventCommand", this);
    },
    onBackButtonTap: function() {
        console.log("onBackButtonTap");
        this.fireEvent("homeEventCommand", this);
    },

});

