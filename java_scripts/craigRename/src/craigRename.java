import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class craigRename {
	
	public craigRename(){
		
	};
	
	interface A {
	    void run(File folder);
	}

	public static void method1(File folder) {
		System.out.println("looking for files with [www.MP3Fiber.com]");
		{
			String[] paths = folder.list();
			for (String item:paths)
			{
				if (item.indexOf("[www.MP3Fiber.com]")!= -1){
					
				
					File temp= new File(folder+"/"+item);
					System.out.println("renaming: "+ item + " to " + item.replace("[www.MP3Fiber.com]",""));
					temp.renameTo(new File(item.replace("[www.MP3Fiber.com]", "")));
					
				}

			}
		}
	}

	public static void method2() {
		System.out.println("this is method 2");
	}	
	public static void showOptions(){
		System.out.println("1:	rename template for downloaded music");
		System.out.println("2:	nothing yet");
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		if (args.length < 1){System.out.println("please pass in a directory");System.exit(0);}
		craigRename rn;
		Scanner input = new Scanner(System.in);
		File folder_ = new File(args[0]);

		
		int response=1;
		while (response != -1){
		    A methodOne = new A() { @Override public void run(File folder) { method1(folder); } };
		    A methodTwo = new A() { @Override public void run(File folder) { method2(); } };

		    Map<Integer, A> methodMap = new HashMap<>();
		    methodMap.put(1, methodOne);
		    methodMap.put(2, methodTwo);
			showOptions();
			System.out.println("enter your choice or anything else to exit:");
			try {
				response=input.nextInt();
				System.out.println("you entered: "+response);
				A cmethod= methodMap.get(response);
				cmethod.run(folder_);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("exiting");
				System.exit(0);
			}

			
		}


	}

}