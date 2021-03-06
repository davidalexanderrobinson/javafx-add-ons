package fr.xmichel.javafx.fileselector;

import java.util.EventListener;

import fr.xmichel.javafx.fileselector.FileChangedEventObject;

/**
 * The goal of this interface is to notify other class when selection has change in FileSelector (and derivated)
 */
public interface FileChangedListener extends EventListener {
	
	/**
	 * File selection changed
	 * 
	 * @param e
	 * 			Contains true if new file is valid, false otherwise
	 */
	public void newFileSelected(FileChangedEventObject e);
}
