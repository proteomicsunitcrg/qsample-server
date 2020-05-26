package eu.crg.qsample.exceptions;

import org.springframework.dao.DataRetrievalFailureException;

public class NotFoundException extends DataRetrievalFailureException {

	private static final long serialVersionUID = 3097960217821115508L;

	public NotFoundException(String msg) {
		super(msg);
		// TODO Auto-generated constructor stub
	}

}
