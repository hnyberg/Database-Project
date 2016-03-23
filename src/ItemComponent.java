
public abstract class ItemComponent 
{
	ItemType itemType = ItemType.UNDEFINED;
	
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
	
	public String getGroupName() 
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

	public ItemComponent getByIdComponent(int id2) 
	{
		throw new UnsupportedOperationException();
	}
	
	public int getID()
	{
		throw new UnsupportedOperationException();                
	}

	public void setId(int value)
    {
		throw new UnsupportedOperationException();
    }
	
    public void setItem(Object[] item)
    {
    	throw new UnsupportedOperationException();
    }
	
	public Object[] getItem()
	{	
		throw new UnsupportedOperationException();
	}
	
	public int getItemType()
	{
		throw new UnsupportedOperationException();
	}
	
	public void setItemType(int value) 
    {
		throw new UnsupportedOperationException();
    }
	
	public enum ItemType
	{
		UNDEFINED(0),TITLE(1), ACTOR(2), DIRECTOR(3), WRITER(4), GENRE(5), GENRE_CONNECTION(6),
		ACTOR_ROLE(7), DIRECTOR_ROLE(8), WRITER_ROLE(9);
		private int type;
		private ItemType(int type)
		{
			this.type = type;
		}
		
		public void setType(int type)
		{
			this.type = type;
		}
		
		public int getType()
		{
			return type;
		}
	}
}
