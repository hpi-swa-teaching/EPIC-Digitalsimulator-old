instance creation
lampPanel
	^ (self new)
		color: Color white;
		addComponent: EpicLamp new;
		addComponent: EpicSevenSegment new;
		addComponent: EpicGraphVisualiser new;
		autoLayout;
		yourself