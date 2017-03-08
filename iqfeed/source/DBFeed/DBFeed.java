package DBFeed;

//-----------------------------------------------------------
//-----------------------------------------------------------
//
//           System: IQFeed
//     Filename: Level1Socket.java
//
//-----------------------------------------------------------
//
//          Proprietary Software Product
//
//         Data Transmission Network Inc.
//         9110 West Dodge Road Suite 200
//             Omaha, Nebraska  68114
//
//  Copyright (c) by Data Transmission Network 2008
//               All Rights Reserved
//
//
//-----------------------------------------------------------
//Module Description: Standard application source file
//       References: None
//         IDE: Netbeans 7.4
//           Author: Tim Walter
//      Modified By: 
//
//-----------------------------------------------------------
//Website for API information: http://www.iqfeed.net/dev/
//-----------------------------------------------------------
/******************************************************************************
* DISCLAIMER:  These apps are designed with simplicity in mind and are not 
* designed for copy and paste development.  You will need to consider 
* performance enhancements based upon your own needs and implement your
* solution accordingly. They are a guide to get people started, nothing more.
******************************************************************************/

import java.io.*;
import javax.swing.*;

import java.awt.event.*;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import common.*;

public class DBFeed extends Object
{
  //Define variables for use throughout the code
  private int IQFEED_LEVEL1_PORT_DEFAULT = 5009;      //Defaults to 5009, adjustable in the registy.
	//IQFeed_Socket is defined in the common folder, effectively it is a socket with a buffered reader and writer added.
  //IQFeed_Socket C_Level1IQFeed_Socket;

  /**
   * Creates new form Level1_Example_Frame
   */
  public DBFeed() 
  {
  }
  
  public static void getFeeds() {
	  Connection c=FeedDB.getConnection();
	  Statement statement = null;

		String selectTableSQL = "SELECT sym, exch FROM feed_instrument LIMIT 10";
		
		try {
			statement = c.createStatement();

			System.out.println(selectTableSQL);

			// execute select SQL stetement
			ResultSet rs = statement.executeQuery(selectTableSQL);

			while (rs.next()) {

				String userid = rs.getString("sym");
				String username = rs.getString("exch");

				System.out.println("userid : " + userid);
				System.out.println("username : " + username);

			}

		} catch (SQLException e) {

			System.out.println(e.getMessage());

		} finally {

			if (statement != null) {
				//statement.close();
			}

			if (c != null) {
				//c.close();
			}

		}
  }
  
  
  public static void main(String args[]) 
  {
      /* Set the Nimbus look and feel */
      //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
      /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
       * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
       */
      getFeeds();
      
  }
  //Class to execute and listen to replies from the server.
  //I am displaying the data returned in this function for simplicity to the text Window.
  //Considerations for performance will be needed as this will not work for most normal usage.
  class Level1_Listener extends Thread
  {
  //-----------------------------------------------------------
  // void run()
  /**
  */
  //  Notes:  Check for data on the socket, process it if it exists by displaying
  //          to the text window.
  //
  //-----------------------------------------------------------
          public void run()
          {
                 
          }
  }
  
}

