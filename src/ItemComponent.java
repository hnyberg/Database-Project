
public abstract class ItemComponent 
{
	ItemType itemType = ItemType.UNDEFINED;
	int id = 0;
	int connectionID1 = 0;
	int connectionID2 = 0;
	String name = null;
	String firstName = null;
	String lastName = null;
	int releaseYear = 0;
	int birthYear = 0;
	String titleType = null;
	int runTime = 0;
	int original = 0;
	float grade = 0;
	String sex = null;
	
	public void add(ItemComponent newItemComponent)
	{
		throw new UnsupportedOperationException();
	}
	
	public void remove(ItemComponent newItemComponent) 
	{
		throw new UnsupportedOperationException();
	}
	
	public void clear()
	{
		throw new UnsupportedOperationException();
	}
	
	public Object[][] getTable()
	{
		throw new UnsupportedOperationException();
	}
	
	public ItemComponent getComponent(int componentIndex) 
	{
		throw new UnsupportedOperationException();
	}
	
	public int getItemType()
	{
		return itemType.type;
		//return itemType;
	}
	
	public void setItemType(int value) 
    {
		switch (value)
		{
			case 1:
				itemType = ItemType.TITLE;
				break;
			case 2:
				itemType = ItemType.ACTOR;
				break;
			case 3:
				itemType = ItemType.DIRECTOR;
				break;
			case 4:
				itemType = ItemType.WRITER;
				break;
			case 5:
				itemType = ItemType.GENRE;
				break;
			case 6:
				itemType = ItemType.GENRE_CONNECTION;
				break;
			case 7:
				itemType = ItemType.ACTOR_ROLE;
				break;
			case 8:
				itemType = ItemType.DIRECTOR_ROLE;
				break;
			case 9:
				itemType = ItemType.WRITER_ROLE;
				break;
			default:
				itemType = ItemType.UNDEFINED;
				break;
		}
    }
	
	public int getID()
	{
		return id;	                 
	}

	public void setId(int value)
    {
		id = value;
    }
	
	public String getName()
	{
		return name;
	}

	public void setName(String value) 
    {
		name = value;
    }
	
	public String getFirstName() 
	{
		return firstName;
	}
	
	public void setFirstName(String value) 
    {
		firstName = value;
    }
	
	public String getLastName() 
	{
		return lastName;
	}
	
	public void setLastName(String value) 
    {
    	lastName = value;
    }
	
	public int getReleaseYear()
	{
		return releaseYear;	                 
	}
	
	public void setReleaseYear(int value) 
    {
		releaseYear = value;
    }
	
	public int getBirthYear()
	{
		return birthYear;
	}
	
	public void setBirthYear(int value) 
    {
		birthYear = value;
    }
	
	public String getTitleType()
	{
		return titleType;
	}
	
	public void setTitleType(String value) 
    {
		titleType = value;
    }
	
	public int getRunTime()
	{
		return runTime;
	}
	
	public void setRunTime(int value) 
    {
		runTime = value;
    }
	
	public int getOriginal()
	{
		return original;
	}
	
	public void setOriginal(int value) 
    {
		original = value;
    }
	
	public float getGrade()
	{
		return grade;
	}
	
	public void setGrade(float value) 
    {
		grade = value;
    }
	
	public String getSex()
	{
		return sex;
	}
    
    public void setSex(String value) 
    {
    	sex = value;
    }
    
    public int getConnectionID1()
	{
		return connectionID1;
	}
    
    public void setConnectionID1(int value) 
    {
    	connectionID1 = value;
    }
    
    public int getConnectionID2()
	{
		return connectionID2;
	}
    
    public void setConnectionID2(int value) 
    {
    	connectionID2 = value;
    }
	
	public String displayInfo() 
	{
		switch (itemType)
		{
			case TITLE:
				return "" + id + " " + name + " " + titleType + " " + releaseYear
						+ " " + runTime + " " + grade + " " + original;
			case ACTOR:
				return "" + id + " " + firstName + " " + lastName + " " + sex + " " + birthYear;
			case DIRECTOR:
				return "" + id + " " + firstName + " " + lastName + " " + birthYear;
			case WRITER:
				return "" + id + " " + firstName + " " + lastName + " " + birthYear;
			case GENRE:
				return "" + id + " " + name;
			case GENRE_CONNECTION:
				return "" + id + " " + connectionID1 + " " + connectionID2;
			case DIRECTOR_ROLE:
				return "" + id + " " + connectionID1 + " " + connectionID2;
			case WRITER_ROLE:
				return "" + id + " " + connectionID1 + " " + connectionID2;
			case ACTOR_ROLE:
				return "" + id + " " + name + " " + connectionID1 + " " + connectionID2;
			default:
				return null;
		}
	}
	
	public Object[] getItem()
	{
		switch (itemType)
		{
			case TITLE:
<<<<<<< HEAD:src/ItemComponent.java
				return new Object[] { name, titleType, releaseYear,
					runTime, grade, original };
			case ACTOR:
				return new Object[] { firstName, lastName, sex, birthYear };
			case DIRECTOR:
				return new Object[] { firstName, lastName, birthYear };
			case WRITER:
				return new Object[] { firstName, lastName, birthYear };
			case GENRE:
				return new Object[] { name };
			case GENRE_CONNECTION:
				return new Object[] { connectionID1, connectionID2 };
			case DIRECTOR_ROLE:
				return new Object[] { connectionID1, connectionID2 };
			case WRITER_ROLE:
				return new Object[] { connectionID1, connectionID2 };
			case ACTOR_ROLE:
				return new Object[] { name, connectionID1, connectionID2 };
=======
				return new Object[] { id, name, titleType, releaseYear,
					runTime, grade, original };
			case ACTOR:
				return new Object[] { id, firstName, lastName, sex, birthYear };
			case DIRECTOR:
				return new Object[] { id, firstName, lastName, birthYear };
			case WRITER:
				return new Object[] { id, firstName, lastName, birthYear };
			case GENRE:
				return new Object[] { id, name };
			case GENRE_CONNECTION:
				return new Object[] { id, connectionID1, connectionID2 };
			case DIRECTOR_ROLE:
				return new Object[] {id, connectionID1, connectionID2 };
			case WRITER_ROLE:
				return new Object[] { id, connectionID1, connectionID2 };
			case ACTOR_ROLE:
				return new Object[] { id, name, connectionID1, connectionID2 };
>>>>>>> refs/remotes/origin/master:src/ItemComponent.java
			default:
				return null;
		}
	}
	
	public enum ItemType
	{
		UNDEFINED(0),TITLE(1), ACTOR(2), DIRECTOR(3), WRITER(4), GENRE(5), GENRE_CONNECTION(6),
		ACTOR_ROLE(7), DIRECTOR_ROLE(8), WRITER_ROLE(9);
		private final int type;
		private ItemType(int type)
		{
			this.type = type;
		}
		
		public int getType()
		{
			return type;
		}
	}
}
