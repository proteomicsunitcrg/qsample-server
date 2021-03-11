package eu.crg.qsample.exceptions;

import org.springframework.dao.DataRetrievalFailureException;

public class ConsensusException extends DataRetrievalFailureException {

	private static final long serialVersionUID = 3097960217821111508L;

	public ConsensusException(String msg) {
		super(msg);
		// TODO Auto-generated constructor stub
	}

}
