views
gtVisualFor: aView
	<gtView>
	^ aView explicit
		title: 'Visual' translated;
		priority: -8;
		stencil: [ self asElementWithLabels ];
		yourself