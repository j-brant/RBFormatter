Class {
	#name : #BaselineOfRBFormatter,
	#superclass : #BaselineOf,
	#category : #BaselineOfRBFormatter
}

{ #category : #baselines }
BaselineOfRBFormatter >> baseline: spec [
	<baseline>
	
	spec
		for: #common
		do:
			[ spec postLoadDoIt: #setDefaultFormatter.
			spec package: 'RBFormatter' ]
]

{ #category : #baselines }
BaselineOfRBFormatter >> setDefaultFormatter [
	self class environment at: #RBFormatter ifPresent: [ :class | RBProgramNode formatterClass: class ]
]
