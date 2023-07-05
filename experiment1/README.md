# SHARCS ODRL Example - Experiment 1

Basic example of an ODRL policy containing a simple basic graph pattern 
in the `odrl:assignee` section combined with two policy constraints.

## Demo

Run the experiment:

```
$ ./run.sh
<urn:odrl-compiler:Result> odrl:action odrlp:grantAccess.
<urn:odrl-compiler:Result> <urn:odrl-compiler:policy> <http://example.org/policy/policy-authorization>.
<urn:odrl-compiler:Result> odrl:assignee ex:alice.
<urn:odrl-compiler:Result> odrl:target ex:Session2300.
<urn:odrl-compiler:Result> <urn:odrl-compiler:constraint> _:e_sk_12_1.
<urn:odrl-compiler:Result> <urn:odrl-compiler:constraint> _:e_sk_13_1.
_:e_sk_12_1 a <urn:odrl-compiler:Constraint>.
_:e_sk_13_1 a <urn:odrl-compiler:Constraint>.
_:e_sk_12_1 odrl:leftOperand odrl:dateTime.
_:e_sk_13_1 odrl:leftOperand odrl:dateTime.
_:e_sk_12_1 odrl:operator odrl:lt.
_:e_sk_13_1 odrl:operator odrl:gt.
_:e_sk_12_1 odrl:rightOperand "2024-01-01"^^xsd:date.
_:e_sk_13_1 odrl:rightOperand "2022-01-01"^^xsd:date.
_:bn_1 <urn:odrl-compiler:currentDate> "2022-12-11"^^xsd:date.
_:e_sk_12_1 <urn:odrl-compiler:is> <urn:odrl-compiler:Satisfied>.
_:e_sk_13_1 <urn:odrl-compiler:is> <urn:odrl-compiler:Satisfied>.
```

As experiment, change some fields in the `data.ttl` (e.g. change  `ex:login` into `ex:bob`) and check that the access will not be granted. 
