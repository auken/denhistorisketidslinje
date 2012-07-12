Ext.define('Historiske.model.Event', {
    extend: 'Ext.data.Model',
    config: {
        fields: [
            { name: 'id',          type: 'int' },
            { name: 'title',       type: 'string' },
            { name: 'description', type: 'string' },
            { name: 'when',        type: 'date' },
            { name: 'region',      type: 'string' },
            { name: 'subregion',   type: 'string' },
        ],

        validations: [
            { type: 'presence',    field: 'id' },
            { type: 'presence',    field: 'title' },
            { type: 'presence',    field: 'when' },
            { type: 'presence',    field: 'region' },
        ]
    }
});
