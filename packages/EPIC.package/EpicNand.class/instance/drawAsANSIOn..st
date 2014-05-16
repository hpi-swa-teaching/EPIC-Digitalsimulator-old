simulation
drawAsANSIOn: aCanvas
	| p leftBox rightBox |
	leftBox := Rectangle 
				origin: self gateBoxANSI topLeft 
				extent: self gateBoxANSI extent / (2@1). 
	rightBox := Rectangle 
				origin: self gateBoxANSI topCenter 
				extent: self gateBoxANSI extent / (2@1). 
	p := EpicPolygon new.
	p 
		addPoint: leftBox bottomRight;
		addPoint: leftBox bottomLeft;
		addPoint: leftBox topLeft;
		addPoint: leftBox topRight;
		addArc: self gateBoxANSI clippedBy: rightBox.
	
	self drawPolygon: p on: aCanvas.
	aCanvas 
		fillOval: self notDotANSI color: self fillColor;
		frameOval:  self notDotANSI color: Color black.
	
	
	self inputPorts do: [:eachPort |
		aCanvas 
			line: eachPort center 
			to: (self gateBoxANSI left) @ (eachPort center y)
			color: Color black
	].
	
	aCanvas 
		line: self outputPorts first center 
		to: (self notDotANSI right) @ (self outputPorts first center y)
		color: Color black
	