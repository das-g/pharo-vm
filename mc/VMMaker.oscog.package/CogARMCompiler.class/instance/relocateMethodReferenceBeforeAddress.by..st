inline cacheing
relocateMethodReferenceBeforeAddress: pc by: delta
	"If possible we generate the method address using pc-relative addressing.
	 If so we don't need to relocate it in code.  So check if pc-relative code was
	 generated, and if not, adjust a long sequence.  There are two cases, a push
	 or a register load.  If a push, then there is a register load, but in the instruction
	 before."
	| pcPreceedingLoad reference |
	pcPreceedingLoad := (self instructionIsPush: (self instructionBeforeAddress: pc))
							ifTrue: [pc - 4]
							ifFalse: [pc].
	"If the load is not done via pc-relative addressing we have to relocate."
	(self isPCRelativeValueLoad: (self instructionBeforeAddress: pcPreceedingLoad)) ifFalse:
		[reference := self extract32BitOperandFrom4InstructionsPreceeding: pcPreceedingLoad.
		 reference := reference + delta.
		 self insert32BitOperand: reference into4InstructionsPreceeding: pcPreceedingLoad]