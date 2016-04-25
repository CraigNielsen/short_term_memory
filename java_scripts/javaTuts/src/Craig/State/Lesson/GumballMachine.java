package Craig.State.Lesson;

public class GumballMachine {

	State NoCoin;
	State HasCoin;
	State state;
	int count;
	public GumballMachine(int count)
	{
		this.count= count;
		NoCoin= new NoCoin(this);
		HasCoin= new HasCoin(this);
		state=NoCoin;
	}
	public State getHasCoinState() {
		return HasCoin;
	}
	public void setState(State s){
		this.state=s;
	}
	public State getNoCoinState(){
		return NoCoin;
	}
	public void insertCoin(){state.insertCoin();};
	public void returnCoin(){state.returnCoin();};
}
