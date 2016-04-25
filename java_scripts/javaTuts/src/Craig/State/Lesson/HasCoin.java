package Craig.State.Lesson;

public class HasCoin extends State {
	GumballMachine gm;
	
	public HasCoin (GumballMachine gmm){
		this.gm=gmm;
	}
	public void returnCoin(){
		System.out.println("returning a coin");
		gm.setState(gm.getNoCoinState());
	}
}
