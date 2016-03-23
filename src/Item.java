
public class Item extends ItemComponent
{
	Object[] item;
	int id = 0;
	
	public Item() {	}
	
	public Item(int newItemType, Object[] item) 
	{
		this.itemType.setType(newItemType);
		this.item = item;
		
		if(item[0].getClass().equals(Integer.class))
		{
			this.id = (int) item[0];
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
	
    public void setItem(Object[] item)
    {
    	this.item = item;
    }
	
	public Object[] getItem()
	{	
		return item;
	}
	
	public int getItemType()
	{
		return itemType.getType();
	}
	
	public void setItemType(int value) 
    {
		itemType.setType(value);
    }
}


