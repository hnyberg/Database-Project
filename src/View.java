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
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

public class View  extends JFrame{

	//	DIMENSION CONTSTANTS
	private final int BIG_FONT_SIZE = 18;
	private final int TITLE_FONT_SIZE = 45;
	private final int PANEL_HEIGHT = 450;
	private final int LIST_WIDTH = 650;
	private final int TAB_SIDE_PANEL_WIDTH = 150;
	private final int FILTER_SIDE_PANEL_WIDTH = 200;
	private final int WINDOW_HEIGHT = 576;
	private final int WINDOW_WIDTH = 1024;
	private final int LABEL_WIDTH = TAB_SIDE_PANEL_WIDTH - 10;
	private final int LABEL_HEIGHT = 40;
	private final int BUTTON_WIDTH = LABEL_WIDTH;
	private final int BUTTON_HEIGHT = 30;
	
	private final Dimension LABEL_DIMENSION = new Dimension(LABEL_WIDTH, LABEL_HEIGHT);
	private final Dimension BUTTON_DIMENSION = new Dimension(BUTTON_WIDTH, BUTTON_HEIGHT);
	
	//	VARIABLE FIELDS
	private Vector<String> filterStrings;
	private Vector<String> tabStrings;
	
	//	OBJECT FIELDS
	private Font standardFont;
	private Font titleFont;
	
	private GridBagConstraints constraints;
	
	private ItemManager itemManager;
	
	private JLabel filterLabel;
	private JLabel listLabel;
	private JLabel mainLabel;
	private JLabel tabLabel;
	
	private JPanel filterPanel;
	private JPanel listPanel;
	private JPanel mainPanel;
	private JPanel midPanel;
	private JPanel tabPanel;
	private JPanel titlePanel;
	private JPanel topPanel;
	
	private JTable actorTable;
	private JTable directorTable;
	private JTable genreTable;
	private JTable titleTable;
	private JTable writerTable;
	
	private Object[][] titles;
	private Object[][] genres;
	private Object[][] actors;
	private Object[][] writers;
	private Object[][] directors;
	
	private Vector<JButton> tabButtons;
	private Vector<JCheckBox> filterButtons;
	
	//	COLOR CONSTANTS
	private final Color BACKGROUND_COLOR = new Color(0.2f,0.2f,0.2f);
	private final Color RED = new Color(0.7f,0.3f,0.3f);
	private final Color GREEN = new Color(0.2f,0.6f,0.2f);
	private final Color BLUE = new Color(0.2f,0.2f,0.6f);
	private final Color CYAN = new Color(0.2f,0.6f,0.6f);
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
		
		//	CREATE MANAGERS
		itemManager = new ItemManager();
		
		//	CREATE FONTS
		standardFont = new Font(Font.MONOSPACED, Font.BOLD, BIG_FONT_SIZE);
		titleFont = new Font(Font.MONOSPACED, Font.BOLD, TITLE_FONT_SIZE);
		
		filterStrings = new Vector<String>(1,1);
		filterStrings.add("Drama");
		filterStrings.add("Comedy");
		filterStrings.add("Military & War");
		
		//	SET MAIN PANEL
		mainPanel = new JPanel();
		mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.Y_AXIS));
		add(mainPanel);
		
		//	SET TITLE PANEL
		titlePanel = new JPanel();
		titlePanel.setLayout(new GridBagLayout());
		titlePanel.setBackground(BACKGROUND_COLOR);
		mainPanel.add(titlePanel);
		
		mainLabel = new JLabel("Netflix");
		mainLabel.setFont(titleFont);
		mainLabel.setForeground(RED);
		titlePanel.add(mainLabel);
		
		//	SET MID PANEL
		midPanel = new JPanel();
		midPanel.setLayout(new GridBagLayout());
		midPanel.setBackground(BACKGROUND_COLOR);
		mainPanel.add(midPanel);
		constraints = new GridBagConstraints();
		
		//	SET TAB PANEL
		tabPanel = new JPanel();
		tabPanel.setLayout(new BoxLayout(tabPanel, BoxLayout.Y_AXIS));
		constraints.gridx = 0;
		constraints.weightx = 0.1;
		tabPanel.setPreferredSize(new Dimension(TAB_SIDE_PANEL_WIDTH, PANEL_HEIGHT));
		tabPanel.setBackground(BACKGROUND_COLOR);
		midPanel.add(tabPanel, constraints);
		
		//	SET TAB PANEL CONTENTS
		tabLabel = new JLabel(" TABLES:");
		tabLabel.setFont(standardFont);
		tabLabel.setPreferredSize(new Dimension(LABEL_DIMENSION));
		tabLabel.setForeground(WHITE);
		tabPanel.add(tabLabel);
		tabPanel.add(new JLabel(" "));
		
		tabStrings = new Vector<String>(1,1);
		tabButtons = new Vector<JButton>(1,1);
		
		tabStrings.add("Titles");
		tabStrings.add("Genres");
		tabStrings.add("Actors");
		tabStrings.add("Writers");
		tabStrings.add("Directors");
		
		for (int i = 0; i < tabStrings.size(); i++){
			tabButtons.add(new JButton(tabStrings.get(i)));
			tabButtons.get(i).setFont(standardFont);
			tabButtons.get(i).setBackground(BACKGROUND_COLOR);
			tabButtons.get(i).setForeground(GREY);
			tabButtons.get(i).addActionListener(new TabListener());
			tabPanel.add(tabButtons.get(i));
			tabPanel.add(new JLabel(" "));
		}
		
		//	SET LIST PANEL
		listPanel = new JPanel();
		listPanel.setLayout(new BoxLayout(listPanel, BoxLayout.Y_AXIS));
		constraints.gridx = 1;
		listPanel.setPreferredSize(new Dimension(LIST_WIDTH, PANEL_HEIGHT));
		listPanel.setBackground(GREEN);
		midPanel.add(listPanel, constraints);
		
		//	SET LIST PANEL CONTENTS
		String[] listColumnNames = {
				"Title",
				"Type",
				"Year",
				"Length",
				"Rating",
				"Netflix Original"
		};
		
		Object[][] titles = {
				{"House Of Cards","Series",2013,50,5,1},
				{"Horrible Bosses 2","Movie",2014,108,1.5,0},
				{"The Men Who Stare At Goats","Movie",2009,94,1,0},
				{"This Is Where I Leave You","Movie",2014,103,3,0},
				{"Arrested Development","Series",2013,22,4,1},
				{"Orange Is The New Black","Series",2003,59,5,1},
				{"Unbreakable Kimmy Schmidt","Series",2015,30,4.5,1}
		}; 
		
		titleTable = new JTable(itemManager.getTable(), listColumnNames);
		titleTable.getColumnModel().getColumn(0).setPreferredWidth(150);
		titleTable.setAutoCreateRowSorter(true);
		TableRowSorter<TableModel> sorter = new TableRowSorter<TableModel>(titleTable.getModel());
		titleTable.setRowSorter(sorter);
		ItemManager itemManager = new ItemManager();
		
		ItemComponent itemChanged = new ItemGroup("test", 4);
		
		itemChanged.add(itemManager.getItemTest());
		
		System.out.println(itemChanged.displayInfo());
		
		//itemChanged.getComponent(0).setName("Detta test");
		
		try {
			System.out.println(itemManager.insertItem(itemChanged.getComponent(0)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		titleTable = new JTable(itemManager.getTable("titles"), listColumnNames);
		
		JScrollPane scrollPane = new JScrollPane(titleTable);
		
		listPanel.add(scrollPane);
		
		
		//	SET FILTER PANEL
		filterPanel = new JPanel();
		filterPanel.setLayout(new BoxLayout(filterPanel, BoxLayout.Y_AXIS));
		constraints.gridx = 2;
		filterPanel.setPreferredSize(new Dimension(FILTER_SIDE_PANEL_WIDTH, PANEL_HEIGHT));
		filterPanel.setBackground(BACKGROUND_COLOR);
		midPanel.add(filterPanel, constraints);
		
		//	SET FILTER PANEL CONTENTS
		
		filterLabel = new JLabel(" FILTERS:");
		filterLabel.setFont(standardFont);
		filterLabel.setForeground(WHITE);
		filterPanel.add(filterLabel);
		filterPanel.add(new JLabel(" "));
		
		filterStrings = new Vector<String>(1,1);
		filterButtons = new Vector<JCheckBox>(1,1);
		
		filterStrings.add(" Filter 1");
		filterStrings.add(" Filter 2");
		filterStrings.add(" Filter 3");
		filterStrings.add(" Filter 4");
		
		for (int i = 0; i < filterStrings.size(); i++){
			filterButtons.add(new JCheckBox(filterStrings.get(i)));
			filterButtons.get(i).setSelected(true);
			filterButtons.get(i).setFont(standardFont);
			filterButtons.get(i).setBackground(BACKGROUND_COLOR);
			filterButtons.get(i).setForeground(WHITE);
			filterButtons.get(i).addActionListener(new FilterListener());
			filterPanel.add(filterButtons.get(i));
		}
		
		//	SET VISIBLE
		setVisible(true);
			
	}
	
	class TabListener implements ActionListener{
		
		public void actionPerformed(ActionEvent e){
			
			for (int i = 0; i < tabButtons.size(); i++){
				tabButtons.get(i).setForeground(GREY);
			}
			((JButton)(e.getSource())).setForeground(WHITE);
		}
	}
	
	class FilterListener implements ActionListener{
		public void actionPerformed(ActionEvent e){	
		}
	}
}