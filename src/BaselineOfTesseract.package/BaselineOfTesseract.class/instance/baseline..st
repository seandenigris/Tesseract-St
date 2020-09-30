baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Magritte' with: [
				spec repository: 'github://seandenigris/Magritte' ];
			baseline: 'OSSubprocess' with: [
				spec repository: 'github://pharo-contributions/OSSubprocess' ];
			baseline: 'ResourcesLive' with: [
				spec repository: 'github://seandenigris/ResourcesLive' ];
			baseline: 'Superuser' with: [
				spec repository: 'github://seandenigris/Superuser' ];
			baseline: 'Tempfile' with: [
				spec repository: 'github://seandenigris/TempfileSt' ].
		spec
			package: 'Tesseract'
				with: [ spec requires: #('Magritte' 'OSSubprocess' 'ResourcesLive' 'Superuser' 'Tempfile') ] ].
	spec for: #GToolkit do: [
		spec package: 'Tesseract-Bloc' with: [ spec requires: #('Tesseract') ] ]