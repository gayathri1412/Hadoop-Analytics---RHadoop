import java.io.FileWriter;
import java.util.Random;

public class CreateTrainingDataSet 
{
	private static void CreateDataSet() 
	{
		int count=1;
		float x;
		float y;
		String lineRecordString;
		 try 
		 { 
			 FileWriter fw1 = new FileWriter("kmeans"); 
			 while(count<=6000000)
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
		CreateDataSet();
	}


}
