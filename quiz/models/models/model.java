package models;

import database.DBConnector;

/**
 * 
 * @author rickardbruelgabrielsson
 * Interface for model whose class represents a table in the
 * database, and whose instance represents a column in the same table
 * 
 * Returns true if successful, and false if error
 */
public interface model {
	
	/**
	 * Saves the model and its information to the database
	 */
	public boolean save();
	/**
	 * Fetches the models information from the database
	 */
	public boolean fetch();
	/**
	 * Saves the current information of the model to the database
	 * (Different from save, since update will not require all information to have been updated,
	 * it also allows us to do some future customization )
	 */
	public boolean update();
	/**
	 * Destroys the model and all its information from the database
	 */
	public boolean destroy();
	
}
