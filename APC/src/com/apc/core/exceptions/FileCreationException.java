package com.apc.core.exceptions;

/**
 * @author Suresh Kumar Mutukula
 *
 */
@SuppressWarnings("serial")
public class FileCreationException extends Throwable {

	public FileCreationException(String message){
		super("Exception occured while creating "+message);
		super.printStackTrace();
	}
}
