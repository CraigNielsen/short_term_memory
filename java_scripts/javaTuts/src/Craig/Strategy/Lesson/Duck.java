package Craig.Strategy.Lesson;


public abstract class Duck {
	Quacks quackType;
	Flys flyType;
	
	public void swim(){
		System.out.println("im swimming");
	};
	public void display(){System.out.println("I am a duck");};
	
	public void quack(){
		quackType.quack();
	}
	public void fly(){
		flyType.fly();
	}
	
	public void setFlyBehavior(Flys fb) {
		flyType = fb;
	}

	public void setQuackBehavior(Quacks qb) {
		quackType = qb;
	}
}
