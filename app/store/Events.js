Ext.define('Historiske.store.Events', {
    extend: 'Ext.data.Store',

    config: {
        model: 'Historiske.model.Event',

        data: [
          {
            id: 1,
            title: 'First struggle for independence',
            description: 'Many small kingdoms revolted against the British Raj.',
            when: new Date( '01/01/1857' ),
            region: 'India',
            subregion: 'New Delhi, Lukhnow, Bihar, etc',
          },
          {
            id: 2,
            title: 'Formaton of Indian National Congress',
            description: 'Indian national congress was the first policial party India had. It played a major role in Indian independence struggle.',
            when: new Date( '01/01/1886' ),
            region: 'India',
            subregion: 'Calcutta',
          },
          {
            id: 3,
            title: 'First world war',
            description: 'First world war breaks in Europe',
            when: new Date( '01/01/1914' ),
            region: 'Europe',
            subregion: 'Germany',
          },
          {
            id: 4,
            title: 'Second world war',
            description: 'Second world war breaks in Europe',
            when: new Date( '01/01/1940' ),
            region: 'Europe',
            subregion: 'Germany',
          }
       ],

       sorters: [{property: 'when', direction: 'DESC'}]
     }
});
