import java.util.ArrayList;
import java.util.Iterator;

public class ItemGroup extends ItemComponent {

	ArrayList itemComponents = new ArrayList();

	String groupName;
	//ItemType groupType;

	public ItemGroup(String newGroupName, int newGroupType) {
		groupName = newGroupName;
		setItemType(newGroupType);
	}

	public String getGroupName() {
		return groupName;
	}

	public int getGroupType() {
		return getItemType();
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

	public ItemComponent getComponent(int componentIndex) {

		return (ItemComponent) itemComponents.get(componentIndex);

	}
	
	public Object[][] getTable()
	{
		if(itemComponents.size() > 0)
		{
			Object[][] data = new Object[itemComponents.size()][getComponent(0).getItem().length];
			
			Iterator itemIterator = itemComponents.iterator();
			
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

	public String displayInfo() 
	{		
		
		System.out.println(getGroupName() + " " + getGroupType() + "\n");

		// Cycles through and prints any Movie or MovieGroups added
		// to this MovieGroups ArrayList movieComponents
		Iterator itemIterator = itemComponents.iterator();

		while (itemIterator.hasNext()) {

			ItemComponent itemInfo = (ItemComponent) itemIterator.next();

			System.out.println(itemInfo.displayInfo());

		}
		
		return "done";

	}
}