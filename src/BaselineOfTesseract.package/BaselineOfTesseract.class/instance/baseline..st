baseline
baseline: spec
	<baseline>
	| tesseractBaseDeps |
	tesseractBaseDeps := #('Magritte' "'ResourcesLive'" 'Superuser' 'Tempfile').
	spec for: #common do: [
		spec
			baseline: 'Magritte' with: [
				spec repository: 'github://seandenigris/Magritte' ];
			baseline: 'OSSubprocess' with: [
				spec repository: 'github://pharo-contributions/OSSubprocess' ];			"baseline: 'ResourcesLive' with: [
				spec repository: 'github://seandenigris/ResourcesLive' ];"
			baseline: 'Superuser' with: [
				spec repository: 'github://seandenigris/Superuser' ];
			baseline: 'Tempfile' with: [
				spec repository: 'github://seandenigris/TempfileSt' ].
		spec
			package: 'Tesseract' with: [ 
				spec requires: tesseractBaseDeps copyWith: 'OSSubprocess' ] ].
				
	spec for: #GToolkit do: [
		spec removeProject: 'OSSubprocess'.
		spec 
			package: 'Tesseract' overrides: [ 
				spec requires: tesseractBaseDeps ];
			package: 'Tesseract-Bloc' with: [ spec requires: #('Tesseract') ] ]
