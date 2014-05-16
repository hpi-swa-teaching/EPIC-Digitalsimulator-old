simulation
drawAsANSIOn: aCanvas
	| p q upperBox lowerBox v leftBox|
	v := ((1 - (3 sqrt / 2)) * self gateBoxANSI width) rounded asInteger.
	upperBox := Rectangle 
				center: self gateBoxANSI bottomLeft 
				extent: (self gateBoxANSI extent + (v@0)) * 2.
	lowerBox := Rectangle 
				center: self gateBoxANSI topLeft 
				extent: (self gateBoxANSI extent + (v@0)) * 2.
	leftBox := Rectangle 
				center: self gateBoxANSI leftCenter - ((self gateBoxANSI width - v ) @ 0)
				extent: (self gateBoxANSI extent + (v@0)) * 2.
	p := EpicPolygon new.
	p 
		addArc: upperBox clippedBy: self gateBoxANSI;
		addArc: lowerBox clippedBy: self gateBoxANSI;
		addPoint: self gateBoxANSI bottomLeft;		
		addReverseArc: leftBox clippedBy: self gateBoxANSI.
	
	q := EpicPolygon new.
	q addArc: leftBox clippedBy: self gateBoxANSI.
	q rotateUntilFirstIsNearestTo: q vertices min.
	
	self drawPolygon: p on: aCanvas.
	
	self drawPolyLine: q vertices - (8@0) on: aCanvas.
	
	aCanvas 
		fillOval: self notDotANSI color: self fillColor;
		frameOval:  self notDotANSI color: Color black.
	
	self inputPorts do: [:eachPort |
		aCanvas 
			line: eachPort center 
			to: (self gateBoxANSI left + 8) @ (eachPort center y)
			color: Color black
	].
	
	aCanvas 
		line: self outputPorts first center 
		to: (self notDotANSI right) @ (self outputPorts first center y)
		color: Color black