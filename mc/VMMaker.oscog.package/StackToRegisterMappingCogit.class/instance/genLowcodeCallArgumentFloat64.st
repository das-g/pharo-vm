inline primitive generators generated code
genLowcodeCallArgumentFloat64
	<option: #LowcodeVM>	"Lowcode instruction generator"

	self ssNativeTop nativeStackPopToReg: DPFPReg0.
	self ssNativePop: 1.
	self MoveRd: DPFPReg0 M64: -8 r: SPReg.
	self SubCq: 8 R: SPReg.
	currentCallCleanUpSize := currentCallCleanUpSize + 8.

	^ 0
