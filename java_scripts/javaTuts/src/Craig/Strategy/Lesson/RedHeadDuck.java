package Craig.Strategy.Lesson;

public class RedHeadDuck extends Duck {
	
	public RedHeadDuck (){
		quackType = new QuackLoud();
		flyType = new flyWings();
	}
	public void display(){
		System.out.println("I am a red head duck");
	}
}
