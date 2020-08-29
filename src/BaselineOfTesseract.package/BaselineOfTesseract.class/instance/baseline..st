baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [
			spec
				baseline: 'OSSubprocess' with: [
					spec repository: 'github://pharo-contributions/OSSubprocess' ];
				baseline: 'ResourcesLive' with: [
					spec repository: 'github://seandenigris/Resources-Live' ];
				baseline: 'Tempfile' with: [
					spec repository: 'github://seandenigris/TempfileSt' ].
			spec
				package: 'Tesseract'
					with: [ spec requires: #('OSSubprocess' 'ResourcesLive' 'Tempfile') ] ]