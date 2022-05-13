Extension { #name : #RBCascadeNode }

{ #category : #'*RBFormatter' }
RBCascadeNode >> formatterStatementComments [
	| statementComments |
	statementComments := OrderedCollection withAll: self comments.
	statementComments addAll: messages first receiver formatterStatementComments.
	messages
		do:
			[ :each | 
			statementComments addAll: each comments.
			each arguments do: [ :arg | statementComments addAll: arg formatterStatementComments ] ].
	^ statementComments asSortedCollection: [ :a :b | a start < b start ]
]
