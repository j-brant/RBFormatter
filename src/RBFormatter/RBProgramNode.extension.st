Extension { #name : #RBProgramNode }

{ #category : #'*RBFormatter' }
RBProgramNode >> formatterStatementComments [
	| statementComments |
	statementComments := OrderedCollection withAll: self comments.
	self children do: [ :each | statementComments addAll: each formatterStatementComments ].
	^ statementComments asSortedCollection: [ :a :b | a start < b start ]
]
