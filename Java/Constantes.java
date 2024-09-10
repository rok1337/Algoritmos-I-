
public class Constantes extends Formula
{
    private boolean key;
    public Constantes(boolean key){
        this.key = key;
    }
    @Override
    public boolean evaluate(){
        return key;
    }

    @Override
    public String toString() {
        return Boolean.toString(key);
    }

}
