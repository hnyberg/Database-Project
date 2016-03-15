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
<<<<<<< HEAD:src/ItemGroup.java
		Object[][] data = new Object[itemComponents.size()][getComponent(1).getItem().length];
		
		Iterator itemIterator = itemComponents.iterator();
		
		int i = 0;
		
=======
		Object[][] data = new Object[][]{};
		
		Iterator itemIterator = itemComponents.iterator();
		
>>>>>>> refs/remotes/origin/master:src/ItemGroup.java
		while (itemIterator.hasNext()) {

			ItemComponent itemInfo = (ItemComponent) itemIterator.next();
			
<<<<<<< HEAD:src/ItemGroup.java
			data[i] = itemInfo.getItem();
			
			i++;
		}
=======
			data = new Object[][] { itemInfo.getItem() };

		}
		
>>>>>>> refs/remotes/origin/master:src/ItemGroup.java
		return data;
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