package common;

import java.awt.image.BufferedImage;

public class Constants
{
	/**
	 * 데이터베이스 접속 jdbc driver
	 */
	public static final String JDBC_DRIVER = "org.h2.Driver";
	/**
	 * 데이터베이스 접속 URL
	 */
	public static final String DB_URL = "jdbc:h2:mem:test";

	/**
	 * 데이터베이스 접속 유저
	 */
	public static final String DB_USER = "sa";

	/**
	 * 데이터베이스 접속 암호
	 */
	public static final String DB_PASSWORD = "sa";

	/**
	 * Contains an empty image.
	 */
	public static BufferedImage EMPTY_IMAGE;

	/**
	 * Initializes the empty image.
	 */
	static
	{
		try
		{
			EMPTY_IMAGE = new BufferedImage(1, 1, BufferedImage.TYPE_INT_RGB);
		}
		catch (Exception e)
		{
			// ignore
		}
	}

	/**
	 * Maximum size (in bytes) for request payloads. Default is 10485760 (10MB).
	 */
	public static final int MAX_REQUEST_SIZE = 10485760;

	/**
	 * Maximum area for exports. Default is 10000x10000px.
	 */
	public static final int MAX_AREA = 10000 * 10000;

}
