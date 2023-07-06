# SHARCS ODRL Example

SHARCS example is a collection of data, rules and validation steps to simulate a data clearing house use-case.

This code is an expansion of the [SHARCS example](https://github.com/eyereasoner/Notation3-By-Example/tree/main/examples/sharcs). Instead of writing the policy rules in [RDF Surfaces](https://w3c-cg.github.io/rdfsurfaces/) language we use the [ODRL2](https://www.w3.org/ns/odrl/2/) ontology examples provided by [Inès Akaichi](https://github.com/Ines-Akaichi/SHARCS-Use-Case).

## Requirements

- [EYE](https://github.com/eyereasoner/eye) version 4.4.3 or better
  
## Architecture

This experiment contains the core knowledge base `data.ttl` which can be accessed using RDF Surfaces policies (the `.n3s` files). These policies are compiled from their Turtle source files:

- `data_consumer_policy.n3s` is compiled version of the Turtle source `data_consumer_policy.ttl`
  
ODRL policies can contain zero or more constraints that are checked using a Notation3 constraint checker `constraint_checker.n3`.

```
[KnowledgeBase] --> 
  {Compile .ttl policies into .n3s (surfaces)} -->
  {Surface Reasoning with [KnowledgeBase] + [.n3s Policies] + [.q Query]} --> 
  {Notation3 Reasoning with [.n3 Constraints]} -->
  [Output]
```

In this setup, the RDF Surfaces policies contain only existential rules, executing basic graph pattern queries over the data.

### Execution steps

1. Compile `data_consumer_policy.ttl` into `data_consumer_policy.n3s` .
2. Reason over `data.ttl` using `data_consumer_policy.n3s`.
  - Results in a `<urn:odrl-compiler:Result>` output with zero or more constraints when all policy conditions are met.
3. Check if the reasoning ouput `<urn:odrl-compiler:Result>`  satisfies all constraints.

## Data Content

- `data.ttl` : a sample instance of the data model
- `data_consumer_policy.ttl` : an ODRL policy for the data consumer
- `odrl_sharcs_profile.ttl` : an ODRL profile for the SHARCS project

## Compiler Content

- `compiler.n3` : an [Notation3](https://w3c.github.io/N3/spec/) ODRL Turtle to RDF Surfaces compiler
- `util.n3` : a set of Notation3 utility built-ins 
- `constraint_checker.n3` : a Notation3 constraint checker
- `data_consumer_policy.q` : a query surface that defines which result data to expose to the world
- `data_consumer_policy.n3s` : compiled RDF Surfaces  of `data_consumer_policy.ttl`

## Scripts

- `run.sh` : run all the execution steps as explained above