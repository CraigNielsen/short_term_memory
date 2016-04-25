package Craig.Strategy.Lesson;

public class main {

	public static void main(String[] args) {
			RedHeadDuck r= new RedHeadDuck();
			r.fly();
			r.quack();
			RubberDuck d= new RubberDuck();
			d.fly();
			d.quack();
			d.swim();
			d.display();
			d.setFlyBehavior(new flyWings());
			d.fly();
			
	}
}
