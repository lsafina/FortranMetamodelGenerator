"
Generate entities in the Fast-Fortran-Entities package.

Uses generate method of the parent FamixMetamodelGenerator class
"
Class {
	#name : #FASTFortranGenerator,
	#superclass : #FASTMetamodelGenerator,
	#instVars : [
		'fortranAssignementExpression',
		'tWithAssigneable',
		'tAssigneable',
		'tFortranExpression',
		'tWithFortranExpression',
		'addition',
		'subtraction',
		'multiplication',
		'division',
		'exponentiation',
		'concatenation',
		'gt',
		'gte',
		'lt',
		'lte',
		'eq',
		'xOr',
		'and',
		'equivalent',
		'notEquivalent',
		'binCustom',
		'ne',
		'or',
		'fortranArithmeticTypeExpression',
		'fortranCharacterTypeExpression',
		'fortranLogicalTypeExpression',
		'fortranVariable',
		'fortranLoopControlExpression',
		'fortranStatementAccept',
		'fortranStatementAssign',
		'fortranStatementAutomatic',
		'fortranStatementBackspace',
		'fortranStatementBlockData',
		'fortranStatementByte',
		'fortranStatementCall',
		'fortranStatementCharacter',
		'fortranStatementClose',
		'fortranStatementCommon',
		'fortranStatementComplex',
		'fortranStatementContinue',
		'fortranStatementData',
		'fortranStatementDecode',
		'fortranStatementEncode',
		'fortranStatementDimension',
		'fortranStatementDo',
		'fortranStatementDoWhile',
		'fortranStatementDoubleComplex',
		'fortranStatementDoublePrecision',
		'fortranStatementElse',
		'fortranStatementElseIf',
		'fortranStatementEnd',
		'fortranStatementEndDo',
		'fortranStatementEndFile',
		'fortranStatementEndIf',
		'fortranStatementEndMap',
		'fortranStatementEndStructure',
		'fortranStatementEndUnion',
		'fortranStatementEntry',
		'fortranStatementEquivalence',
		'fortranStatementExternal',
		'fortranStatementFormat',
		'fortranStatementGoToAssigned',
		'fortranStatementGoToComputed',
		'fortranStatementGoToUnconditional',
		'fortranStatementIfArithmetic',
		'fortranStatementIfBlock',
		'fortranStatementIfLogical',
		'fortranStatementImplicit',
		'fortranStatementInclude',
		'fortranStatementInquire',
		'fortranStatementInteger',
		'fortranStatementIntrinsic',
		'fortranStatementLogical',
		'fortranStatementMap',
		'fortranStatementNameList',
		'fortranStatementOpen',
		'fortranStatementOptions',
		'fortranStatementParameter',
		'fortranStatementPause',
		'fortranStatementPointer',
		'fortranStatementPrint',
		'fortranStatementProgram',
		'fortranStatementRead',
		'fortranStatementReal',
		'fortranStatementRecord',
		'fortranStatementReturn',
		'fortranStatementRewind',
		'fortranStatementSave',
		'fortranStatementStatic',
		'fortranStatementStop',
		'fortranStatementStructure',
		'fortranStatementSoubroutine',
		'fortranStatementType',
		'fortranStatementUnion',
		'fortranStatementVirtual',
		'fortranStatementVolatile',
		'fortranStatementWrite',
		'fortranStatement',
		'tFortranTerminalStatement',
		'tFortranNotStandardFeatures',
		'tFortranExecutableStatement',
		'fortranStatementGoTo',
		'tFortranNotExecutableStatement',
		'fortranStatementFunction',
		'fortranStatementPragma',
		'tFortranProcedure',
		'fortranConstant',
		'fortranConstantArithmetic',
		'fortranConstantCharacter',
		'fortranConstantLogical',
		'fortranConstantComplex',
		'tWithSymbolicName',
		'fortranArray',
		'fortranStructure',
		'fortranRecord',
		'fortranRecordField',
		'fortranSubstring'
	],
	#category : #'FAST-Fortran-Generator'
}

{ #category : #generation }
FASTFortranGenerator class >> generate [

	"TODO: can it be removed? As FamixMetamodelGenerator class has generate"

	<script>
	^ super generate
]

{ #category : #accessing }
FASTFortranGenerator class >> packageName [

	^ #'FAST-Fortran-Model'
]

{ #category : #accessing }
FASTFortranGenerator class >> prefix [

	^ #FASTFortran
]

{ #category : #accessing }
FASTFortranGenerator class >> submetamodels [

	^ { FASTMetamodelGenerator }
]

{ #category : #definition }
FASTFortranGenerator >> defineClasses [

	super defineClasses.

	self defineStatements.
	self defineTypes.
	self defineExpressions.
	self defineDataItems.

	"from FAST"
	entity := self remoteEntity: #Entity withPrefix: #FAST
]

{ #category : #'private - definition' }
FASTFortranGenerator >> defineClassesBinariesOps [
	addition := builder newClassNamed: #Addition.
	subtraction := builder newClassNamed: #Subtraction.
	multiplication := builder newClassNamed: #Multiplication.
	division := builder newClassNamed: #Division.
	exponentiation := builder newClassNamed: #Exponentiation.
	concatenation := builder newClassNamed: #Concatenation.
	gt := builder newClassNamed: #GT.
	gte := builder newClassNamed: #GTE.
	lt := builder newClassNamed: #LT.
	lte := builder newClassNamed: #LTE.
	eq := builder newClassNamed: #EQ.
	ne := builder newClassNamed: #NE.
	or := builder newClassNamed: #Or.
	xOr := builder newClassNamed: #XOr.
	and := builder newClassNamed: #And.
	equivalent := builder newClassNamed: #Equivalent.
	notEquivalent := builder newClassNamed: #NotEquivalent.
	binCustom := builder newClassNamed: #BinCustom.

]

{ #category : #definition }
FASTFortranGenerator >> defineConstants [

	"A literal constant is a datum whose value cannot change throughout the program unit. The form of the string representing a constant determines the value and data type of the constant. (For a named constant, defined by a PARAMETER statement, the name defines the data type.)There are three general kinds of constants: Arithmetic, Logical, Character"

	fortranConstant := builder
		                   newClassNamed: #Constant
		                   comment: 'I represent Fortran Constant statement'.

	fortranConstantArithmetic := builder
		                             newClassNamed: #ConstantArithmetic
		                             comment:
		                             'I represent Fortran Arithmetic Constant statement'.

	fortranConstantCharacter := builder
		                            newClassNamed: #ConstantCharacter
		                            comment:
		                            'I represent Fortran Character Constant statement'.

	fortranConstantLogical := builder
		                          newClassNamed: #ConstantLogical
		                          comment:
		                          'I represent Fortran Logical Constant statement'.
		
	fortranConstantComplex := builder
		                          newClassNamed: #ConstantComplex
		                          comment:
		                          'I represent Fortran Arithmetic Complex Constant statement'
]

{ #category : #definition }
FASTFortranGenerator >> defineDataItems [

	fortranVariable := builder
		                   newClassNamed: #Variable
		                   comment: 'I represent Fortran Variable'.

	fortranArray := builder
		                newClassNamed: #Array
		                comment: 'I represent Fortran Array'.

	fortranSubstring := builder
		                    newClassNamed: #Substring
		                    comment: 'I represent Fortran Substring'.

	fortranStatementPointer := builder
		                           newClassNamed: #StatementPointer
		                           comment:
		                           'I represent Fortran Pointer statement'.

	fortranStatementRecord := builder
		                          newClassNamed: #StatementRecord
		                          comment:
		                          'I represent Fortran Record statement'.

	fortranRecordField := builder
		                      newClassNamed: #RecordField
		                      comment: 'I represent Fortran RecordField'.

	fortranStatementStructure := builder
		                             newClassNamed: #StatementStructure
		                             comment:
		                             'I represent Fortran Structure statement'.

]

{ #category : #definition }
FASTFortranGenerator >> defineDataTypes [

	"according to the specification, types are statements too. we extract them to the separate method for our convenience"

	fortranStatementType := builder
		                        newClassNamed: #StatementType
		                        comment:
		                        'I represent Fortran Type statement'.

	fortranStatementByte := builder
		                        newClassNamed: #StatementByte
		                        comment:
			                        'I represent Fortran Byte statement. The BYTE data type provides a data type that uses only one byte of storage. It is a logical data type, and has the synonym,
LOGICAL*1. A variable of type BYTE can hold any of the following: 1)one character, 2)an integer between -128 and 127, 3)the logical values, .TRUE. or .FALSE. If it is interpreted as a logical value, a value of 0 represents .FALSE., and any other value is interpreted as .TRUE.
f77 allows the BYTE type as an array index, just as it allows the REAL type, but it does not allow BYTE as a DO loop index (where it allows only INTEGER, REAL, and DOUBLE PRECISION). Wherever the compiler expects INTEGER explicitly, it will not allow BYTE.'.

	fortranStatementCharacter := builder
		                             newClassNamed: #StatementCharacter
		                             comment:
		                             'I represent Fortran Character statement. The character data type, CHARACTER, which has the synonym, CHARACTER*1, holds one character. The character is enclosed in apostrophes ('') or quotes ("). @ Allowing quotes (") is nonstandard; if you compile with the -xl option, quotes mean something else, and you must use apostrophes to enclose a string. The data of type CHARACTER is always unsigned. A CHARACTER item occupies 1 byte (8 bits) of storage and is aligned on 1-byte boundaries.'.

	fortranStatementComplex := builder
		                           newClassNamed: #StatementComplex
		                           comment:
		                           'I represent Fortran Complex statement. A complex datum is an approximation of a complex number. The complex data type, COMPLEX, which defaults to a synonym for COMPLEX*8, is a pair of REAL*4 values that represent a complex number. The first element represents the real part and the second represents the imaginary part.The default size for a COMPLEX item (no size specified) is 8 bytes. The default alignment is on 4-byte boundaries. However, these defaults can be changed by compiling with certain special options'.

	fortranStatementDoubleComplex := builder
		                                 newClassNamed:
		                                 #StatementDoubleComplex
		                                 comment:
		                                 'I represent Fortran Double Complex statement. The complex data type, DOUBLE COMPLEX, which usually has the synonym, COMPLEX*16, is a pair of DOUBLE PRECISION (REAL*8)values that represents a complex number. The first element represents the real part; the second represents the imaginary part.The default size for DOUBLE COMPLEX with no size specified is 16.'.

	fortranStatementDoublePrecision := builder
		                                   newClassNamed:
		                                   #StatementDoublePrecision
		                                   comment:
		                                   'I represent Fortran Double Precision statement. A double-precision datum is an approximation of a real number. The double-precision data type, DOUBLE PRECISION, which has the synonym, REAL*8, holds one double-precision datum.The default size for DOUBLE PRECISION with no size specified is 8 bytes.A DOUBLE PRECISION element has a sign bit, an 11-bit exponent, and a 52-bit fraction. These DOUBLE PRECISION elements in f77 conform to the IEEE standard for double-precision floating-point data.'.

	fortranStatementInteger := builder
		                           newClassNamed: #StatementInteger
		                           comment:
			                           'I represent Fortran Integer statement. The integer data type, INTEGER, holds a signed integer.
The default size for INTEGER with no size specified is 4, and is aligned on 4-byte boundaries. However, these defaults can be
changed by compiling with certain special options.'.

	fortranStatementLogical := builder
		                           newClassNamed: #StatementLogical
		                           comment:
		                           'I represent Fortran Logical statement. The logical data type, LOGICAL, holds a logical value .TRUE. or .FALSE. The value 0 represents .FALSE.; any other value represents .TRUE.The usual default size for an LOGICAL item with no size specified is 4, and is aligned on 4-byte boundaries. However, these defaults can be changed by compiling with certain special options.'.

	fortranStatementReal := builder
		                        newClassNamed: #StatementReal
		                        comment:
		                        'I represent Fortran Real statement. A real datum is an approximation of a real number. The real data type, REAL, which usually has the synonym, REAL*4, holds one real datum.The usual default size for a REAL item with no size specified is 4 bytes, and is aligned on 4-byte boundaries. However, these defaults can be changed by compiling with certain special options.A REAL element has a sign bit, an 8-bit exponent, and a 23-bit fraction. These REAL elements in f77 conform to the IEEE standard.'
]

{ #category : #definition }
FASTFortranGenerator >> defineExpressions [

	"Expressions"

	expression := self remoteEntity: #Expression withPrefix: #FAST.
	fortranArithmeticTypeExpression := builder
		                                   newClassNamed:
		                                   #ArithmeticTypeExpression
		                                   comment:
		                                   self commentForExpression.
	fortranCharacterTypeExpression := builder
		                                  newClassNamed:
		                                  #CharacterTypeExpression
		                                  comment: self commentForExpression.
	fortranLogicalTypeExpression := builder
		                                newClassNamed:
		                                #LogicalTypeExpression
		                                comment: self commentForExpression.
	fortranLoopControlExpression := builder newClassNamed:
		                                #LoopControlExpression
]

{ #category : #definition }
FASTFortranGenerator >> defineHierarchy [

	super defineHierarchy.
	
	"can have symbolic name. 
	TODO: Not sure if it is inheritance or composition (depends if symbolic name was already declared)
	TODO: not fully populated"
	
	fortranVariable --|> tWithSymbolicName. 
	fortranArray --|> tWithSymbolicName.
	fortranStructure --|> tWithSymbolicName.
	fortranRecord --|> tWithSymbolicName.
	fortranRecordField --|> tWithSymbolicName.
	fortranStatementBlockData --|> tWithSymbolicName.
	fortranStatementSoubroutine --|> tWithSymbolicName.
	fortranStatementFunction --|> tWithSymbolicName.
	fortranStatementEntry --|> tWithSymbolicName.
	fortranStatementNameList --|> tWithSymbolicName.
	
	"constants"
	fortranConstantArithmetic --|> fortranConstant. 
	fortranConstantLogical --|> fortranConstant. 
	fortranConstantCharacter --|> fortranConstant.
	fortranConstantComplex --|> fortranConstantArithmetic.
	
	"fortran procedures"
	fortranStatementFunction --|> tFortranProcedure.
	fortranStatementSoubroutine --|> tFortranProcedure.
	
	"fortran executable statements"
	fortranStatementAccept --|> tFortranExecutableStatement. 
	fortranStatementAssign --|> tFortranExecutableStatement.
	fortranStatementBackspace --|> tFortranExecutableStatement.
	fortranStatementAccept --|> tFortranExecutableStatement.
	fortranStatementCall --|> tFortranExecutableStatement.
	fortranStatementClose --|> tFortranExecutableStatement.
	fortranStatementAccept --|> tFortranExecutableStatement.
	fortranStatementContinue --|> tFortranExecutableStatement.
	fortranStatementDecode --|> tFortranExecutableStatement.
	fortranStatementDo --|> tFortranExecutableStatement.
	fortranStatementDoWhile --|> tFortranExecutableStatement.
	fortranStatementElse --|> tFortranExecutableStatement.
	fortranStatementElseIf --|> tFortranExecutableStatement.
	fortranStatementEncode --|> tFortranExecutableStatement.
	fortranStatementEnd --|> tFortranExecutableStatement.
	fortranStatementEndDo --|> tFortranExecutableStatement.
	fortranStatementEndFile --|> tFortranExecutableStatement.
	fortranStatementEndIf --|> tFortranExecutableStatement.
	fortranStatementGoTo --|> tFortranExecutableStatement.
	fortranStatementGoToAssigned --|> tFortranExecutableStatement.
	fortranStatementGoToComputed --|> tFortranExecutableStatement.
	fortranStatementGoToUnconditional --|> tFortranExecutableStatement.
	fortranStatementIfArithmetic --|> tFortranExecutableStatement.
	fortranStatementIfBlock --|> tFortranExecutableStatement.
	fortranStatementIfLogical --|> tFortranExecutableStatement.
	fortranStatementInquire --|> tFortranExecutableStatement.
	fortranStatementOpen --|> tFortranExecutableStatement.
	fortranStatementPause --|> tFortranExecutableStatement.
	fortranStatementPrint --|> tFortranExecutableStatement.
	fortranStatementReturn --|> tFortranExecutableStatement.
	fortranStatementRewind --|> tFortranExecutableStatement.
	fortranStatementStatic --|> tFortranExecutableStatement.
	fortranStatementStop --|> tFortranExecutableStatement.
	fortranStatementWrite --|> tFortranExecutableStatement.
	
	"fortran not executable statements"
	fortranStatementAutomatic  --|> tFortranNotExecutableStatement.
	fortranStatementBlockData --|> tFortranNotExecutableStatement.
	fortranStatementByte --|> tFortranNotExecutableStatement.
	fortranStatementCharacter --|> tFortranNotExecutableStatement.
	fortranStatementCommon --|> tFortranNotExecutableStatement.
	fortranStatementComplex --|> tFortranNotExecutableStatement.	
	fortranStatementData --|> tFortranNotExecutableStatement.
	fortranStatementDimension --|> tFortranNotExecutableStatement.
	fortranStatementDoubleComplex --|> tFortranNotExecutableStatement.
	fortranStatementDoublePrecision --|> tFortranNotExecutableStatement.
	fortranStatementEndStructure --|> tFortranNotExecutableStatement.	
	fortranStatementEndUnion --|> tFortranNotExecutableStatement.
	fortranStatementEntry --|> tFortranNotExecutableStatement.
	fortranStatementEquivalence --|> tFortranNotExecutableStatement.
	fortranStatementExternal --|> tFortranNotExecutableStatement.
	fortranStatementFormat --|> tFortranNotExecutableStatement.	
	fortranStatementFunction --|> tFortranNotExecutableStatement.
	fortranStatementImplicit --|> tFortranNotExecutableStatement.
	fortranStatementInclude --|> tFortranNotExecutableStatement.
	fortranStatementInteger --|> tFortranNotExecutableStatement.
	fortranStatementIntrinsic --|> tFortranNotExecutableStatement.	
	fortranStatementLogical --|> tFortranNotExecutableStatement.
	fortranStatementMap --|> tFortranNotExecutableStatement.
	fortranStatementNameList --|> tFortranNotExecutableStatement.
	fortranStatementOptions --|> tFortranNotExecutableStatement.
	fortranStatementParameter --|> tFortranNotExecutableStatement.	
	fortranStatementPointer --|> tFortranNotExecutableStatement.	
	fortranStatementPragma --|> tFortranNotExecutableStatement.	
	fortranStatementProgram --|> tFortranNotExecutableStatement.	
	fortranStatementReal --|> tFortranNotExecutableStatement.	
	fortranStatementRecord --|> tFortranNotExecutableStatement.	
	fortranStatementSave --|> tFortranNotExecutableStatement.	
	fortranStatementStructure --|> tFortranNotExecutableStatement.	
	fortranStatementSoubroutine --|> tFortranNotExecutableStatement.	
	fortranStatementType --|> tFortranNotExecutableStatement.	
	fortranStatementUnion --|> tFortranNotExecutableStatement.	
	fortranStatementVirtual --|> tFortranNotExecutableStatement.	
	fortranStatementVolatile --|> tFortranNotExecutableStatement.	
	
	"fortran non-standard features"
	fortranStatementByte --|> tFortranNotStandardFeatures.	
	fortranStatementDoubleComplex --|> tFortranNotStandardFeatures.	

]

{ #category : #definition }
FASTFortranGenerator >> defineProperties [
	super defineProperties.
	
	"constants"
	(fortranConstant property: #type type: #String) comment: 'Determines the constant type'.
	(fortranConstant property: #value type: #String) comment: 'Determines the constant value'.
	(fortranConstantArithmetic property: #isTyped type: #Boolean) comment: 'Determines if the constant typed or typeless'.
	(fortranConstantArithmetic property: #isSigned type: #Boolean) comment: 'Determines if the constant signed or not'.
	(fortranConstantArithmetic property: #sign type: #Integer) comment: 'Determines the arithmetic constant sign'.
	
]

{ #category : #definition }
FASTFortranGenerator >> defineRelations [

	super defineRelations.

	((fortranAssignementExpression property: #expression) comment:
		 'Expression that is being assigned upon declaration to the var')
	<>-
		((expression property: #fortranAssignementExpressionOwner) comment:
			 'The fortranAssignementExpression owner (if possible)').

	((tWithAssigneable property: #variable) comment: 'My variable')
	<>-
		((tAssigneable property: #fortranVariableAssignementOwner) comment:
			 'The owner of the modifier').
	
((tWithFortranExpression property: #variable) comment: 'My variable')
	<>- ((tFortranExpression property: #fortranVariableAssignementOwner) comment:
			 'The owner of the modifier').
]

{ #category : #'private - definition' }
FASTFortranGenerator >> defineStatements [

	"fortranStatementBlock := builder newClassNamed: #StatementBlock comment: 'I represent Fortran statement block'.
	--> not sure if it is the same entity as block data, need to inquire"

	fortranStatement := self remoteEntity: #Statement withPrefix: #FAST.

	fortranStatementAccept := builder
		                          newClassNamed: #StatementAccept
		                          comment:
		                          'I represent Fortran accept statement'.
	fortranStatementAssign := builder
		                          newClassNamed: #StatementAssign
		                          comment:
		                          'I represent Fortran Assign statement'.
	fortranStatementAutomatic := builder
		                             newClassNamed: #StatementAutomatic
		                             comment:
		                             'I represent Fortran Automatic statement'.
	fortranStatementBackspace := builder
		                             newClassNamed: #StatementBackspace
		                             comment:
		                             'I represent Fortran Backspace statement'.
	fortranStatementBlockData := builder
		                             newClassNamed: #StatementBlockData
		                             comment:
		                             'I represent Fortran BlockData statement'.
	fortranStatementCall := builder
		                        newClassNamed: #StatementCall
		                        comment:
		                        'I represent Fortran Call statement'.
	fortranStatementClose := builder
		                         newClassNamed: #StatementClose
		                         comment:
		                         'I represent Fortran Close statement'.
	fortranStatementCommon := builder
		                          newClassNamed: #StatementCommon
		                          comment:
		                          'I represent Fortran Common statement'.
	fortranStatementContinue := builder
		                            newClassNamed: #StatementContinue
		                            comment:
		                            'I represent Fortran Continue statement'.
	fortranStatementData := builder
		                        newClassNamed: #StatementData
		                        comment: 'I represent FortranData statement'.
	fortranStatementDecode := builder
		                          newClassNamed: #StatementDecode
		                          comment:
		                          'I represent Fortran Decode statement'.
	fortranStatementEncode := builder
		                          newClassNamed: #StatementEncode
		                          comment:
		                          'I represent Fortran Encode statement'.
	fortranStatementDimension := builder
		                             newClassNamed: #Statement
		                             comment:
		                             'I represent FortranDimension statement'.
	fortranStatementDo := builder
		                      newClassNamed: #StatementDo
		                      comment: 'I represent Fortran Do statement'.
	fortranStatementDoWhile := builder
		                           newClassNamed: #StatementDoWhile
		                           comment:
		                           'I represent Fortran Do While statement'.
	fortranStatementElse := builder
		                        newClassNamed: #StatementElse
		                        comment:
		                        'I represent Fortran Else statement'.
	fortranStatementElseIf := builder
		                          newClassNamed: #StatementElseIf
		                          comment:
		                          'I represent Fortran Else If statement'.
	fortranStatementEnd := builder
		                       newClassNamed: #StatementEnd
		                       comment: 'I represent Fortran End statement'.
	fortranStatementEndDo := builder
		                         newClassNamed: #StatementEndDo
		                         comment:
		                         'I represent Fortran End Do or ENDDO statement'.
	fortranStatementEndFile := builder
		                           newClassNamed: #StatementEndFile
		                           comment:
		                           'I represent Fortran End File statement'.
	fortranStatementEndIf := builder
		                         newClassNamed: #StatementEndIf
		                         comment:
		                         'I represent Fortran End If statement'.
	fortranStatementEndMap := builder
		                          newClassNamed: #StatementEndMap
		                          comment:
		                          'I represent Fortran End Map statement'.
	fortranStatementEndStructure := builder
		                                newClassNamed:
		                                #StatementEndStructure
		                                comment:
		                                'I represent Fortran End Structure statement'.
	fortranStatementEndUnion := builder
		                            newClassNamed: #StatementEndUnion
		                            comment:
		                            'I represent Fortran End Union statement'.
	fortranStatementEntry := builder
		                         newClassNamed: #StatementEntry
		                         comment:
		                         'I represent Fortran Entry statement'.
	fortranStatementEquivalence := builder
		                               newClassNamed: #StatementEquivalence
		                               comment:
		                               'I represent Fortran Equivalence statement'.
	fortranStatementExternal := builder
		                            newClassNamed: #StatementExternal
		                            comment:
		                            'I represent Fortran External statement'.
	fortranStatementFormat := builder
		                          newClassNamed: #StatementFormat
		                          comment:
		                          'I represent Fortran Format statement'.
	fortranStatementFunction := builder
		                            newClassNamed: #StatementFunction
		                            comment:
		                            'I represent Fortran Function statement'.
	fortranStatementGoTo := builder
		                        newClassNamed: #StatementGoTo
		                        comment:
		                        'I represent Fortran Go To statement'.
	fortranStatementGoToAssigned := builder
		                                newClassNamed:
		                                #StatementGoToAssigned
		                                comment:
		                                'I represent Fortran Go To( Assigned) statement'.
	fortranStatementGoToComputed := builder
		                                newClassNamed:
		                                #StatementGoToComputed
		                                comment:
		                                'I represent Fortran Go To (Computed) statement'.
	fortranStatementGoToUnconditional := builder
		                                     newClassNamed:
		                                     #StatementGoToUnconditional
		                                     comment:
		                                     'I represent Fortran Go To (Unconditional) statement'.
	fortranStatementIfArithmetic := builder
		                                newClassNamed:
		                                #StatementIfArithmetic
		                                comment:
		                                'I represent Fortran If (Arithmetic) statement'.
	fortranStatementIfBlock := builder
		                           newClassNamed: #StatementIfBlock
		                           comment:
		                           'I represent Fortran If (BLock) statement'.
	fortranStatementIfLogical := builder
		                             newClassNamed: #StatementIfLogical
		                             comment:
		                             'I represent Fortran If (Logical) statement'.
	fortranStatementImplicit := builder
		                            newClassNamed: #StatementImplicit
		                            comment:
		                            'I represent Fortran Implicit statement'.
	fortranStatementInclude := builder
		                           newClassNamed: #StatementInclude
		                           comment:
		                           'I represent Fortran Include statement'.
	fortranStatementInquire := builder
		                           newClassNamed: #StatementInquire
		                           comment:
		                           'I represent Fortran Inquire statement'.
	fortranStatementIntrinsic := builder
		                             newClassNamed: #StatementIntrinsic
		                             comment:
		                             'I represent Fortran Intrinsic statement'.
	fortranStatementMap := builder
		                       newClassNamed: #StatementMap
		                       comment: 'I represent Fortran Map statement'.
	fortranStatementNameList := builder
		                            newClassNamed: #StatementNameList
		                            comment:
		                            'I represent Fortran NameList statement'.
	fortranStatementOpen := builder
		                        newClassNamed: #StatementOpen
		                        comment:
		                        'I represent Fortran Open statement'.
	fortranStatementOptions := builder
		                           newClassNamed: #StatementOptions
		                           comment:
		                           'I represent Fortran Options statement'.
	fortranStatementParameter := builder
		                             newClassNamed: #StatementParameter
		                             comment:
		                             'I represent Fortran Parameter statement'.
	fortranStatementPause := builder
		                         newClassNamed: #StatementPause
		                         comment:
		                         'I represent Fortran Pause statement'.
	fortranStatementPragma := builder
		                          newClassNamed: #StatementPragma
		                          comment:
		                          'I represent Fortran Pragma statement'.
	fortranStatementPrint := builder
		                         newClassNamed: #StatementPrint
		                         comment:
		                         'I represent Fortran Print statement'.
	fortranStatementProgram := builder
		                           newClassNamed: #StatementProgram
		                           comment:
		                           'I represent Fortran Program statement'.
	fortranStatementRead := builder
		                        newClassNamed: #StatementRead
		                        comment:
		                        'I represent Fortran Read statement'.
	fortranStatementReturn := builder
		                          newClassNamed: #StatementReturn
		                          comment:
		                          'I represent Fortran Return statement'.
	fortranStatementRewind := builder
		                          newClassNamed: #StatementRewind
		                          comment:
		                          'I represent Fortran Rewind statement'.
	fortranStatementSave := builder
		                        newClassNamed: #StatementSave
		                        comment:
		                        'I represent Fortran Save statement'.
	fortranStatementSoubroutine := builder
		                               newClassNamed: #StatementSoubroutine
		                               comment:
		                               'I represent Fortran Soubroutine statement'.
	fortranStatementStatic := builder
		                          newClassNamed: #StatementStatic
		                          comment:
		                          'I represent Fortran Static statement'.
	fortranStatementStop := builder
		                        newClassNamed: #StatementStop
		                        comment:
		                        'I represent Fortran Stop statement'.
	fortranStatementUnion := builder
		                         newClassNamed: #StatementUnion
		                         comment:
		                         'I represent Fortran Union statement'.
	fortranStatementVirtual := builder
		                           newClassNamed: #StatementVirtual
		                           comment:
		                           'I represent Fortran Virtual statement'.
	fortranStatementVolatile := builder
		                            newClassNamed: #StatementVolatile
		                            comment:
		                            'I represent Fortran Volatile statement'.
	fortranStatementWrite := builder
		                         newClassNamed: #StatementWrite
		                         comment:
		                         'I represent Fortran Write statement'
]

{ #category : #definition }
FASTFortranGenerator >> defineTraits [

	super defineTraits.
	
	tWithSymbolicName := builder
		                             newTraitNamed:
		                             #TFortranWithSymbolicName
		                             comment:
		                             'I can have a symbolic name'.
	
	tFortranProcedure := builder
		                             newTraitNamed:
		                             #TFortranProcedure
		                             comment:
		                             'I represent a fortran subroutine or a function'.

	tFortranTerminalStatement := builder
		                             newTraitNamed:
		                             #TFortranTerminalStatement
		                             comment:
		                             'I can serve as a fortran terminal statement'.

	tFortranExecutableStatement := builder
		                               newTraitNamed:
		                               #TFortranExecutableStatement
		                               comment:
		                               'I am a fortran executable statement (I specify an action to be taken at runtime)'.

	tFortranNotExecutableStatement := builder
		                                  newTraitNamed:
		                                  #TFortranNotExecutableStatement
		                                  comment:
		                                  'I am a fortran not executable statement (I specify attributes, such as type and size; determine arrangement or order; define initial data values; specify editing instructions; define statement functions; classify program units; and define entry points. In general, I am are completed before execution of the first executable statement)'.

	tFortranNotStandardFeatures := builder
		                               newTraitNamed:
		                               #TFortranNotStandardFeatures
		                               comment: '
		I represent "Non-standard" or "Extension" feature which go beyond versions compatible with the ANSI X3.9-1978 FORTRAN standard and the corresponding International Organization for Standardization (ISO) 1539-1980, FIPS 69-1, BS 6832, and MIL-STD-1753 ( Floating-point arithmetic for both compilers is based on IEEE standard 754-1985, and international standard IEC 60559:1989); on SPARC platforms, both compilers provide support for the optimization-exploiting features of SPARC V8, and SPARC V9, including the UltraSPARC(TM) implementation. These features are defined in the SPARC Architecture Manuals, Version 8 (ISBN 0-13-825001-4), and Version 9 (ISBN 0-13-099227-5), published by Prentice-Hall for SPARC International.'

	"
	tFortranExpression := builder
		                newTraitNamed: #TFortranExpression
		                comment: 'self commentForFortranTFortranExpression'.
		
	tWithFortranExpression := builder
		                    newTraitNamed: #TWithFortranExpression
		                    comment: 'I have an FortranExpression'.
	"
]

{ #category : #definition }
FASTFortranGenerator >> defineTypes [

	self defineDataTypes.
	self defineConstants. 
	
	
	
	

	
]
