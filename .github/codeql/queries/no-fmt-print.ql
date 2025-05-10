/**
 * @name No fmt.Print calls
 * @description use slog instead
 * @kind problem
 * @problem.severity warning
 * @security-severity 5.0
 * @id no-fmt-print
 */

import go

from CallExpr print, string name, Function f
where
  f = print.getTarget() and
  f.hasQualifiedName("fmt", name) and
  (name = "Println" or name = "Printf")
select print.getLocation(), "Found call to " + f.getQualifiedName() + ". Use slog instead."
