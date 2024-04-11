package i.source.code.generator.framework.common.constant.exceptions;

/**
 * 服务异常
 * @author Go
 * @since 2024
 */
public class ServiceException extends RuntimeException {

    private Integer code;
    private String message;

    public ServiceException(Integer code, String message) {
        super(message);
        this.code = code;
    }

    public ServiceException(String message) {
        super(message);
    }

    public ServiceException(Throwable cause) {
        super(cause);
    }

    public ServiceException(Integer code, String message, Throwable cause) {
        super(message, cause);
        this.code = code;
    }

}
