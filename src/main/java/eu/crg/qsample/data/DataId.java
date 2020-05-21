package eu.crg.qsample.data;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class DataId implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 17786L;

	@Column(nullable = false, updatable = false)
	private Long paramId;
	@Column(nullable = false, updatable = false)
	private Long contextSourceId;
	@Column(nullable = false, updatable = false)
	private Long fileId;

	public DataId() {
	}

	public DataId(Long paramId, Long contextSourceId, Long fileId) {
		this.paramId = paramId;
		this.contextSourceId = contextSourceId;
		this.fileId = fileId;
	}
}