/**
 * @name Conditianal block
 * @kind problem
 * @problem.severity warning
 * @id java/example/empty-block
 */

import java

predicate isConditionalStmt(Expr exp) {
    exists(ConditionalStmt cstmt | 
        cstmt.getCondition().getAChildExpr() = exp
    )
}

from Expr exp
where isConditionalStmt(exp) and exp.toString() = "command"
select exp