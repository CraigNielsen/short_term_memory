package sandbox;

import java.util.LinkedList;

public class lists {

	public static void main(String[] args) {
		String s="the string:";
		int i = 7;
		float j= 8;
		LinkedList l= new LinkedList();
		l.add(s);
		l.add(j);
		l.add(i);
		for (Object pp : l){
			System.out.println(pp);
		}
		l.remove(l.indexOf("the string:"));
		for (Object pp : l){
			System.out.println(pp);
		}
	}

}
