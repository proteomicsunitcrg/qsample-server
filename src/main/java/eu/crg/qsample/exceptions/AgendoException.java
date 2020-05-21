package eu.crg.qsample.exceptions;

import org.springframework.core.NestedRuntimeException;
import org.springframework.http.HttpStatus;
import org.springframework.lang.Nullable;
import org.springframework.web.client.HttpClientErrorException;

public class AgendoException extends HttpClientErrorException {


    @Nullable
    private final String reason;


    public String getReason() {
        return reason;
    }

    public AgendoException(HttpStatus statusCode, String reason) {
        super(statusCode);
        this.reason = reason;
    }




}