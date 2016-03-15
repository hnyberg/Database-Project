import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ItemManager 
{
	private static final String USERNAME = "netflix";
	private static final String PASSWORD = "netflix";
	private static final String CONN_STRING = "jdbc:mysql://localhost/netflix";
	
	private Object[][] colums = {{"id", "name", "type", "year", "minutes", "grade", "original" },
			{"id", "firstName", "lastName", "sex", "year"}, {"id", "firstName", "lastName", "year"}, 
			{"id", "name"}, {"id", "name", "titleID", "actorID"}};
	private static final String TITLES = "titles";
	private static final String ACTORS = "actors";
	private static final String DIRECTORS = "directors";
	private static final String WRITERS = "writers";
	private static final String GENRE = "genre";
	private static final String GENRE_CONNECTIONS = "genreconnections";
	private static final String ACTOR_ROLES = "actorroles";
	private static final String DIRECTOR_ROLES = "directorroles";
	private static final String WRITER_ROLES = "writerroles";
	
	private ItemComponent titles = new ItemGroup("Titles", 1);
	private ItemComponent actors = new ItemGroup("Actors", 2);
	private ItemComponent directors = new ItemGroup("Directors", 3);
	private ItemComponent writers = new ItemGroup("Writers", 4);
	private ItemComponent genre = new ItemGroup("Genre", 5);
	private ItemComponent genreConnections = new ItemGroup("Genre Connections", 6);
	private ItemComponent actorRole = new ItemGroup("Actor Roles", 7);
	private ItemComponent directorRole = new ItemGroup("Director Roles", 8);
	private ItemComponent writerRole = new ItemGroup("Writer Roles", 9);
	
	public ItemManager()
	{
		updateTable("titles");
		updateTable("actors");
		updateTable("directors");
		updateTable("writers");
		updateTable("genre");
		updateTable("genreconnections");
		updateTable("actorroles");
		updateTable("directorroles");
		updateTable("writerroles");

	}
	
	public ItemComponent getItemTest()
	{
		return titles.getComponent(0);
	}
	
	public Object[][] getTable()
	{
		return titles.getTable();
	}
	
	public void updateTable(String table)
	{
		
		System.out.println();
		clearTable(table);
		try (
				Connection conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
				Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				ResultSet rs = stmt.executeQuery("SELECT * FROM " + table);
			) 
		{	
			while(rs.next())
			{
				switch (table)
				{
					case TITLES:
						titles.add(new Item(1, rs.getInt("id"), rs.getString("name"), rs.getString("type"),
								rs.getInt("year"), rs.getInt("minutes"), rs.getFloat("grade"), rs.getInt("original")));
						break;
					case ACTORS:
						actors.add(new Item(2, rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"),
								rs.getString("sex"), rs.getInt("year")));
						break;
					case DIRECTORS:
						directors.add(new Item(3, rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"),
								rs.getInt("year")));
						break;
					case WRITERS:
						writers.add(new Item(4, rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"),
								rs.getInt("year")));
						break;
					case GENRE:
						genre.add(new Item(5, rs.getInt("id"), rs.getString("name")));
						break;
					case GENRE_CONNECTIONS:
						genreConnections.add(new Item(6, rs.getInt("id"), rs.getInt("titleID"), rs.getInt("genreID")));
						break;
					case ACTOR_ROLES:
						actorRole.add(new Item(7, rs.getInt("id"), rs.getString("name"), rs.getInt("titleID"), rs.getInt("actorID")));
						break;
					case DIRECTOR_ROLES:
						directorRole.add(new Item(8, rs.getInt("id"), rs.getInt("titleID"), rs.getInt("directorID")));
						break;
					case WRITER_ROLES:
						writerRole.add(new Item(9, rs.getInt("id"), rs.getInt("titleID"), rs.getInt("writerID")));
						break;
					default:
						break;
				}
			}
		}
		catch (SQLException e) 
		{
			System.err.println("Error message: " + e.getMessage());
			System.err.println("Error code: " + e.getErrorCode());
			System.err.println("SQL state: " + e.getSQLState());
		}
	}
	
	public void clearTable(String table)
	{
		switch (table)
		{
			case TITLES:
				titles.clear();
				break;
			case ACTORS:
				actors.clear();
				break;
			case DIRECTORS:
				directors.clear();
				break;
			case WRITERS:
				writers.clear();
				break;
			case GENRE:
				genre.clear();
				break;
			case GENRE_CONNECTIONS:
				genreConnections.clear();
				break;
			case ACTOR_ROLES:
				actorRole.clear();
				break;
			case DIRECTOR_ROLES:
				directorRole.clear();
				break;
			case WRITER_ROLES:
				writerRole.clear();
				break;
			default:
				break;
		}
	}
	
	public boolean insertItem(ItemComponent item) throws Exception
	{
		String[] itemType = {"titles", "actors", "directors", "writers", "genre", 
				"genreconnections", "actorroles", "directorroles", "writerroles"};
		
		String colum = "";
		String values = "NULL";
		for(int i = 0; i < colums[item.getItemType() - 1].length; i++)
		{
			if(i != 0)
				values += "?";
				
			colum += colums[item.getItemType() - 1][i];
			
			if(i != colums[item.getItemType() - 1].length - 1)
			{
				colum += ", ";
				values += ", ";
			}
		}
		System.out.println(colum + "\n" + values);
		
		String sql = "INSERT INTO " + itemType[item.getItemType() - 1] + "(" + colum  + ") " +
				"VALUES (" + values + ")";
		
				ResultSet keys = null;
		try (
				Connection conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				
			) 
		{	
			switch (item.getItemType())
			{
				case 1:
					stmt.setString(1, item.getName());
					stmt.setString(2, item.getTitleType());
					stmt.setInt(3, item.getReleaseYear());
					stmt.setInt(4, item.getRunTime());
					stmt.setFloat(5, item.getGrade());
					stmt.setInt(6, item.getOriginal());
//					return "" + id + " " + name + " " + titleType + " " + releaseYear
//							+ " " + runTime + " " + grade + " " + original;
					break;
				case 2:
					stmt.setString(1, item.getFirstName());
					stmt.setString(2, item.getLastName());
					stmt.setString(3, item.getSex());
					stmt.setInt(4, item.getBirthYear());
//					return "" + id + " " + firstName + " " + lastName + " " + sex + " " + birthYear;
					break;
				case 3:
					stmt.setString(1, item.getFirstName());
					stmt.setString(2, item.getLastName());
					stmt.setInt(3, item.getBirthYear());
//					return "" + id + " " + firstName + " " + lastName + " " + birthYear;
					break;
				case 4:
					stmt.setString(1, item.getFirstName());
					stmt.setString(2, item.getLastName());
					stmt.setInt(3, item.getBirthYear());
//					return "" + id + " " + firstName + " " + lastName + " " + birthYear;
					break;
				case 5:
					stmt.setString(1, item.getName());
//					return "" + id + " " + name;
					break;
				case 6:
					stmt.setInt(1, item.getConnectionID1());
					stmt.setInt(2, item.getConnectionID2());
//					return "" + id + " " + connectionID1 + " " + connectionID2;
					break;
				case 7:
					stmt.setInt(1, item.getConnectionID1());
					stmt.setInt(2, item.getConnectionID2());
//					return "" + id + " " + connectionID1 + " " + connectionID2;
					break;
				case 8:
					stmt.setInt(1, item.getConnectionID1());
					stmt.setInt(2, item.getConnectionID2());
					//return "" + id + " " + connectionID1 + " " + connectionID2;
					break;
				case 9:
					stmt.setString(1, item.getName());
					stmt.setInt(2, item.getConnectionID1());
					stmt.setInt(3, item.getConnectionID2());
					//return "" + id + " " + name + " " + connectionID1 + " " + connectionID2;
					break;
				default:
					break;
			}
			
			int affected = stmt.executeUpdate();
			
			if (affected == 1) {
				System.out.println("Character added!");
			} 
			else {
				System.err.println("No rows affected");
				return false;
			}
		}
		catch (SQLException e) 
		{
			System.err.println(e);
			return false;
		} finally
		{
			if (keys != null) keys.close();
		}
		return true;
	}
	
	public void displayTableInfo()
	{
		titles.displayInfo();
		actors.displayInfo();
		writers.displayInfo();
		directors.displayInfo();
		genre.displayInfo();
		genreConnections.displayInfo();
		actorRole.displayInfo();
		directorRole.displayInfo();
		writerRole.displayInfo();
	}
}
