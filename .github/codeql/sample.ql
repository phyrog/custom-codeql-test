/**
 * @name sample
 * @description sample codeql query
 * @kind problem
 * @problem.severity error
 * @security-severity 10.0
 * @id sample
 */

import go

from Function main
where main.getName() = "main"
select main.getLocation(), "found main function"
