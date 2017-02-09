package example.foo;

public class DiceRoller {
	// its very simple java code that is public static, that method can access everybody using class reference
	 public static int rollDice() {
		 // simple give a number from 1 to 6 : 
	        return (int)(Math.random() * 6.0 + 1.0);
	    }
}
