baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [
			spec
				project: 'OSProcess'
				with: [ spec
						className: 'ConfigurationOfOSProcess';
						loads: #('Core with Output');
						versionString: #stable;
						repository: 'http://www.squeaksource.com/MetacelloRepository' ];
				baseline: 'ResourcesLive' with: [
					spec repository: 'github://seandenigris/ResourcesLive:master/src' ];
				baseline: 'Tempfile' with: [
					spec repository: 'github://seandenigris/TempfileSt:master/repository' ].
			spec
				package: 'Tesseract'
					with: [ spec requires: #('OSProcess' 'ResourcesLive' 'Tempfile') ] ]