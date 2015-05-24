import java.io.FileWriter;
import java.util.Random;
import java.util.*;

public class CustomDataset 
{
	private static void CreateDataSet(int n) 
	{
		int count=1;
		float x;
		float y;
		String lineRecordString;
		 try 
		 { 
			 FileWriter fw1 = new FileWriter("kmeans-customized"); 
			 while(count<=n)
			 {						
				x=new Random().nextFloat()*10000;
				y=new Random().nextFloat()*10000;
				lineRecordString=String.valueOf(x)+","+String.valueOf(y)+"\r\n";	
				fw1.write(lineRecordString);							
				count++;
			 }
			 fw1.close(); 
		 } 
		 catch (Exception e) 
		 { 
		 } 
	}

	public static void main(String[] args) 
	{       
                Scanner sc = new Scanner(System.in);
                System.out.println("Enter the K i.e. the no of initial seeds you want to generate: ");
                int k = sc.nextInt();
		CreateDataSet(k);
	}


}
