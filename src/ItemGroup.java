import java.util.ArrayList;
import java.util.Iterator;

public class ItemGroup extends ItemComponent {

	ArrayList<ItemComponent> itemComponents = new ArrayList<ItemComponent>();

	String groupName;

	public ItemGroup(String newGroupName, int newGroupType) {
		groupName = newGroupName;
		setItemType(newGroupType);
	}

	public void add(ItemComponent newItemComponent) {

		itemComponents.add(newItemComponent);
	}

	public void remove(ItemComponent newItemComponent) {

		itemComponents.remove(newItemComponent);

	}
	
	public void clear() {

		itemComponents.clear();

	}

	public String getGroupName() {
		return groupName;
	}
	
	public ItemComponent getComponent(int componentIndex) {

		return (ItemComponent) itemComponents.get(componentIndex);

	}
	
	public ItemComponent getByIdComponent(int id) {
		
		Iterator<ItemComponent> itemIterator = itemComponents.iterator();
		
		while (itemIterator.hasNext()) {

			ItemComponent itemInfo = (ItemComponent) itemIterator.next();
			
			if(itemInfo.getID() == id)
				return itemInfo;

		}
		
		return null;
	}
	
	public Object[][] getTable()
	{
		if(itemComponents.size() > 0)
		{
			Object[][] data = new Object[itemComponents.size()][getComponent(0).getItem().length];
			
			Iterator<ItemComponent> itemIterator = itemComponents.iterator();
			
			int i = 0;
			
			while (itemIterator.hasNext()) {
		
				ItemComponent itemInfo = (ItemComponent) itemIterator.next();
				
				data[i] = itemInfo.getItem();
				
				i++;
			}
			return data;
		}
		else
			return null;
	}

}