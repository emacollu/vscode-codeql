/**
 * @name Conditianal block
 * @kind problem
 * @problem.severity warning
 * @id java/example/empty-block
 */

import java

from ConditionalStmt rstmt
select rstmt, rstmt.getAChild(), rstmt.getCondition(), rstmt.getCondition().getAChildExpr()