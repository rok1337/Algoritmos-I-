
public class Ejemplo
{
    public static void main(String[] args){ 
        Formula p = new Constantes(true);
        Formula q = new Constantes(false);
        Implicacion r = new Implicacion(p , q);
        //Negacion r = new Negacion(p);
        System.err.println(r);
        System.err.println(r.evaluate());
        
    }
   
}
