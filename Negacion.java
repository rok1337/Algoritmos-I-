
/**
 * Write a description of class Negacion here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Negacion extends Formula
{
    private final Formula p;
    public Negacion(Formula p){
        this.p = p;
    }
    
    @Override
    public boolean evaluate(){
        return !p.evaluate();
    }
    
    @Override
    public String toString(){
        return "¬" + p;
    }
}
