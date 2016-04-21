import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

public class View extends JFrame{

	//	DIMENSION CONTSTANTS
	private final int BIG_FONT_SIZE = 18;
	private final int TITLE_FONT_SIZE = 45;
	
	private final int WINDOW_HEIGHT = 576;
	private final int TOP_PANEL_HEIGHT = 90;
	private final int BOTTOM_PANEL_HEIGHT = 70;
	private final int LABEL_HEIGHT = 35;
	private final int LIST_PANEL_HEIGHT = WINDOW_HEIGHT - TOP_PANEL_HEIGHT - BOTTOM_PANEL_HEIGHT;
	
	private final int WINDOW_WIDTH = 1024;
	private final int LEFT_PANEL_WIDTH = 160;
	private final int RIGHT_PANEL_WIDTH = 180;
	private final int LABEL_WIDTH = 140;
	private final int MID_PANEL_WIDTH = WINDOW_WIDTH - LEFT_PANEL_WIDTH - RIGHT_PANEL_WIDTH;
	
	private final Dimension LABEL_DIMENSION = new Dimension(LABEL_WIDTH, LABEL_HEIGHT);
	
	//	VARIABLE FIELDS
	int activeTab;
	
	private final String[] titleColumnNames = {"ID","Title", "Type", "Year", "Length", "Rating", "Netflix Original"};
	private final String[] genreColumnNames = {"ID","Genre"};
	private final String[] actorColumnNames = {"ID","First Name", "Last Name", "Sex", "Year"};
	private final String[] writerColumnNames = {"ID","First Name", "Last Name", "Year"};
	private final String[] directorColumnNames = {"ID","First Name", "Last Name", "Year"};
	private final String[] genreConnectionColumnNames = {"Genre", "Title"};
	private final String[] actorRoleColumnNames = {"First Name", "Last Name", "Role", "Title"};
	private final String[] writerRoleColumnNames = {"First Name", "Last Name", "Title"};
	private final String[] directorRoleColumnNames = {"First Name", "Last Name", "Title"};
	
	//	OBJECT FIELDS
	private Font standardFont;
	private Font titleFont;
	private ItemManager itemManager;
	
	private JLabel insertLabel;
	private JLabel topLabel;
	private JLabel tabLabel;
	
	private JPanel mainPanel;
	private JPanel leftPanel;
	private JPanel midPanel;
	private JPanel rightPanel;
	private JPanel topPanel;
	private JPanel listPanel;
	private JPanel bottomPanel;
	
	private JScrollPane searchPane;
	private JTable currentTable;
	private JTextField searchField;
	private JTextField idField;
	
	//	VECTOR FIELDS
	
	private Vector<JButton> tabButtons;
	private Vector<JButton> insertButtons;
	private Vector<JButton> bottomButtons;
	private Vector<JButton> getDataButtons;
	private Vector<JButton> updateButtons;
	
	private Vector<JPanel> insertPanels;
	
	private Vector<JLabel> titleLabels;
	private Vector<JLabel> actorLabels;
	private Vector<JLabel> writerLabels;
	private Vector<JLabel> directorLabels;
	
	private Vector<JScrollPane> scrollPanes;
	private Vector<JTextField> titleFields;
	private Vector<JTextField> actorFields;
	private Vector<JTextField> writerFields;
	private Vector<JTextField> directorFields;
	private Vector<JTextField> getIDFields;
	private Vector<String> tabStrings;
	
	//	COLOR CONSTANTS
	private final Color BACKGROUND_COLOR = new Color(0.1f,0.1f,0.1f);
	private final Color RED = new Color(0.8f,0.2f,0.2f);
	private final Color WHITE = new Color(0.9f,0.9f,0.9f);
	private final Color GREY = new Color(0.5f, 0.5f, 0.5f);
	
	public static void main(String[] args) {
		new View();
	}
	
	//	CONSTRUCTOR
	public View(){
		initView();
	}
	
	private void initView(){
		
		//	SET MAIN WINDOW
		setTitle("Netflix");
		setSize(WINDOW_WIDTH, WINDOW_HEIGHT);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setResizable(false);
		setFocusable(true);
		
		//	CREATE ITEM MANAGER
		itemManager = new ItemManager();
		
		//	CREATE FONTS
		standardFont = new Font(Font.MONOSPACED, Font.BOLD, BIG_FONT_SIZE);
		titleFont = new Font(Font.MONOSPACED, Font.BOLD, TITLE_FONT_SIZE);
		
		//	SET MAIN PANEL
		mainPanel = new JPanel();
		mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.X_AXIS));
		mainPanel.setBackground(BACKGROUND_COLOR);
		add(mainPanel);
		
		//	SET LEFT PANEL
		leftPanel = new JPanel();
		leftPanel.setLayout(new BoxLayout(leftPanel, BoxLayout.Y_AXIS));
		leftPanel.setPreferredSize(new Dimension(LEFT_PANEL_WIDTH, WINDOW_HEIGHT));
		leftPanel.setBackground(BACKGROUND_COLOR);
		mainPanel.add(leftPanel);
		
		tabLabel = new JLabel("TABLES:");
		tabLabel.setFont(standardFont);
		tabLabel.setForeground(WHITE);
		leftPanel.add(tabLabel);
		leftPanel.add(new JLabel(" "));
		
		tabStrings = new Vector<String>(1,1);
		tabButtons = new Vector<JButton>(1,1);
		
		tabStrings.add("Titles");
		tabStrings.add("Genres");
		tabStrings.add("Actors");
		tabStrings.add("Writers");
		tabStrings.add("Directors");
		tabStrings.add("GenConns");
		tabStrings.add("ActRoles");
		tabStrings.add("WriRoles");
		tabStrings.add("DirRoles");
		
		for (int i = 0; i < tabStrings.size(); i++){
			tabButtons.add(new JButton(tabStrings.get(i)));
			tabButtons.get(i).setFont(standardFont);
			tabButtons.get(i).setBackground(BACKGROUND_COLOR);
			tabButtons.get(i).setForeground(GREY);
			tabButtons.get(i).addActionListener(new TabListener());
			leftPanel.add(tabButtons.get(i));
			leftPanel.add(new JLabel(" "));
		}
		
		//	SET MID PANEL
		midPanel = new JPanel();
		midPanel.setLayout(new BoxLayout(midPanel, BoxLayout.Y_AXIS));
		midPanel.setBackground(BACKGROUND_COLOR);
		mainPanel.add(midPanel);
		
		//	SET TOP PANEL
		topPanel = new JPanel();
		topPanel.setLayout(new GridBagLayout());
		topPanel.setPreferredSize(new Dimension(MID_PANEL_WIDTH, TOP_PANEL_HEIGHT));
		topPanel.setBackground(BACKGROUND_COLOR);
		midPanel.add(topPanel);
		
		topLabel = new JLabel("N E T F L I X");
		topLabel.setFont(titleFont);
		topLabel.setForeground(RED);
		topPanel.add(topLabel);
		
		//	SET LIST PANEL
		listPanel = new JPanel();
		listPanel.setLayout(new BorderLayout());
		listPanel.setBackground(BACKGROUND_COLOR);
		listPanel.setPreferredSize(new Dimension(MID_PANEL_WIDTH, LIST_PANEL_HEIGHT));
		midPanel.add(listPanel);
		
		//	SET LIST PANEL CONTENTS
		updateTables();
		
		//	SET BOTTOM PANEL
		bottomPanel = new JPanel();
		bottomPanel.setBackground(BACKGROUND_COLOR);
		
		searchField = new JTextField("search");
		searchField.setFont(standardFont);
		searchField.setPreferredSize(LABEL_DIMENSION);
		searchField.setHorizontalAlignment(SwingConstants.CENTER);
		bottomPanel.add(searchField);
		
		bottomButtons = new Vector<JButton>(1,1);
		bottomButtons.add(new JButton("SEARCH"));
		bottomButtons.add(new JButton("DELETE"));
		
		for (int i = 0; i < bottomButtons.size(); i++){
			bottomButtons.get(i).setFont(standardFont);
			bottomButtons.get(i).setPreferredSize(LABEL_DIMENSION);
			bottomButtons.get(i).setBackground(BACKGROUND_COLOR);
			bottomButtons.get(i).setForeground(RED);
			bottomButtons.get(i).addActionListener(new BottomListener());
		}
		bottomPanel.add(bottomButtons.get(0));
		
		idField = new JTextField("id");
		idField.setFont(standardFont);
		idField.setPreferredSize(LABEL_DIMENSION);
		idField.setHorizontalAlignment(SwingConstants.CENTER);
		
		bottomPanel.add(idField);
		bottomPanel.add(bottomButtons.get(1));

		midPanel.add(bottomPanel);
		
		//	SET RIGHT PANEL
		rightPanel = new JPanel();
		rightPanel.setPreferredSize(new Dimension(RIGHT_PANEL_WIDTH, WINDOW_HEIGHT));
		rightPanel.setBackground(BACKGROUND_COLOR);
		mainPanel.add(rightPanel);
		
		insertLabel = new JLabel("INSERT:");
		insertLabel.setFont(standardFont);
		insertLabel.setForeground(WHITE);
		rightPanel.add(insertLabel);
		rightPanel.add(new JLabel(" "));
		
		//	-> SET INSERT PANELS
		insertPanels = new Vector<JPanel>(1,1);
		for (int i = 0; i <tabStrings.size(); i++){
			insertPanels.add(new JPanel());
			insertPanels.get(i).setLayout(new BoxLayout(insertPanels.get(i), BoxLayout.Y_AXIS));
			insertPanels.get(i).setBackground(BACKGROUND_COLOR);
		}
		
		//	-> SET INSERT PANEL CONTENTS
		insertButtons = new Vector<JButton>(1,1);
		getDataButtons = new Vector<JButton>(1,1);
		updateButtons = new Vector<JButton>(1,1);
		getIDFields = new Vector<JTextField>(1,1);
		for (int i = 0; i < insertPanels.size(); i++){
			insertButtons.add(new JButton("INSERT"));
			insertButtons.get(i).setFont(standardFont);
			insertButtons.get(i).setPreferredSize(LABEL_DIMENSION);
			insertButtons.get(i).setBackground(BACKGROUND_COLOR);
			insertButtons.get(i).setForeground(RED);
			insertButtons.get(i).addActionListener(new RightPanelListener());
			
			getDataButtons.add(new JButton("GET DATA"));
			getDataButtons.get(i).setFont(standardFont);
			getDataButtons.get(i).setPreferredSize(LABEL_DIMENSION);
			getDataButtons.get(i).setBackground(BACKGROUND_COLOR);
			getDataButtons.get(i).setForeground(RED);
			getDataButtons.get(i).addActionListener(new RightPanelListener());
			
			updateButtons.add(new JButton("UPDATE"));
			updateButtons.get(i).setFont(standardFont);
			updateButtons.get(i).setPreferredSize(LABEL_DIMENSION);
			updateButtons.get(i).setBackground(BACKGROUND_COLOR);
			updateButtons.get(i).setForeground(RED);
			updateButtons.get(i).addActionListener(new RightPanelListener());
			
			getIDFields.add(new JTextField("id"));
			getIDFields.get(i).setHorizontalAlignment(SwingConstants.CENTER);
			getIDFields.get(i).setFont(standardFont);
		}
		
		//	-> SET INSERT-TITLE PANEL
		activeTab = 0;
		titleLabels = new Vector<JLabel>(1,1);
		titleLabels.add(new JLabel("Title:"));
		titleLabels.add(new JLabel("Type:"));
		titleLabels.add(new JLabel("Year:"));
		titleLabels.add(new JLabel("Minutes:"));
		titleLabels.add(new JLabel("Grade:"));
		titleLabels.add(new JLabel("Original:"));
		
		titleFields = new Vector<JTextField>(1,1);
		for (int i = 0; i < titleLabels.size(); i++){
			titleFields.add(new JTextField(""));
			titleFields.get(i).setFont(standardFont);
			titleLabels.get(i).setFont(standardFont);
			titleLabels.get(i).setForeground(WHITE);
			insertPanels.get(activeTab).add(titleLabels.get(i));
			insertPanels.get(activeTab).add(titleFields.get(i));
		}
		
		//	-> SET INSERT-ACTOR PANEL
		activeTab = 2;
		actorLabels = new Vector<JLabel>(1,1);
		actorLabels.add(new JLabel("First Name:"));
		actorLabels.add(new JLabel("Last Name:"));
		actorLabels.add(new JLabel("Sex:"));
		actorLabels.add(new JLabel("Year:"));
		
		actorFields = new Vector<JTextField>(1,1);
		for (int i = 0; i < actorLabels.size(); i++){
			actorFields.add(new JTextField(""));
			actorFields.get(i).setFont(standardFont);
			actorLabels.get(i).setFont(standardFont);
			actorLabels.get(i).setForeground(WHITE);
			insertPanels.get(activeTab).add(actorLabels.get(i));
			insertPanels.get(activeTab).add(actorFields.get(i));
		}
		
		//	-> SET INSERT-WRITER PANEL
		activeTab = 3;
		writerLabels = new Vector<JLabel>(1,1);
		writerLabels.add(new JLabel("First Name:"));
		writerLabels.add(new JLabel("Last Name:"));
		writerLabels.add(new JLabel("Year:"));
		
		writerFields = new Vector<JTextField>(1,1);
		
		for (int i = 0; i < writerLabels.size(); i++){
			writerFields.add(new JTextField(""));
			writerFields.get(i).setFont(standardFont);
			writerLabels.get(i).setFont(standardFont);
			writerLabels.get(i).setForeground(WHITE);
			insertPanels.get(activeTab).add(writerLabels.get(i));
			insertPanels.get(activeTab).add(writerFields.get(i));
		}
		
		//	-> SET INSERT-DIRECTOR PANEL
		activeTab = 4;
		directorLabels = new Vector<JLabel>(1,1);
		directorLabels.add(new JLabel("First Name:"));
		directorLabels.add(new JLabel("Last Name:"));
		directorLabels.add(new JLabel("Year:"));
		
		directorFields = new Vector<JTextField>(1,1);
		
		for (int i = 0; i < directorLabels.size(); i++){
			directorFields.add(new JTextField(""));
			directorFields.get(i).setFont(standardFont);
			directorLabels.get(i).setFont(standardFont);
			directorLabels.get(i).setForeground(WHITE);
			insertPanels.get(activeTab).add(directorLabels.get(i));
			insertPanels.get(activeTab).add(directorFields.get(i));
		}
		
		//	INSERT MORE CONTENTS ON EVERY PANEL
		for (int i = 0; i < insertPanels.size(); i++){
			insertPanels.get(i).add(new JLabel(" "));
			insertPanels.get(i).add(insertButtons.get(i));
			insertPanels.get(i).add(new JLabel(" "));
			insertPanels.get(i).add(getIDFields.get(i));
			insertPanels.get(i).add(getDataButtons.get(i));
			insertPanels.get(i).add(new JLabel(" "));
			insertPanels.get(i).add(updateButtons.get(i));
		}
		
		//	-> ADD ALL INSERT PANELS (INVISIBLE FOR NOW)
		for (int i = 0; i < insertPanels.size(); i++){
			rightPanel.add(insertPanels.get(i));
			insertPanels.get(i).setVisible(false);
		}
		
		//	SET TITLE PANEL ACTIVE
		activeTab = 0;
		listPanel.add(scrollPanes.get(activeTab));
		insertPanels.get(activeTab).setVisible(true);
		tabButtons.get(activeTab).setForeground(WHITE);
		
		//	START GUI
		setVisible(true);
	}
	
	private void updateTables(){
		
		//	SET NEW SCROLL PANES
		scrollPanes = new Vector<JScrollPane>(1,1);
		scrollPanes.add(new JScrollPane(new JTable(itemManager.getTable("titles"), titleColumnNames)));
		scrollPanes.add(new JScrollPane(new JTable(itemManager.getTable("genre"), genreColumnNames)));
		scrollPanes.add(new JScrollPane(new JTable(itemManager.getTable("actors"), actorColumnNames)));
		scrollPanes.add(new JScrollPane(new JTable(itemManager.getTable("writers"), writerColumnNames)));
		scrollPanes.add(new JScrollPane(new JTable(itemManager.getTable("directors"), directorColumnNames)));
		scrollPanes.add(new JScrollPane(new JTable(itemManager.getTable("genreconnections"), genreConnectionColumnNames)));
		scrollPanes.add(new JScrollPane(new JTable(itemManager.getTable("actorroles"), actorRoleColumnNames)));
		scrollPanes.add(new JScrollPane(new JTable(itemManager.getTable("writerroles"), writerRoleColumnNames)));
		scrollPanes.add(new JScrollPane(new JTable(itemManager.getTable("directorroles"), directorRoleColumnNames)));
		
		//	ADJUST COLUMN WITHS
		//	->	TITLES
		currentTable = (JTable)scrollPanes.get(0).getViewport().getView();
		currentTable.getColumnModel().getColumn(0).setMaxWidth(30);
		currentTable.getColumnModel().getColumn(1).setPreferredWidth(180);
		//	->	GENRES
		currentTable = (JTable)scrollPanes.get(1).getViewport().getView();
		currentTable.getColumnModel().getColumn(0).setMaxWidth(30);
		//	->	ACTORS
		currentTable = (JTable)scrollPanes.get(2).getViewport().getView();
		currentTable.getColumnModel().getColumn(0).setMaxWidth(30);
		//	->	WRITERS
		currentTable = (JTable)scrollPanes.get(3).getViewport().getView();
		currentTable.getColumnModel().getColumn(0).setMaxWidth(30);
		//	->	DIRECTORS
		currentTable = (JTable)scrollPanes.get(4).getViewport().getView();
		currentTable.getColumnModel().getColumn(0).setMaxWidth(30);
		//	->	ACTOR ROLES
		currentTable = (JTable)scrollPanes.get(6).getViewport().getView();
		currentTable.getColumnModel().getColumn(3).setPreferredWidth(150);
		
		for (int i = 0; i < scrollPanes.size(); i++){
			currentTable = (JTable)scrollPanes.get(i).getViewport().getView();
			currentTable.setAutoCreateRowSorter(true);
		}
		
		//	UPDATE LIST PANEL
		listPanel.removeAll();
		listPanel.add(scrollPanes.get(activeTab));
		listPanel.validate();
	}
	
	public void clearFields()
	{
		// Clear Fields
		for (int i = 0; i < titleFields.size(); i++){
			titleFields.get(i).setText("");
		}
		for (int i = 0; i < actorFields.size(); i++){
			actorFields.get(i).setText("");
		}
		for (int i = 0; i < writerFields.size(); i++){
			writerFields.get(i).setText("");
		}
		for (int i = 0; i < directorFields.size(); i++){
			directorFields.get(i).setText("");
		}
	}
	
	class TabListener implements ActionListener{
		public void actionPerformed(ActionEvent e)
		{
			//	CLEAR MID PANEL AND HIDE RIGHT PANELS
			listPanel.removeAll();
			clearFields();
			for (int i = 0; i < insertPanels.size(); i++){
				insertPanels.get(i).setVisible(false);
			}
			
			// GREYOUT ALL TAB BUTTONS
			for (int i = 0; i < tabButtons.size(); i++)
			{
				tabButtons.get(i).setForeground(GREY);
				
				// GET CLICKED BUTTON
				if(tabButtons.get(i).equals((JButton)(e.getSource())))
				{
					// SET CLICKED TAB TO ACTIVE (AND VISIBLE)
					activeTab = i;
					tabButtons.get(i).setForeground(WHITE);
					//	ONLY CERTAIN INSERT PANELS SHOULD BE VISIBLE/AVAILABLE
					if(i < 5 && i != 1)
					{
						insertPanels.get(activeTab).setVisible(true);
					}
				}
			}
			updateTables();
		}
	}
	
	class BottomListener implements ActionListener{
		public void actionPerformed(ActionEvent e)
		{
			// CHECK IF "SEARCH" OR "DELETE" BUTTON
			switch (bottomButtons.indexOf((JButton)(e.getSource())))
			{
				// Search SQL with searchField text and create Table
				case 0:
					itemManager.searchTables(searchField.getText());
					searchPane = new JScrollPane(new JTable(itemManager.getTable("search"), new String[]{"","",""}));
					listPanel.removeAll();
					listPanel.add(searchPane);
					listPanel.validate();
					break;
				// Remove SQL Item From ID then Update Table
				case 1:
					try {
						itemManager.removeItem(itemManager.getItemComponent(Integer.parseInt(idField.getText()), activeTab));
						updateTables();
						
					} catch (NumberFormatException e1) {
						e1.printStackTrace();
					} catch (Exception e1) {
						e1.printStackTrace();
					}
					break;
				default:
					break;
			}
		}
	}
	
	class RightPanelListener implements ActionListener
	{
		public boolean notEmpty(int tab)
		{
			// Check if Fields are empty depending on Table
			switch (tab)
			{
				case 0:
					for (int i = 0; i < titleFields.size(); i++){
						if (titleFields.get(i).getText().equals("")){
							return false;
						}
					}
					return true;
				case 2:
					for (int i = 0; i < actorFields.size(); i++){
						if(actorFields.get(i).getText().equals("")){
							return false;
						}
					}
					return true;
				case 3:
					for (int i = 0; i < writerFields.size(); i++){
						if (writerFields.get(i).getText().equals("")){
							return false;
						}
					}
					return true;
				case 4:
					for (int i = 0; i < directorFields.size(); i++){
						if (directorFields.get(i).getText().equals("")){
							return false;
						}
					}
					return true;
				default:
					return false;
			}
		}

		
		public void actionPerformed(ActionEvent e)
		{
			// Variables
			ItemComponent insertItem = new ItemGroup("Insert", 0);
			ItemComponent item = null;
			int id = 0;
			boolean idOK = true;
			
			if(((JButton)(e.getSource())).getText() == "UPDATE" || ((JButton)(e.getSource())).getText() == "GET DATA" )
			{
				// Get ID and check ID
				try{
					id = Integer.parseInt(getIDFields.get(activeTab).getText());
					item = itemManager.getItemComponent(id, activeTab);
				}
				catch(Exception idE){
					idOK = false;
				}
			}
			
			// Insert Button Clicked
			if(((JButton)(e.getSource())).getText() == "INSERT")
			{
				// Check if Data in Fields
				if (notEmpty(activeTab))
				{
					// Insert Data in a new Item depending on Table
					switch (activeTab)
					{	
						case 0:
							insertItem.add(new Item(1, 0, titleFields.get(0).getText(), titleFields.get(1).getText(),
								Integer.parseInt(titleFields.get(2).getText()), Integer.parseInt(titleFields.get(3).getText()),
								Float.parseFloat(titleFields.get(4).getText()), Integer.parseInt(titleFields.get(5).getText())));
							break;
						case 2:
							insertItem.add(new Item(2, 0, actorFields.get(0).getText(), actorFields.get(1).getText(),
								actorFields.get(2).getText(), Integer.parseInt(actorFields.get(3).getText())));
							break;
						case 3:
							insertItem.add(new Item(4, 0, writerFields.get(0).getText(), writerFields.get(1).getText(),
								Integer.parseInt(writerFields.get(2).getText())));
							break;
						case 4:
							insertItem.add(new Item(3, 0, directorFields.get(0).getText(), directorFields.get(1).getText(),
								Integer.parseInt(directorFields.get(2).getText())));
							break;
						default:
							break;
					}
					try {
						// Send Item To SQL and Update Table
						itemManager.insertItem(insertItem.getComponent(0));
						clearFields();
						updateTables();
						
					} catch (Exception e1) {
						e1.printStackTrace();
					}
				}
				insertItem.clear();
			}
			else if (idOK) // If ID OK;
			{
				// Get Data and Update Buttons
				switch (((JButton)(e.getSource())).getText())
				{
					// Start Data Buttons
					case "GET DATA":
						// Get Data From Item and set in Fields depending on Table
						switch (activeTab)
						{
							case 0:
								for (int i = 0; i < titleFields.size(); i++){
									titleFields.get(i).setText(item.getItem()[i + 1].toString());
								}
								break;
							case 2:
								for (int i = 0; i < actorFields.size(); i++){
									actorFields.get(i).setText(item.getItem()[i + 1].toString());
								}
								break;
							case 3:
								for (int i = 0; i < writerFields.size(); i++){
									writerFields.get(i).setText(item.getItem()[i + 1].toString());
								}
								break;
							case 4:
								for (int i = 0; i < directorFields.size(); i++){
									directorFields.get(i).setText(item.getItem()[i + 1].toString());
								}
								break;
							default:
								break;
						}
						// End Data Buttons
						break;
					// Start Update Buttons
					case "UPDATE":
						// Check if Data in Fields
						if (notEmpty(activeTab))
						{
							// Put New Data In Item depending on Table
							switch (activeTab)
							{
								case 0:
									item.setTitleName(titleFields.get(0).getText());
									item.setTitleType(titleFields.get(1).getText());
									item.setReleaseYear(Integer.parseInt(titleFields.get(2).getText()));
									item.setRunTime(Integer.parseInt(titleFields.get(3).getText()));
									item.setGrade(Float.parseFloat(titleFields.get(4).getText()));
									item.setOriginal(Integer.parseInt(titleFields.get(5).getText()));
									break;
								case 2:
									item.setFirstName(actorFields.get(0).getText());
									item.setLastName(actorFields.get(1).getText());
									item.setSex(actorFields.get(2).getText());
									item.setBirthYear(Integer.parseInt(actorFields.get(3).getText()));
									break;
								case 3:
									item.setFirstName(writerFields.get(0).getText());
									item.setLastName(writerFields.get(1).getText());
									item.setBirthYear(Integer.parseInt(writerFields.get(2).getText()));
									break;
								case 4:
									item.setFirstName(directorFields.get(0).getText());
									item.setLastName(directorFields.get(1).getText());
									item.setBirthYear(Integer.parseInt(directorFields.get(2).getText()));
									break;
								default:
									break;
							}
							try {
								// Send changes to SQL and Update Table
								itemManager.updateItem(item);
								clearFields();
								updateTables();
								
							} catch (Exception e1) {
								e1.printStackTrace();
							}
						}
						break;
					default:
						break;
					//	End of GET DATA / UPDATE
				}
			}
		}
	}
}