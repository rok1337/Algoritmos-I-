
/**
 * Write a description of class Conjuncion here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Conjuncion extends Formula
{
    private final Formula p, q;
    public Conjuncion(Formula p, Formula q){
        this.p = p;
        this.q = q;
    }
    
    @Override
    public boolean evaluate(){
        return p.evaluate() && q.evaluate();
    }
    
    @Override
    public String toString(){
        return p + " && " + q;
    }
}
