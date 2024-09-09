

public class Disyuncion extends Formula
{
    private final Formula p, q;
    
    public Disyuncion(Formula p, Formula q){
        this.p = p;
        this.q = q;
    }
    
    @Override
    public boolean evaluate(){
        return p.evaluate() || q.evaluate();
    }
    
    @Override
    public String toString(){
        return p + " || " + q;
    }
}
