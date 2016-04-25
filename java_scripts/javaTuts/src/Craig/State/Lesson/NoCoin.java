package Craig.State.Lesson;

public class NoCoin extends State {
	GumballMachine gm;
	
	public NoCoin (GumballMachine gmm){
		this.gm=gmm;
	}
	public void insertCoin(){
		System.out.println("thanks for inserting a coin");
		gm.setState(gm.getHasCoinState());
	}
}
