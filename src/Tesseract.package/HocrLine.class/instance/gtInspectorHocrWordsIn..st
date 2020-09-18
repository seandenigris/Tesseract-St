GT-Pharo
gtInspectorHocrWordsIn: composite
        <gtInspectorPresentationOrder: 5>
        ^ composite table
                title: 'Words';
                display: [ self words ];
                column: 'Value' evaluated: #string