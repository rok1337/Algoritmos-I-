
public class Implicacion extends Formula
{
     private final Formula p, q;
    public Implicacion(Formula p, Formula q){
        this.p = p;
        this.q = q;
    }
    
    @Override
    public boolean evaluate(){
        if(p.evaluate() == false && q.evaluate() == false){
            return true;
        }else{
        return !p.evaluate() || q.evaluate();
        }
    }
    
    @Override
    public String toString(){
        return p + " -> " + q;

    }
}