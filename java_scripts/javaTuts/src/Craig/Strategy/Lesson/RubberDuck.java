package Craig.Strategy.Lesson;

public class RubberDuck extends Duck {
	
	public RubberDuck() {
		quackType = new Squeek();
		flyType = new FlyNoWay();
	}
	public void display(){
		System.out.println("I am a rubber duck");
	}
}
