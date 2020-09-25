convenience
hocr: aClient

	^ self new
		client: aClient;
		isHocr: true;
		run.