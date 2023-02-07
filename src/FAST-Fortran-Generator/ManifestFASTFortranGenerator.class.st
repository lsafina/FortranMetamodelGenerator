"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFASTFortranGenerator,
	#superclass : #PackageManifest,
	#category : #'FAST-Fortran-Generator-Manifest'
}

{ #category : #'code-critics' }
ManifestFASTFortranGenerator class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#FASTFortranGenerator)) #'2023-02-07T16:21:41.740757+01:00') )
]
