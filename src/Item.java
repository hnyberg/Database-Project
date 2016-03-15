
public class Item extends ItemComponent
{
	
	
	public Item() 
	{
		
	}
	
	public Item(int newItemType, int id, String fName, String lName, String sex, int year)
	{
		this.setItemType(newItemType);
		this.setId(id);
		this.setFirstName(fName);
		this.setLastName(lName);
		this.setSex(sex);
		this.setBirthYear(year);
	}
	
	public Item(int newItemType, int id, String fName, String lName, int year)
	{
		this.setItemType(newItemType);
		this.setId(id);
		this.setFirstName(fName);
		this.setLastName(lName);
		this.setBirthYear(year);
	}
	
	public Item(int newItemType, int id, String name, String type, int year, int time, float grade, int original)
	{
		this.setItemType(newItemType);
		this.setId(id);
		this.setTitleName(name);
		this.setTitleType(type);
		this.setReleaseYear(year);
		this.setRunTime(time);
		this.setGrade(grade);
		this.setOriginal(original);
	}
	
	public Item(int newItemType, int id, String name)
	{
		this.setItemType(newItemType);
		this.setId(id);
		this.setName(name);
	}
	
	public Item(int newItemType, int id, int id1, int id2)
	{
		this.setItemType(newItemType);
		this.setId(id);
		this.setConnectionID1(id1);
		this.setConnectionID2(id2);
	}
	
	public Item(int newItemType, int id, String name, int id1, int id2)
	{
		this.setItemType(newItemType);
		this.setId(id);
		this.setName(name);
		this.setConnectionID1(id1);
		this.setConnectionID2(id2);
	}
	
	public Item(int newItemType, String fName, String lName, String name, String title)
	{
		this.setItemType(newItemType);
		this.setName(name);
		this.setTitleName(title);
		this.setFirstName(fName);
		this.setLastName(lName);
	}
	
	public Item(int newItemType, String fName, String lName, String title)
	{
		this.setItemType(newItemType);
		this.setTitleName(title);
		this.setFirstName(fName);
		this.setLastName(lName);
	}
	
	public Item(int newItemType, String name, String title)
	{
		this.setItemType(newItemType);
		this.setTitleName(title);
		this.setName(name);
	}
	
}


