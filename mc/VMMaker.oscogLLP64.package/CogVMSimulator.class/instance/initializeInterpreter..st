multi-threading simulation switch
initializeInterpreter: bytesToShift
	"This method includes or excludes CoInterpreterMT methods as required.
	 Auto-generated by CogVMSimulator>>ensureMultiThreadingOverridesAreUpToDate"

	^self perform: #initializeInterpreter:
		withArguments: {bytesToShift}
		inSuperclass: (cogThreadManager ifNil: [CoInterpreterPrimitives] ifNotNil: [CoInterpreterMT])