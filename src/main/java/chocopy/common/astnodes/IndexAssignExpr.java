package chocopy.common.astnodes;

import java_cup.runtime.ComplexSymbolFactory.Location;

public class IndexAssignExpr extends Expr {
    public final IndexExpr listElement;
    public final Expr value;

    public IndexAssignExpr(Location left, Location right, IndexExpr listElement, Expr value) {
        super(left, right);
        this.listElement = listElement;
        this.value = value;
    }
}
