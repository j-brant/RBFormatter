Class {
	#name : #RBConfigurableFormatter,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'codeStream',
		'indent',
		'lookaheadCode',
		'originalSource',
		'lineStart'
	],
	#classVars : [
		'FormatCommentWithStatements',
		'IndentString',
		'IndentsForKeywords',
		'LineUpBlockBrackets',
		'MaxLineLength',
		'MethodSignatureOnMultipleLines',
		'MinimumNewLinesBetweenStatements',
		'NewLineAfterCascade',
		'NewLineAfterPragma',
		'NewLineBeforeFirstCascade',
		'NewLineBeforeFirstKeyword',
		'NewLinesAfterMethodComment',
		'NewLinesAfterMethodPattern',
		'NewLinesAfterTemporaries',
		'NumberOfArgumentsForMultiLine',
		'ParenthesizeCascadeReceiver',
		'PeriodsAsTerminators',
		'RetainBlankLinesBetweenStatements',
		'SameLineKeywordArgument',
		'StringFollowingReturn',
		'StringInsideBlocks',
		'StringInsideParentheses',
		'TraditionalBinaryPrecedence',
		'UseTraditionalBinaryPrecedenceForParentheses'
	],
	#category : #RBFormatter
}

{ #category : #'public interface' }
RBConfigurableFormatter class >> format: aParseTree [
	^ self
		format: aParseTree
		withIndents: 0
		includeStatementComments: true
]

{ #category : #private }
RBConfigurableFormatter class >> format: aParseTree withIndents: anInteger [
	^ self
		format: aParseTree
		withIndents: anInteger
		includeStatementComments: false
]

{ #category : #private }
RBConfigurableFormatter class >> format: aParseTree withIndents: anInteger includeStatementComments: aBoolean [
	| formatter |
	formatter := self new.
	formatter indent: anInteger.
	^ formatter format: aParseTree includeStatementComments: aBoolean
]

{ #category : #settings }
RBConfigurableFormatter class >> formatAsYouReadPolicy [
	^ false
]

{ #category : #settings }
RBConfigurableFormatter class >> formatCommentWithStatements [
	^ FormatCommentWithStatements
]

{ #category : #settings }
RBConfigurableFormatter class >> formatCommentWithStatements: aBoolean [
	FormatCommentWithStatements := aBoolean
]

{ #category : #settings }
RBConfigurableFormatter class >> indentString [
	^ IndentString
]

{ #category : #settings }
RBConfigurableFormatter class >> indentString: aString [
	IndentString := aString
]

{ #category : #settings }
RBConfigurableFormatter class >> indentsForKeywords [
	^ IndentsForKeywords
]

{ #category : #settings }
RBConfigurableFormatter class >> indentsForKeywords: anInteger [
	IndentsForKeywords := anInteger
]

{ #category : #'class initialization' }
RBConfigurableFormatter class >> initialize [
	FormatCommentWithStatements := true.
	IndentsForKeywords := 1.
	IndentString := String with: Character tab.
	LineUpBlockBrackets := false.
	MaxLineLength := 125.
	MethodSignatureOnMultipleLines := false.
	MinimumNewLinesBetweenStatements := 1.
	NewLineAfterCascade := true.
	NewLineBeforeFirstCascade := true.
	NewLineBeforeFirstKeyword := true.
	NewLineAfterPragma := true.
	NewLinesAfterMethodComment := 2.
	NewLinesAfterMethodPattern := 1.
	NewLinesAfterTemporaries := 1.
	NumberOfArgumentsForMultiLine := 3.
	PeriodsAsTerminators := false.
	RetainBlankLinesBetweenStatements := false.
	SameLineKeywordArgument := false.
	StringFollowingReturn := ' '.
	StringInsideBlocks := ' '.
	StringInsideParentheses := ''.
	TraditionalBinaryPrecedence := #(#($| $& $?) #($= $~ $< $>) #($- $+) #($* $/ $% $\) #($@)).
	UseTraditionalBinaryPrecedenceForParentheses := true.
	ParenthesizeCascadeReceiver := true
]

{ #category : #settings }
RBConfigurableFormatter class >> lineUpBlockBrackets [
	^ LineUpBlockBrackets
]

{ #category : #settings }
RBConfigurableFormatter class >> lineUpBlockBrackets: aBoolean [
	LineUpBlockBrackets := aBoolean
]

{ #category : #settings }
RBConfigurableFormatter class >> maxLineLength [
	^ MaxLineLength
]

{ #category : #settings }
RBConfigurableFormatter class >> maxLineLength: anInteger [
	MaxLineLength := anInteger
]

{ #category : #settings }
RBConfigurableFormatter class >> methodSignatureOnMultipleLines [
	^ MethodSignatureOnMultipleLines
]

{ #category : #settings }
RBConfigurableFormatter class >> methodSignatureOnMultipleLines: aBoolean [
	MethodSignatureOnMultipleLines := aBoolean
]

{ #category : #settings }
RBConfigurableFormatter class >> minimumNewLinesBetweenStatements [
	^ MinimumNewLinesBetweenStatements
]

{ #category : #settings }
RBConfigurableFormatter class >> minimumNewLinesBetweenStatements: anInteger [
	MinimumNewLinesBetweenStatements := anInteger
]

{ #category : #settings }
RBConfigurableFormatter class >> newLineAfterCascade [
	^ NewLineAfterCascade
]

{ #category : #settings }
RBConfigurableFormatter class >> newLineAfterCascade: aBoolean [
	NewLineAfterCascade := aBoolean
]

{ #category : #settings }
RBConfigurableFormatter class >> newLineBeforeFirstCascade [
	^ NewLineBeforeFirstCascade
]

{ #category : #settings }
RBConfigurableFormatter class >> newLineBeforeFirstCascade: aBoolean [
	NewLineBeforeFirstCascade := aBoolean
]

{ #category : #settings }
RBConfigurableFormatter class >> newLineBeforeFirstKeyword [
	^ NewLineBeforeFirstKeyword
]

{ #category : #settings }
RBConfigurableFormatter class >> newLineBeforeFirstKeyword: aBoolean [
	NewLineBeforeFirstKeyword := aBoolean
]

{ #category : #settings }
RBConfigurableFormatter class >> newLinesAfterMethodComment [
	^ NewLinesAfterMethodComment
]

{ #category : #settings }
RBConfigurableFormatter class >> newLinesAfterMethodComment: anInteger [
	NewLinesAfterMethodComment := anInteger
]

{ #category : #settings }
RBConfigurableFormatter class >> newLinesAfterMethodPattern [
	^ NewLinesAfterMethodPattern
]

{ #category : #settings }
RBConfigurableFormatter class >> newLinesAfterMethodPattern: anInteger [
	NewLinesAfterMethodPattern := anInteger
]

{ #category : #settings }
RBConfigurableFormatter class >> newLinesAfterTemporaries [
	^ NewLinesAfterTemporaries
]

{ #category : #settings }
RBConfigurableFormatter class >> newLinesAfterTemporaries: anInteger [
	NewLinesAfterTemporaries := anInteger
]

{ #category : #settings }
RBConfigurableFormatter class >> numberOfArgumentsForMultiLine [
	^ NumberOfArgumentsForMultiLine
]

{ #category : #settings }
RBConfigurableFormatter class >> numberOfArgumentsForMultiLine: anInteger [
	NumberOfArgumentsForMultiLine := anInteger
]

{ #category : #settings }
RBConfigurableFormatter class >> parenthesizeCascadeReceiver [
	^ ParenthesizeCascadeReceiver
]

{ #category : #settings }
RBConfigurableFormatter class >> parenthesizeCascadeReceiver: aBoolean [
	ParenthesizeCascadeReceiver := aBoolean
]

{ #category : #settings }
RBConfigurableFormatter class >> periodsAsTerminators [
	^ PeriodsAsTerminators
]

{ #category : #settings }
RBConfigurableFormatter class >> periodsAsTerminators: aBoolean [
	PeriodsAsTerminators := aBoolean
]

{ #category : #settings }
RBConfigurableFormatter class >> retainBlankLinesBetweenStatements [
	^ RetainBlankLinesBetweenStatements
]

{ #category : #settings }
RBConfigurableFormatter class >> retainBlankLinesBetweenStatements: aBoolean [
	RetainBlankLinesBetweenStatements := aBoolean
]

{ #category : #settings }
RBConfigurableFormatter class >> sameLineKeywordArgument [
	^SameLineKeywordArgument
]

{ #category : #settings }
RBConfigurableFormatter class >> sameLineKeywordArgument: aBoolean [
	SameLineKeywordArgument := aBoolean
]

{ #category : #settings }
RBConfigurableFormatter class >> stringFollowingReturn [
	^ StringFollowingReturn
]

{ #category : #settings }
RBConfigurableFormatter class >> stringFollowingReturn: aString [
	StringFollowingReturn := aString
]

{ #category : #settings }
RBConfigurableFormatter class >> stringInsideBlocks [
	^ StringInsideBlocks
]

{ #category : #settings }
RBConfigurableFormatter class >> stringInsideBlocks: aString [
	StringInsideBlocks := aString
]

{ #category : #settings }
RBConfigurableFormatter class >> stringInsideParentheses [
	^ StringInsideParentheses
]

{ #category : #settings }
RBConfigurableFormatter class >> stringInsideParentheses: aString [
	StringInsideParentheses := aString
]

{ #category : #settings }
RBConfigurableFormatter class >> traditionalBinaryPrecedence [
	^ TraditionalBinaryPrecedence
]

{ #category : #settings }
RBConfigurableFormatter class >> traditionalBinaryPrecedence: anArray [
	TraditionalBinaryPrecedence := anArray
]

{ #category : #settings }
RBConfigurableFormatter class >> useTraditionalBinaryPrecedenceForParentheses [
	^ UseTraditionalBinaryPrecedenceForParentheses
]

{ #category : #settings }
RBConfigurableFormatter class >> useTraditionalBinaryPrecedenceForParentheses: aBoolean [
	UseTraditionalBinaryPrecedenceForParentheses := aBoolean
]

{ #category : #examples }
RBConfigurableFormatter class >> verifyFormatter [
	"Runs the formatter on the image to check for any problems where the code or comments no longer match after formatting."

	"
		self verifyFormatter
	"

	| block codeDifferences commentDifferences |
	codeDifferences := OrderedCollection new.
	commentDifferences := OrderedCollection new.
	block := [ :m | 
		| ast formatted |
		ast := m ast.
		formatted := RBParser parseMethod: (self format: ast).
		ast ~= formatted
			ifTrue: [ codeDifferences add: ast ]
			ifFalse:
				[ ast allComments asIdentitySet size ~= formatted allComments asIdentitySet size ifTrue: [ commentDifferences add: ast ] ] ].
	Smalltalk
		allClassesDo:
			[ :each | 
			each methodsDo: [ :method | block value: method ].
			each class methodsDo: [ :method | block value: method ] ].
	self assert: codeDifferences isEmpty.
	self assert: commentDifferences isEmpty
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> addNewLinesBeforeStatementStartingAt: anInteger [
	| newLines |
	newLines := MinimumNewLinesBetweenStatements
		max: (RetainBlankLinesBetweenStatements ifTrue: [ self newLinesBeforeStartingAt: anInteger ] ifFalse: [ 0 ]).
	newLines = 0 ifTrue: [ self space ] ifFalse: [ self newLines: newLines ]
]

{ #category : #private }
RBConfigurableFormatter >> bracketWith: bracketString around: aBlock [
	bracketString isEmpty ifTrue: [ ^ aBlock value ].
	codeStream nextPut: bracketString first.
	^ aBlock ensure: [ codeStream nextPut: bracketString last ]
]

{ #category : #private }
RBConfigurableFormatter >> commentsForMethod: aMethodNode [
	^ FormatCommentWithStatements
		ifTrue:
			[ aMethodNode comments
				,
					(aMethodNode arguments
						inject: OrderedCollection new
						into:
							[ :sum :each | 
							sum
								addAll: each comments;
								yourself ]) ]
		ifFalse: [ aMethodNode comments ]
]

{ #category : #private }
RBConfigurableFormatter >> currentLineLength [
	^ codeStream position - lineStart
]

{ #category : #'public interface' }
RBConfigurableFormatter >> format: aParseTree [
	^ self format: aParseTree includeStatementComments: true
]

{ #category : #'public interface' }
RBConfigurableFormatter >> format: aParseTree includeStatementComments: aBoolean [
	originalSource := aParseTree source.
	self visitNode: aParseTree.
	(aBoolean and: [ FormatCommentWithStatements and: [ aParseTree isValue ] ])
		ifTrue: [ self formatStatementCommentsFor: aParseTree ].
	^ codeStream contents
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatBlock: aBlockNode [
	(LineUpBlockBrackets and: [ self willBeMultiline: aBlockNode body ])
		ifTrue: [ self newLine ]
		ifFalse: [ codeStream nextPutAll: StringInsideBlocks ].
	FormatCommentWithStatements ifTrue: [ self formatCommentsFor: aBlockNode ].
	self formatBlockArgumentsFor: aBlockNode.
	self visitNode: aBlockNode body.
	^ (LineUpBlockBrackets and: [ self willBeMultiline: aBlockNode body ])
		ifTrue: [ self newLine ]
		ifFalse: [ codeStream nextPutAll: StringInsideBlocks ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatBlockArgumentsFor: aBlockNode [
	aBlockNode arguments isEmpty ifTrue: [ ^ self ].
	aBlockNode arguments
		do:
			[ :each | 
			codeStream nextPut: $:.
			self visitNode: each.
			FormatCommentWithStatements ifTrue: [ self formatCommentsFor: each ].
			self space ].
	codeStream nextPutAll: '| '.
	(self willBeMultiline: aBlockNode body) ifTrue: [ self newLine ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatCommentsFor: aNode [
	aNode comments
		do:
			[ :each | 
			codeStream
				space;
				nextPut: $";
				nextPutAll: each contents;
				nextPut: $" ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatMethodBodyFor: aMethodNode [
	self
		indentAround:
			[ self newLines: NewLinesAfterMethodPattern.
			self formatMethodCommentFor: aMethodNode.
			self formatTagsFor: aMethodNode.
			self visitNode: aMethodNode body ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatMethodCommentFor: aMethodNode [
	(self commentsForMethod: aMethodNode)
		do:
			[ :each | 
			codeStream
				nextPut: $";
				nextPutAll: each contents;
				nextPut: $".
			self newLines: NewLinesAfterMethodComment ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatMethodPatternFor: aMethodNode [
	aMethodNode arguments isEmpty
		ifTrue: [ codeStream nextPutAll: aMethodNode selector ]
		ifFalse:
			[ self
				with: aMethodNode selectorParts
				and: aMethodNode arguments
				do:
					[ :key :arg | 
					codeStream nextPutAll: key value.
					self space.
					self visitNode: arg ]
				separatedBy: [ MethodSignatureOnMultipleLines ifTrue: [ self newLine ] ifFalse: [ self space ] ] ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatSelectorAndArguments: aMessageNode [
	| newLineBetweenArguments |
	newLineBetweenArguments := self isMultiLineMessage: aMessageNode.
	self
		indent: IndentsForKeywords
		around:
			[ self
				formatSelectorAndArguments: aMessageNode
				firstSeparator:
					(newLineBetweenArguments & NewLineBeforeFirstKeyword ifTrue: [ [ self newLine ] ] ifFalse: [ [ self space ] ])
				restSeparator: (newLineBetweenArguments ifTrue: [ [ self newLine ] ] ifFalse: [ [ self space ] ]) ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatSelectorAndArguments: aMessageNode firstSeparator: firstBlock restSeparator: restBlock [
	| separatorBlock |
	separatorBlock := firstBlock.
	aMessageNode isUnary
		ifTrue:
			[ (self isLineTooLong: aMessageNode selector) ifTrue: [ self newLine ] ifFalse: [ separatorBlock value ].
			codeStream nextPutAll: aMessageNode selector ]
		ifFalse:
			[ aMessageNode selectorParts
				with: aMessageNode arguments
				do:
					[ :selector :argument | 
					(self isLineTooLong: selector value) ifTrue: [ self newLine ] ifFalse: [ separatorBlock value ].
					separatorBlock := restBlock.
					self
						indentAround:
							[ codeStream nextPutAll: selector value.
							(SameLineKeywordArgument not
								and: [ (self willBeMultiline: argument) or: [ self isLineTooLong: (self formattedSourceFor: argument) ] ])
								ifTrue: [ self newLine ]
								ifFalse: [ self space ].
							self visitNode: argument ] ] ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatSequenceCommentsFor: aSequenceNode [
	originalSource isNil ifTrue: [ ^ self ].
	aSequenceNode comments
		do:
			[ :each | 
			codeStream
				nextPut: $";
				nextPutAll: each contents;
				nextPut: $".
			self newLine ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatSequenceNodeStatementsFor: aSequenceNode [
	| statements |
	statements := aSequenceNode statements.
	statements isEmpty ifTrue: [ ^ self ].
	1
		to: statements size
		do:
			[ :i | 
			self visitNode: (statements at: i).
			(PeriodsAsTerminators or: [ i < statements size ]) ifTrue: [ codeStream nextPut: $. ].
			self formatStatementCommentsFor: (statements at: i).
			i < statements size ifTrue: [ self addNewLinesBeforeStatementStartingAt: (statements at: i + 1) start ] ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatStatementCommentsFor: aStatementNode [
	originalSource isNil ifTrue: [ ^ self ].
	FormatCommentWithStatements ifFalse: [ ^ self ].
	aStatementNode formatterStatementComments
		do:
			[ :each | 
			codeStream
				tab;
				nextPut: $";
				nextPutAll: each contents;
				nextPut: $" ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatTagsFor: aMethodNode [
	aMethodNode pragmas
		do:
			[ :each | 
			self visitNode: each.
			NewLineAfterPragma ifTrue: [ self newLine ] ]
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> formatTemporariesFor: aSequenceNode [
	aSequenceNode temporaries isEmpty ifTrue: [ ^ self ].
	self
		bracketWith: '|'
		around:
			[ self space.
			aSequenceNode temporaries
				do:
					[ :each | 
					self visitNode: each.
					FormatCommentWithStatements ifTrue: [ self formatCommentsFor: each ].
					self space ] ].
	self newLines: NewLinesAfterTemporaries
]

{ #category : #private }
RBConfigurableFormatter >> formattedSourceFor: aNode [
	^ lookaheadCode at: aNode ifAbsentPut: [ self class format: aNode withIndents: indent ]
]

{ #category : #private }
RBConfigurableFormatter >> indent [
	indent timesRepeat: [ codeStream nextPutAll: IndentString ]
]

{ #category : #'initialize-release' }
RBConfigurableFormatter >> indent: anInteger [
	indent := anInteger
]

{ #category : #private }
RBConfigurableFormatter >> indent: anInteger around: aBlock [
	indent := indent + anInteger.
	^ aBlock ensure: [ indent := indent - anInteger ]
]

{ #category : #private }
RBConfigurableFormatter >> indentAround: aBlock [
	self indent: 1 around: aBlock
]

{ #category : #'initialize-release' }
RBConfigurableFormatter >> initialize [
	super initialize.
	lineStart := 0.
	indent := 0.
	lookaheadCode := IdentityDictionary new.
	codeStream := WriteStream on: (String new: 256)
]

{ #category : #private }
RBConfigurableFormatter >> isLineTooLong: aString [
	^ self currentLineLength + aString size >= MaxLineLength
]

{ #category : #'private-formatting' }
RBConfigurableFormatter >> isMultiLineMessage: aMessageNode [
	| messageStream indentDelta |
	aMessageNode arguments size >= NumberOfArgumentsForMultiLine ifTrue: [ ^ true ].
	indentDelta := aMessageNode parent isCascade ifTrue: [ 0 ] ifFalse: [ 1 ].
	(aMessageNode arguments
		anySatisfy: [ :each | self indent: IndentsForKeywords + indentDelta around: [ self willBeMultiline: each ] ])
		ifTrue: [ ^ true ].
	aMessageNode isUnary ifTrue: [ ^ self isLineTooLong: aMessageNode selector ].
	messageStream := WriteStream on: (String new: 100).
	self
		with: aMessageNode selectorParts
		and: aMessageNode arguments
		do:
			[ :sel :arg | 
			messageStream
				nextPutAll: sel value;
				space;
				nextPutAll: (self formattedSourceFor: arg) ]
		separatedBy: [ messageStream space ].
	^ self isLineTooLong: messageStream contents
]

{ #category : #private }
RBConfigurableFormatter >> needsParenthesisFor: aNode [
	| parent grandparent |
	parent := aNode parent.
	(parent isNil or: [ parent isMessage not ]) ifTrue: [ ^ false ].
	(aNode isMessage
		and:
			[ (ParenthesizeCascadeReceiver or: [ aNode isUnary not ]) and: [ parent isMessage and: [ parent receiver == aNode ] ] ])
		ifTrue:
			[ grandparent := parent parent.
			(grandparent notNil and: [ grandparent isCascade ]) ifTrue: [ ^ true ] ].
	aNode precedence < parent precedence ifTrue: [ ^ false ].
	(parent receiver ~~ aNode and: [ aNode precedence >= parent precedence ]) ifTrue: [ ^ true ].
	(parent receiver == aNode and: [ aNode precedence > parent precedence or: [ aNode isKeyword ] ]) ifTrue: [ ^ true ].
	aNode isBinary ifFalse: [ ^ false ].
	^ UseTraditionalBinaryPrecedenceForParentheses and: [ self precedenceOf: parent selector greaterThan: aNode selector ]
]

{ #category : #private }
RBConfigurableFormatter >> newLine [
	self newLines: 1
]

{ #category : #private }
RBConfigurableFormatter >> newLines: anInteger [
	anInteger + IndentString size = 0 ifTrue: [ codeStream space ].
	anInteger timesRepeat: [ codeStream cr ].
	lineStart := codeStream position.
	self indent
]

{ #category : #private }
RBConfigurableFormatter >> newLinesBeforeStartingAt: anIndex [
	| count cr lf index char |
	originalSource ifNil: [ ^ 0 ].
	(anIndex isNil or: [ anIndex > originalSource size ]) ifTrue: [ ^ 0 ].
	cr := Character value: 13.
	lf := Character value: 10.
	count := 0.
	index := anIndex - 1.
	[ index > 0 and: [ (char := originalSource at: index) isSeparator ] ]
		whileTrue:
			[ char == lf
				ifTrue:
					[ count := count + 1.
					(originalSource at: (index - 1 max: 1)) == cr ifTrue: [ index := index - 1 ] ].
			char == cr ifTrue: [ count := count + 1 ].
			index := index - 1 ].
	^ count
]

{ #category : #private }
RBConfigurableFormatter >> precedenceOf: parentSelector greaterThan: childSelector [
	"Put parenthesis around things that are preceived to have 'lower' precedence. For example, 'a + b * c' 
	-> '(a + b) * c' but 'a * b + c' -> 'a * b + c'"

	| childIndex parentIndex |
	childIndex := 0.
	parentIndex := 0.
	1
		to: TraditionalBinaryPrecedence size
		do:
			[ :i | 
			((TraditionalBinaryPrecedence at: i) includes: parentSelector first) ifTrue: [ parentIndex := i ].
			((TraditionalBinaryPrecedence at: i) includes: childSelector first) ifTrue: [ childIndex := i ] ].
	^ childIndex < parentIndex
]

{ #category : #private }
RBConfigurableFormatter >> space [
	codeStream space
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitArrayNode: anArrayNode [
	self
		bracketWith: '{}'
		around:
			[ self
				indentAround:
					[ anArrayNode children
						do: [ :each | self visitNode: each ]
						separatedBy:
							[ codeStream nextPut: $..
							self newLine ] ] ]
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitAssignmentNode: anAssignmentNode [
	self
		indentAround:
			[ self visitNode: anAssignmentNode variable.
			codeStream nextPutAll: ' := '.
			self visitNode: anAssignmentNode value ]
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitBlockNode: aBlockNode [
	self bracketWith: '[]' around: [ self formatBlock: aBlockNode ]
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitCascadeNode: aCascadeNode [
	self visitNode: aCascadeNode receiver.
	self
		indentAround:
			[ NewLineBeforeFirstCascade ifTrue: [ self newLine ] ifFalse: [ self space ].

			aCascadeNode messages
				do:
					[ :each | 
					| keywordIndent |
					keywordIndent := each selector keywords size = 1 ifTrue: [ 0 ] ifFalse: [ 1 ].
					self
						indent: keywordIndent
						around:
							[ self
								formatSelectorAndArguments: each
								firstSeparator: [  ]
								restSeparator: ((self isMultiLineMessage: each) ifTrue: [ [ self newLine ] ] ifFalse: [ [ self space ] ]) ].
					FormatCommentWithStatements not ifTrue: [ self formatCommentsFor: each ] ]
				separatedBy:
					[ codeStream nextPut: $;.
					NewLineAfterCascade ifTrue: [ self newLine ] ifFalse: [ self space ] ] ]
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitLiteralArrayNode: aRBArrayLiteralNode [
	| brackets |
	codeStream nextPut: $#.
	brackets := aRBArrayLiteralNode isForByteArray ifTrue: [ '[]' ] ifFalse: [ '()' ].
	self
		bracketWith: brackets
		around: [ aRBArrayLiteralNode contents do: [ :each | self visitNode: each ] separatedBy: [ self space ] ]
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitLiteralNode: aLiteralNode [
	self writeString: aLiteralNode sourceText
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitMessageNode: aMessageNode [
	self visitNode: aMessageNode receiver.
	self formatSelectorAndArguments: aMessageNode
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitMethodNode: aMethodNode [
	self formatMethodPatternFor: aMethodNode.
	self formatMethodBodyFor: aMethodNode
]

{ #category : #visiting }
RBConfigurableFormatter >> visitNode: aNode [
	| needsParenthesis |
	(lookaheadCode includesKey: aNode) ifTrue: [ ^ self writeString: (lookaheadCode at: aNode) ].
	needsParenthesis := self needsParenthesisFor: aNode.
	self
		bracketWith: (needsParenthesis ifTrue: [ '()' ] ifFalse: [ '' ])
		around:
			[ needsParenthesis ifTrue: [ codeStream nextPutAll: StringInsideParentheses ].
			super visitNode: aNode.
			(FormatCommentWithStatements or: [ aNode isMethod or: [ aNode isSequence ] ]) ifFalse: [ self formatCommentsFor: aNode ].
			needsParenthesis ifTrue: [ codeStream nextPutAll: StringInsideParentheses ] ]
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitPatternBlockNode: aRBPatternBlockNode [
	codeStream nextPut: $`.
	self bracketWith: '{}' around: [ self formatBlock: aRBPatternBlockNode ]
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitPatternWrapperBlockNode: aRBPatternWrapperBlockNode [
	self visitNode: aRBPatternWrapperBlockNode wrappedNode.
	codeStream nextPut: $`.
	self bracketWith: '{}' around: [ self formatBlock: aRBPatternWrapperBlockNode ]
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitPragmaNode: aPragmaNode [
	| args multiline |
	args := aPragmaNode arguments collect: [ :each | self formattedSourceFor: each ].
	multiline := aPragmaNode arguments size > 0
		and:
			[ (args anySatisfy: [ :each | each includes: Character cr ])
				or:
					[ 2 + aPragmaNode selector size + args size + (args inject: 0 into: [ :sum :each | sum + each size ]) >= MaxLineLength ] ].
	codeStream nextPut: $<.
	aPragmaNode selector isUnary
		ifTrue: [ codeStream nextPutAll: aPragmaNode selector ]
		ifFalse:
			[ self
				indentAround:
					[ | first |
					first := true.
					aPragmaNode selector keywords
						with: args
						do:
							[ :keyword :arg | 
							first ifTrue: [ first := false ] ifFalse: [ multiline ifTrue: [ self newLine ] ifFalse: [ self space ] ].
							codeStream
								nextPutAll: keyword;
								space;
								nextPutAll: arg ] ] ].
	codeStream nextPut: $>.
	self newLine
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitReturnNode: aReturnNode [
	codeStream
		nextPut: $^;
		nextPutAll: StringFollowingReturn.
	self visitNode: aReturnNode value
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitSequenceNode: aSequenceNode [
	self formatTemporariesFor: aSequenceNode.
	self formatSequenceCommentsFor: aSequenceNode.
	self formatSequenceNodeStatementsFor: aSequenceNode
]

{ #category : #'visitor-double dispatching' }
RBConfigurableFormatter >> visitVariableNode: aVariableNode [
	codeStream nextPutAll: aVariableNode name
]

{ #category : #private }
RBConfigurableFormatter >> willBeMultiline: aNode [
	^ (self formattedSourceFor: aNode) includes: Character cr
]

{ #category : #utility }
RBConfigurableFormatter >> with: firstCollection and: secondCollection do: aBlock separatedBy: separatorBlock [
	firstCollection isEmpty ifTrue: [ ^ self ].
	aBlock value: firstCollection first value: secondCollection first.
	2
		to: firstCollection size
		do:
			[ :i | 
			separatorBlock value.
			aBlock value: (firstCollection at: i) value: (secondCollection at: i) ]
]

{ #category : #private }
RBConfigurableFormatter >> writeString: aString [
	| index |
	index := aString lastIndexOf: Character cr.
	codeStream nextPutAll: aString.
	index > 0 ifTrue: [ lineStart := codeStream position - (aString size - index) ]
]
