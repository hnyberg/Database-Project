import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JViewport;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

public class View  extends JFrame{

	//	DIMENSION CONTSTANTS
	private final int BIG_FONT_SIZE = 18;
	private final int TITLE_FONT_SIZE = 45;
	
	private final int WINDOW_HEIGHT = 576;
	private final int TOP_PANEL_HEIGHT = 100;
	private final int BOTTOM_PANEL_HEIGHT = 60;
	private final int LIST_PANEL_HEIGHT = WINDOW_HEIGHT - TOP_PANEL_HEIGHT - BOTTOM_PANEL_HEIGHT;
	
	private final int WINDOW_WIDTH = 1024;
	private final int MID_PANEL_WIDTH = 650;
	private final int LEFT_PANEL_WIDTH = 200;
	private final int RIGHT_PANEL_WIDTH = 150;
	
	private final int LABEL_WIDTH = 180;
	private final int LABEL_HEIGHT = 40;
	
	private final Dimension LABEL_DIMENSION = new Dimension(LABEL_WIDTH, LABEL_HEIGHT);
	
	//	VARIABLE FIELDS
	int activeTab;
	
	//	OBJECT FIELDS
	private Font standardFont;
	private Font titleFont;
	private GridBagConstraints constraints;
	private ItemManager itemManager;
	
	private JLabel insertLabel;
	private JLabel mainLabel;
	private JLabel tabLabel;
	private JLabel fillerLabel;
	
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
	private Vector<JButton> getIDButtons;
	private Vector<JButton> updateButtons;
	
	private Vector<JPanel> insertPanels;
	
	private Vector<JLabel> titleLabels;
	private Vector<JLabel> genreLabels;
	private Vector<JLabel> actorLabels;
	private Vector<JLabel> writerLabels;
	private Vector<JLabel> directorLabels;
	
	private Vector<JScrollPane> scrollPanes;
	private Vector<JTextField> titleFields;
	private Vector<JTextField> genreFields;
	private Vector<JTextField> actorFields;
	private Vector<JTextField> writerFields;
	private Vector<JTextField> directorFields;
	private Vector<JTextField> getIDFields;
	private Vector<String> tabStrings;
	
	//	COLOR CONSTANTS
	private final Color BACKGROUND_COLOR = new Color(0.2f,0.2f,0.2f);
	private final Color RED = new Color(0.7f,0.3f,0.3f);
	private final Color GREEN = new Color(0.2f,0.6f,0.2f);
	private final Color BLUE = new Color(0.2f,0.2f,0.6f);
	private final Color CYAN = new Color(0.2f,0.6f,0.6f);
	private final Color WHITE = new Color(0.9f,0.9f,0.9f);
	private final Color GREY = new Color(0.5f, 0.5f, 0.5f);
	private final Color YELLOW = new Color(0.8f, 0.8f, 0.5f);
	
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
		
		//	CREATE MANAGERS
		itemManager = new ItemManager();
		
		//	CREATE FONTS
		standardFont = new Font(Font.MONOSPACED, Font.BOLD, BIG_FONT_SIZE);
		titleFont = new Font(Font.MONOSPACED, Font.BOLD, TITLE_FONT_SIZE);
		
		//	SET MAIN PANEL
		mainPanel = new JPanel();
		mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.X_AXIS));
		mainPanel.setPreferredSize(new Dimension(WINDOW_WIDTH, WINDOW_HEIGHT));
		mainPanel.setBackground(BACKGROUND_COLOR);
		add(mainPanel);
		
		//	SET LEFT PANEL
		leftPanel = new JPanel();
		leftPanel.setLayout(new BoxLayout(leftPanel, BoxLayout.Y_AXIS));
		leftPanel.setPreferredSize(new Dimension(LEFT_PANEL_WIDTH, WINDOW_HEIGHT));
		leftPanel.setBackground(BACKGROUND_COLOR);
		mainPanel.add(leftPanel);
		
		tabLabel = new JLabel(" TABLES:");
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
		tabStrings.add("GenreConns");
		tabStrings.add("ActorRoles");
		tabStrings.add("WriterRoles");
		tabStrings.add("DirectorRoles");
		
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
		
		mainLabel = new JLabel("Netflix");
		mainLabel.setFont(titleFont);
		mainLabel.setForeground(RED);
		topPanel.add(mainLabel);
		
		//	SET LIST PANEL
		listPanel = new JPanel();
		listPanel.setLayout(new BorderLayout());
		listPanel.setPreferredSize(new Dimension(MID_PANEL_WIDTH, LIST_PANEL_HEIGHT));
		midPanel.add(listPanel);
		
		//	SET LIST PANEL CONTENTS
		updateTables();
		
		//	SET BOTTOM PANEL
		bottomPanel = new JPanel();
		bottomPanel.setLayout(new BoxLayout(bottomPanel, BoxLayout.X_AXIS));
		bottomPanel.setPreferredSize(new Dimension(MID_PANEL_WIDTH, BOTTOM_PANEL_HEIGHT));
		bottomPanel.setBackground(BACKGROUND_COLOR);
		
		searchField = new JTextField(" search ");
		searchField.setFont(standardFont);
		searchField.setHorizontalAlignment(SwingConstants.CENTER);
		bottomPanel.add(searchField);
		
		bottomButtons = new Vector<JButton>(1,1);
		bottomButtons.add(new JButton("  SEARCH  "));
		bottomButtons.add(new JButton("  DELETE  "));
		
		for (int i = 0; i < bottomButtons.size(); i++){
			bottomButtons.get(i).setFont(standardFont);
			bottomButtons.get(i).setBackground(RED);
			bottomButtons.get(i).setForeground(WHITE);
			bottomButtons.get(i).addActionListener(new BottomListener());
		}
		bottomPanel.add(bottomButtons.get(0));
		
		idField = new JTextField("id");
		idField.setFont(standardFont);
		idField.setHorizontalAlignment(SwingConstants.CENTER);
		
		bottomPanel.add(idField);
		bottomPanel.add(bottomButtons.get(1));

		midPanel.add(bottomPanel);
		
		//	SET RIGHT PANEL
		rightPanel = new JPanel();
		rightPanel.setPreferredSize(new Dimension(RIGHT_PANEL_WIDTH, WINDOW_HEIGHT));
		rightPanel.setBackground(BACKGROUND_COLOR);
		mainPanel.add(rightPanel);
		
		insertLabel = new JLabel(" INSERT:");
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
		getIDButtons = new Vector<JButton>(1,1);
		updateButtons = new Vector<JButton>(1,1);
		getIDFields = new Vector<JTextField>(1,1);
		for (int i = 0; i < insertPanels.size(); i++){
			insertButtons.add(new JButton("INSERT"));
			insertButtons.get(i).setFont(standardFont);
			insertButtons.get(i).setBackground(RED);
			insertButtons.get(i).setForeground(WHITE);
			insertButtons.get(i).addActionListener(new InsertListener());
			
			getIDButtons.add(new JButton("GET DATA"));
			getIDButtons.get(i).setFont(standardFont);
			getIDButtons.get(i).setBackground(RED);
			getIDButtons.get(i).setForeground(WHITE);
			getIDButtons.get(i).addActionListener(new RightPanelListener());
			
			updateButtons.add(new JButton("UPDATE"));
			updateButtons.get(i).setFont(standardFont);
			updateButtons.get(i).setBackground(RED);
			updateButtons.get(i).setForeground(WHITE);
			updateButtons.get(i).addActionListener(new RightPanelListener());
			
			getIDFields.add(new JTextField("id"));
			getIDFields.get(i).setHorizontalAlignment(SwingConstants.CENTER);
			getIDFields.get(i).setFont(standardFont);
		}
		
		//	-> SET INSERT PANEL CONTENTS
		
		//	-> INSERT-TITLE PANEL
		activeTab = 0;
		titleLabels = new Vector<JLabel>(1,1);
		titleLabels.add(new JLabel(" Title"));
		titleLabels.add(new JLabel(" Type"));
		titleLabels.add(new JLabel(" Year"));
		titleLabels.add(new JLabel(" Minutes"));
		titleLabels.add(new JLabel(" Grade"));
		titleLabels.add(new JLabel(" Original"));
		
		titleFields = new Vector<JTextField>(1,1);
		for (int i = 0; i < titleLabels.size(); i++){
			titleFields.add(new JTextField(""));
			titleFields.get(i).setFont(standardFont);
			titleLabels.get(i).setFont(standardFont);
			titleLabels.get(i).setForeground(WHITE);
			insertPanels.get(activeTab).add(titleLabels.get(i));
			insertPanels.get(activeTab).add(titleFields.get(i));
		}
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(insertButtons.get(activeTab));
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(getIDFields.get(activeTab));
		insertPanels.get(activeTab).add(getIDButtons.get(activeTab));
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(updateButtons.get(activeTab));
		
		//	-> INSERT-GENRE PANEL
		
		//	-> INSERT-ACTOR PANEL
		activeTab = 2;
		actorLabels = new Vector<JLabel>(1,1);
		actorLabels.add(new JLabel(" First Name"));
		actorLabels.add(new JLabel(" Last Name"));
		actorLabels.add(new JLabel(" Sex"));
		actorLabels.add(new JLabel(" Year"));
		
		actorFields = new Vector<JTextField>(1,1);
		for (int i = 0; i < actorLabels.size(); i++){
			actorFields.add(new JTextField(""));
			actorFields.get(i).setFont(standardFont);
			actorLabels.get(i).setFont(standardFont);
			actorLabels.get(i).setForeground(WHITE);
			insertPanels.get(activeTab).add(actorLabels.get(i));
			insertPanels.get(activeTab).add(actorFields.get(i));
		}
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(insertButtons.get(activeTab));
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(getIDFields.get(activeTab));
		insertPanels.get(activeTab).add(getIDButtons.get(activeTab));
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(updateButtons.get(activeTab));
		
		//	-> INSERT-WRITER PANEL
		activeTab = 3;
		writerLabels = new Vector<JLabel>(1,1);
		writerLabels.add(new JLabel(" First Name"));
		writerLabels.add(new JLabel(" Last Name"));
		writerLabels.add(new JLabel(" Year"));
		
		writerFields = new Vector<JTextField>(1,1);
		
		for (int i = 0; i < writerLabels.size(); i++){
			writerFields.add(new JTextField(""));
			writerFields.get(i).setFont(standardFont);
			writerLabels.get(i).setFont(standardFont);
			writerLabels.get(i).setForeground(WHITE);
			insertPanels.get(activeTab).add(writerLabels.get(i));
			insertPanels.get(activeTab).add(writerFields.get(i));
		}
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(insertButtons.get(activeTab));
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(getIDFields.get(activeTab));
		insertPanels.get(activeTab).add(getIDButtons.get(activeTab));
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(updateButtons.get(activeTab));
		
		//	-> INSERT-DIRECTOR PANEL
		activeTab = 4;
		directorLabels = new Vector<JLabel>(1,1);
		directorLabels.add(new JLabel(" First Name"));
		directorLabels.add(new JLabel(" Last Name"));
		directorLabels.add(new JLabel(" Year"));
		
		directorFields = new Vector<JTextField>(1,1);
		
		for (int i = 0; i < directorLabels.size(); i++){
			directorFields.add(new JTextField(""));
			directorFields.get(i).setFont(standardFont);
			directorLabels.get(i).setFont(standardFont);
			directorLabels.get(i).setForeground(WHITE);
			insertPanels.get(activeTab).add(directorLabels.get(i));
			insertPanels.get(activeTab).add(directorFields.get(i));
		}
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(insertButtons.get(activeTab));
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(getIDFields.get(activeTab));
		insertPanels.get(activeTab).add(getIDButtons.get(activeTab));
		insertPanels.get(activeTab).add(new JLabel(" "));
		insertPanels.get(activeTab).add(updateButtons.get(activeTab));

		//	-> INSERT ALL INSERT PANELS
		for (int i = 0; i < insertPanels.size(); i++){
			rightPanel.add(insertPanels.get(i));
			insertPanels.get(i).setVisible(false);
		}
		
		//	SET TITLE PANEL ACTIVE
		activeTab = 0;
		listPanel.add(scrollPanes.get(activeTab));
		insertPanels.get(activeTab).setVisible(true);
		tabButtons.get(activeTab).setForeground(WHITE);
		
		//	SET VISIBLE
		setVisible(true);
	}
	
	private void updateTables(){
		
		//	PREPARE TABLE COLUMNS
		String[] titleColumnNames = {"ID","Title", "Type", "Year", "Length", "Rating", "Netflix Original"};
		String[] genreColumnNames = {"ID","Genre"};
		String[] actorColumnNames = {"ID","First Name", "Last Name", "Sex", "Year"};
		String[] writerColumnNames = {"ID","First Name", "Last Name", "Year"};
		String[] directorColumnNames = {"ID","First Name", "Last Name", "Year"};
		String[] genreConnectionColumnNames = {"Genre", "Title"};
		String[] actorRoleColumnNames = {"First Name", "Last Name", "Role", "Title"};
		String[] writerRoleColumnNames = {"First Name", "Last Name", "Title"};
		String[] directorRoleColumnNames = {"First Name", "Last Name", "Title"};
		
		//	SET ALL SCROLL PANES
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
		
		//	ADJUST TITLE COLUMN WITHS
		currentTable = (JTable)scrollPanes.get(0).getViewport().getView();
		currentTable.getColumnModel().getColumn(0).setPreferredWidth(20);
		currentTable.getColumnModel().getColumn(1).setPreferredWidth(200);
		
		currentTable = (JTable)scrollPanes.get(1).getViewport().getView();
		currentTable.getColumnModel().getColumn(0).setPreferredWidth(20);
		
		currentTable = (JTable)scrollPanes.get(2).getViewport().getView();
		currentTable.getColumnModel().getColumn(0).setPreferredWidth(20);
		
		currentTable = (JTable)scrollPanes.get(3).getViewport().getView();
		currentTable.getColumnModel().getColumn(0).setPreferredWidth(20);
		
		currentTable = (JTable)scrollPanes.get(4).getViewport().getView();
		currentTable.getColumnModel().getColumn(0).setPreferredWidth(20);
		
		currentTable = (JTable)scrollPanes.get(6).getViewport().getView();
		currentTable.getColumnModel().getColumn(3).setPreferredWidth(150);
		
		for (int i = 0; i < scrollPanes.size(); i++){
			currentTable = (JTable)scrollPanes.get(i).getViewport().getView();
			currentTable.setAutoCreateRowSorter(true);
		}
		
		//	RESET LIST PANEL
		listPanel.removeAll();
		listPanel.add(scrollPanes.get(activeTab));
		listPanel.validate();
	}
	
	class TabListener implements ActionListener{
		
		public void actionPerformed(ActionEvent e){
			
			for (int i = 0; i < tabButtons.size(); i++){
				tabButtons.get(i).setForeground(GREY);
			}
			((JButton)(e.getSource())).setForeground(WHITE);
			
			//	CLEAR MID AND RIGHT PANELS
			listPanel.removeAll();
			for (int i = 0; i < insertPanels.size(); i++){
				insertPanels.get(i).setVisible(false);
			}
			
			switch (((JButton)(e.getSource())).getText())
			{
				case "Titles":
					activeTab = 0;
					insertPanels.get(activeTab).setVisible(true);
					break;
				case "Genres":
					activeTab = 1;
					break;
				case "Actors":
					activeTab = 2;
					insertPanels.get(activeTab).setVisible(true);
					break;
				case "Writers":
					activeTab = 3;
					insertPanels.get(activeTab).setVisible(true);
					break;
				case "Directors":
					activeTab = 4;
					insertPanels.get(activeTab).setVisible(true);
					break;
				case "GenreConns":
					activeTab = 5;
					break;
				case "ActorRoles":
					activeTab = 6;
					break;
				case "WriterRoles":
					activeTab = 7;
					break;
				case "DirectorRoles":
					activeTab = 8;
					break;
				default:
					break;
			}
			updateTables();
			listPanel.validate();
			rightPanel.validate();
		}
	}
	
	class InsertListener implements ActionListener{
		public void actionPerformed(ActionEvent e){
			
			ItemComponent insertItem = new ItemGroup("Insert", 0);
			
			boolean notEmpty = true;
			
			switch (activeTab)
			{
				case 0:
					for (int i = 0; i < titleFields.size(); i++){
						if (titleFields.get(i).getText().equals("")){
							notEmpty = false;
						}
					}
					if (notEmpty){
						insertItem.add(new Item(
								1,
								0,
								titleFields.get(0).getText(),
								titleFields.get(1).getText(),
								Integer.parseInt(titleFields.get(2).getText()),
								Integer.parseInt(titleFields.get(3).getText()),
								Float.parseFloat(titleFields.get(4).getText()),
								Integer.parseInt(titleFields.get(5).getText())));
						for (int i = 0; i < titleFields.size(); i++){
							titleFields.get(i).setText("");
						}
					}
					break;
					
				case 2:
					for (int i = 0; i < actorFields.size(); i++){
						if (actorFields.get(i).getText().equals("")){
							notEmpty = false;
						}
					}
					if (notEmpty){
						insertItem.add(new Item(
								2,
								0,
								actorFields.get(0).getText(),
								actorFields.get(1).getText(),
								actorFields.get(2).getText(),
								Integer.parseInt(actorFields.get(3).getText())));
						for (int i = 0; i < actorFields.size(); i++){
							actorFields.get(i).setText("");
						}
					}
					break;
					
				case 3:
					for (int i = 0; i < writerFields.size(); i++){
						if (writerFields.get(i).getText().equals("")){
							notEmpty = false;
						}
					}
					if (notEmpty){
						insertItem.add(new Item(
								4,
								0,
								writerFields.get(0).getText(),
								writerFields.get(1).getText(),
								Integer.parseInt(writerFields.get(2).getText())));
						for (int i = 0; i < writerFields.size(); i++){
							writerFields.get(i).setText("");
						}
					}
					break;
					
				case 4:
					for (int i = 0; i < directorFields.size(); i++){
						if (directorFields.get(i).getText().equals("")){
							notEmpty = false;
						}
					}
					if (notEmpty){
						insertItem.add(new Item(
								3,
								0,
								directorFields.get(0).getText(),
								directorFields.get(1).getText(),
								Integer.parseInt(directorFields.get(2).getText())));
						for (int i = 0; i < directorFields.size(); i++){
							directorFields.get(i).setText("");
						}
					}
					break;
					
				default:
					break;
			}
			if (notEmpty){
				try {
					itemManager.insertItem(insertItem.getComponent(0));
					updateTables();
					
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			}
			insertItem.clear();
		}
	}
	
	class BottomListener implements ActionListener{
		public void actionPerformed(ActionEvent e){
			
			switch (bottomButtons.indexOf((JButton)(e.getSource()))){
			
			case 0:
				itemManager.searchTables(searchField.getText());
				searchPane = new JScrollPane(new JTable(itemManager.getTable("search"), new String[]{"","",""}));
				listPanel.removeAll();
				listPanel.add(searchPane);
				listPanel.validate();
				break;
			case 1:
				try {
					itemManager.removeItem(
							itemManager.getItemComponent((Integer.parseInt(idField.getText())-1), activeTab)
					);
				} catch (NumberFormatException e1) {
					e1.printStackTrace();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				updateTables();
				break;
			default:
				break;
			}
		}
	}
	
	class RightPanelListener implements ActionListener{
		public void actionPerformed(ActionEvent e){
			
			ItemComponent item;
			int id = Integer.parseInt(getIDFields.get(activeTab).getText()) - 1;
			switch (((JButton)(e.getSource())).getText()){
			
				case "GET DATA":
					
					item = itemManager.getItemComponent(id, activeTab);
					switch (activeTab)
					{
						case 0:
							titleFields.get(0).setText(item.getTitleName());
							titleFields.get(1).setText(item.getTitleType());
							titleFields.get(2).setText("" + item.getReleaseYear());
							titleFields.get(3).setText("" + item.getRunTime());
							titleFields.get(4).setText("" + item.getGrade());
							titleFields.get(5).setText("" + item.getOriginal());
							break;
							
						case 2:
							actorFields.get(0).setText(item.getFirstName());
							actorFields.get(1).setText(item.getLastName());
							actorFields.get(2).setText(item.getSex());
							actorFields.get(3).setText("" + item.getBirthYear());
							break;
							
						case 3:
							writerFields.get(0).setText(item.getFirstName());
							writerFields.get(1).setText(item.getLastName());
							writerFields.get(2).setText("" + item.getBirthYear());
							break;
							
						case 4:
							directorFields.get(0).setText(item.getFirstName());
							directorFields.get(1).setText(item.getLastName());
							directorFields.get(2).setText("" + item.getBirthYear());
							break;
							
						default:
							break;
					}
					break;
				case "UPDATE":
					item = itemManager.getItemComponent(id, activeTab);
					switch (activeTab)
					{
						case 0:
							item.setTitleName(titleFields.get(0).getText());
							item.setTitleType(titleFields.get(1).getText());
							item.setReleaseYear(Integer.parseInt(titleFields.get(2).getText()));
							item.setRunTime(Integer.parseInt(titleFields.get(3).getText()));
							item.setGrade(Integer.parseInt(titleFields.get(4).getText()));
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
					itemManager.updateItem(item);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				updateTables();
					break;
				default:
					break;
				}
			
		}
	}
}