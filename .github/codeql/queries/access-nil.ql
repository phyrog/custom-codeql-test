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

  predicate isSink(DataFlow::Node sink) { any() }
}

module Flow = TaintTracking::Global<MyFlowConfiguration>;

import Flow::PathGraph

from Flow::PathNode source, Flow::PathNode sink
where Flow::flowPath(source, sink)
select sink.getNode(), source, sink, "Data flow"
