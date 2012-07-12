Ext.define ( "Historiske.view.EventsList", {
    extend: "Ext.dataview.List",
    alias: "widget.eventslist",
    config: {
        loadingText: "Loading events...",
        emptyText: '</pre> <div class="events-list-empty-text">No events found.</div><pre>',
        onItemDisclosure: true,
        itemTpl: Ext.create('Ext.XTemplate', 
                       '<div> <div class="list-item-when">{[this.formatDate(values.when)]}</div>',
                       '<div class="list-item-title">{title}</div> </div>',
                       {
                           formatDate: function(date) {
                              try {
                                  return Ext.Date.format(new Date(date), 'jS M \'y');
                              } catch(e) {
                                  return '';
                              } 
                           }
                       }),
    }
});
