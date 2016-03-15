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
			{"id", "firstName", "lastName", "year"}, {"id", "name"}, {"id", "titleID", "genreID" },
			{"id", "name", "titleID", "actorID"}, {"id", "titleID", "directorID"}, {"id", "titleID", "writerID"}};
	private String[] itemType = {"titles", "actors", "directors", "writers", "genre", 
			"genreconnections", "actorroles", "directorroles", "writerroles"};
	private static final String TITLES = "titles";
	private static final String ACTORS = "actors";
	private static final String DIRECTORS = "directors";
	private static final String WRITERS = "writers";
	private static final String GENRE = "genre";
	private static final String GENRE_CONNECTIONS = "genreconnections";
	private static final String ACTOR_ROLES = "actorroles";
	private static final String DIRECTOR_ROLES = "directorroles";
	private static final String WRITER_ROLES = "writerroles";
	private static final String SEARCH_TABLE = "search";
	
	private ItemComponent titles = new ItemGroup("Titles", 1);
	private ItemComponent actors = new ItemGroup("Actors", 2);
	private ItemComponent directors = new ItemGroup("Directors", 3);
	private ItemComponent writers = new ItemGroup("Writers", 4);
	private ItemComponent genre = new ItemGroup("Genre", 5);
	private ItemComponent genreConnections = new ItemGroup("Genre Connections", 6);
	private ItemComponent actorRole = new ItemGroup("Actor Roles", 7);
	private ItemComponent directorRole = new ItemGroup("Director Roles", 8);
	private ItemComponent writerRole = new ItemGroup("Writer Roles", 9);
	private ItemComponent searchTable = new ItemGroup("Search", 0);
	
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
	
	public Object[][] getTable(String table)
	{
		switch (table)
		{
			case TITLES:
				return titles.getTable();
			case ACTORS:
				return actors.getTable();
			case DIRECTORS:
				return directors.getTable();
			case WRITERS:
				return writers.getTable();
			case GENRE:
				return genre.getTable();
			case GENRE_CONNECTIONS:
				return genreConnections.getTable();
			case ACTOR_ROLES:
				return actorRole.getTable();
			case DIRECTOR_ROLES:
				return directorRole.getTable();
			case WRITER_ROLES:
				return writerRole.getTable();
			case SEARCH_TABLE:
				return searchTable.getTable();
			default:
				return null;
		}
	}
	
	public ItemComponent getItemComponent(int id, int tableIndex)
	{
		switch (tableIndex)
		{
			case 0:
				return titles.getComponent(id);
			case 1:
				return genre.getComponent(id);
			case 2:
				return actors.getComponent(id);
			case 3:
				return writers.getComponent(id);
			case 4:
				return directors.getComponent(id);
			default:
				return null;
		}
	}
	
	public void updateTable(String table)
	{
		
		String sql = "SELECT * FROM " + table;
		
		if(table == ACTOR_ROLES)
		{
			sql = "SELECT a.firstName, a.lastName, r.name, t.name AS title " +
					"FROM actorRoles r " +
					"JOIN actors a ON r.actorID = a.id " +
					"JOIN titles t ON r.titleID = t.id";
		}
		else if(table == DIRECTOR_ROLES)
		{
			sql = "SELECT d.firstName, d.lastName, t.name AS title " +
					"FROM directorRoles r " +
					"JOIN directors d ON r.directorID = d.id " +
					"JOIN titles t ON r.titleID = t.id";
		}
		else if(table == WRITER_ROLES )
		{
			sql = "SELECT w.firstName, w.lastName, t.name AS title " +
					"FROM writerRoles r " +
					"JOIN writers w ON r.writerID = w.id " +
					"JOIN titles t ON r.titleID = t.id";
		}
		else if(table == GENRE_CONNECTIONS )
		{
			sql = "SELECT t.name AS title, g.name " +
					"FROM genreconnections c " +
					"JOIN genre g ON c.genreID = g.id " +
					"JOIN titles t ON c.titleID = t.id";
		}
		
		clearTable(table);
		try (
				Connection conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
				Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				ResultSet rs = stmt.executeQuery(sql);
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
						genreConnections.add(new Item(6, rs.getString("title"), rs.getString("name")));
						break;
					case ACTOR_ROLES:
						actorRole.add(new Item(7, rs.getString("firstName"), rs.getString("lastName"),
								rs.getString("name"), rs.getString("title")));
						break;
					case DIRECTOR_ROLES:
						directorRole.add(new Item(8, rs.getString("firstName"), rs.getString("lastName"),
								rs.getString("title")));
						break;
					case WRITER_ROLES:
						writerRole.add(new Item(9, rs.getString("firstName"), rs.getString("lastName"),
								rs.getString("title")));
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
			case SEARCH_TABLE:
				searchTable.clear();
				break;
			default:
				break;
		}
	}
	
	public boolean insertItem(ItemComponent item) throws Exception
	{
		
		
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
			for(int i = 0; i < item.getItem().length; i++)
			{
				if(item.getItem()[i].getClass().equals(Integer.class))
				{
					stmt.setInt(i + 1, (int) item.getItem()[i]);
				}
				else if(item.getItem()[i].getClass().equals(String.class))
				{
					stmt.setString(i + 1, (String) item.getItem()[i]);
				}
				else if(item.getItem()[i].getClass().equals(Float.class))
				{
					stmt.setFloat(i + 1, (Float) item.getItem()[i]);
				}
				else if(item.getItem()[i].getClass().equals(Boolean.class))
				{
					stmt.setBoolean(i + 1, (Boolean) item.getItem()[i]);
				}
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
		updateTable(itemType[item.getItemType() - 1]);
		return true;
	}
	
	public boolean updateItem(ItemComponent item) throws Exception {
		
//		
//		String[] itemType = {"titles", "actors", "directors", "writers", "genre", 
//				"genreconnections", "actorroles", "directorroles", "writerroles"};
		
		String colum = "";
		for(int i = 1; i < colums[item.getItemType() - 1].length; i++)
		{
				
			colum += colums[item.getItemType() - 1][i];
			
			if(i != colums[item.getItemType() - 1].length - 1)
			{
				colum += " = ?, ";
			}
		}
		
		colum += " = ? WHERE id = ?";
		
		String sql =
				"UPDATE " + itemType[item.getItemType() - 1] + " SET " + colum;
		try (
				Connection conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(sql);
			)
		{
			
			for(int i = 0; i < item.getItem().length; i++)
			{
				if(item.getItem()[i].getClass().equals(Integer.class))
				{
					stmt.setInt(i + 1, (int) item.getItem()[i]);
				}
				else if(item.getItem()[i].getClass().equals(String.class))
				{
					stmt.setString(i + 1, (String) item.getItem()[i]);
				}
				else if(item.getItem()[i].getClass().equals(Float.class))
				{
					stmt.setFloat(i + 1, (Float) item.getItem()[i]);
				}
				else if(item.getItem()[i].getClass().equals(Boolean.class))
				{
					stmt.setBoolean(i + 1, (Boolean) item.getItem()[i]);
				}
			}
			
			stmt.setInt(item.getItem().length + 1, item.getID());
			
			int affected = stmt.executeUpdate();
			
			if (affected == 1) {
				updateTable(itemType[item.getItemType() - 1]);
				return true;
			} else {
				return false;
			}
			
		}
		catch(SQLException e) {
			System.err.println(e);
			return false;
		}

	}
	
	public boolean removeItem(ItemComponent item) throws Exception {

		String sql =
				"DELETE FROM " + itemType[item.getItemType() - 1] + " WHERE " +
						itemType[item.getItemType() - 1] + ".id = ?";
		try (
				Connection conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(sql);
			)
		{
			
			stmt.setInt(1, item.getID());
			
			int affected = stmt.executeUpdate();
			
			if (affected == 1) {
				updateTable(itemType[item.getItemType() - 1]);
				return true;
			} else {
				return false;
			}
			
		}
		catch(SQLException e) {
			System.err.println(e);
			return false;
		}

	}
	
	public void searchTables(String sWord)
	{
		
		String sql[] = {"SELECT titles.name, titles.type, titles.year FROM titles WHERE titles.name  LIKE '%"
					+ sWord + "%' OR titles.type LIKE '%" + sWord + "%' OR titles.year LIKE '%" + sWord + "%'",
					
					"SELECT actors.firstName, actors.lastName FROM actors WHERE actors.firstName" +
					" LIKE '%" + sWord + "%' OR actors.lastName LIKE '%" + sWord + "%'",
					
					"SELECT directors.firstName, directors.lastName FROM directors WHERE " + 
					"directors.firstName LIKE '%" + sWord + "%' OR directors.lastName LIKE '%" + sWord + "%'",
					
					"SELECT writers.firstName, writers.lastName FROM writers WHERE writers.firstName " +
					"LIKE '%" + sWord + "%' OR writers.lastName LIKE '%" + sWord + "%'",
					
					"SELECT genre.name, titles.name AS tname, titles.type FROM genreConnections g JOIN genre ON g.genreID" 
					+ " = genre.id JOIN titles ON g.titleID = titles.id WHERE genre.name LIKE '%" + sWord + "%'",
					
					"SELECT a.name, titles.name AS tname, actors.id FROM actorroles a JOIN actors ON a.actorID = actors.id" +
					" JOIN titles ON a.titleID = titles.id WHERE a.name LIKE '%" + sWord + "%'"
					};
		
		clearTable("search");
		for(int i = 0; i < sql.length; i++)
		{
			try (
					Connection conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
					Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					ResultSet rs = stmt.executeQuery(sql[i]);
				) 
			{	
				while(rs.next())
				{
					switch(i)
					{
						case 0:
							searchTable.add(new Item(0, rs.getString("name"), rs.getString("type"), rs.getString("year"), i));
							break;
						case 4:
							searchTable.add(new Item(0, rs.getString("name"), rs.getString("tname"), rs.getString("type"), i));
							break;
						case 5:
							searchTable.add(new Item(0, rs.getString("name"), rs.getString("tname"), 
									actors.getComponent(rs.getInt("id") - 1).getFirstName() + " " +
									actors.getComponent(rs.getInt("id") - 1).getLastName(), i));
							break;
						default:
							searchTable.add(new Item(0, rs.getString("firstName"), rs.getString("lastName"), " ", i));
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
