/**
 * @name Access to nil reference
 * @description sample codeql query
 * @kind path-problem
 * @problem.severity error
 * @security-severity 10.0
 * @id access-nil
 */

import go

module MyFlowConfiguration implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    exists(ReturnStmt ret, Ident e |
      e = source.asExpr() and
      ret.getAChildExpr() = e and
      e.getName() = "nil"
    )
  }

  predicate isAdditionalFlowStep(DataFlow::Node n1, DataFlow::Node n2) {
    n2.asExpr().(SelectorExpr).getBase() = n1.asExpr()
  }

  predicate isSink(DataFlow::Node sink) { sink.asExpr() instanceof SelectorExpr }
}

module Flow = TaintTracking::Global<MyFlowConfiguration>;

import Flow::PathGraph

from Flow::PathNode source, Flow::PathNode sink
where Flow::flowPath(source, sink)
select sink.getNode(), source, sink, "Data flow"
