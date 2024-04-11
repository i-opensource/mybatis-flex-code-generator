package i.source.code.generator.framework.common.web;

import lombok.Data;

import static i.source.code.generator.framework.common.web.WebResult.WebResultEnum.FAILURE;
import static i.source.code.generator.framework.common.web.WebResult.WebResultEnum.SUCCESS;

/**
 * 返回结果
 * @author Go
 * @since 2024
 */
@Data
public class WebResult<T> {

    /**
     * 编码, 200成功
     */
    private Integer code;

    private String msg;

    private T data;

    public WebResult() {}

    public WebResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public WebResult(Integer code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static <T> WebResult<T> success() {
        return new WebResult<>(SUCCESS.code, SUCCESS.msg);
    }

    public static <T> WebResult<T> failure() {
        return failure(FAILURE.code, FAILURE.msg);
    }

    public static <T> WebResult<T> success(T data) {
        WebResult<T> success = success();
        success.setData(data);

        return success;
    }

    public static <T> WebResult<T> failure(Integer code, String msg) {
        return new WebResult<>(code, msg);
    }

    public static <T> WebResult<T> failure(String msg) {
        return new WebResult<>(FAILURE.code, msg);
    }

    enum WebResultEnum {
        SUCCESS(200, "操作成功"),
        FAILURE(500, "操作失败")
        ;

        private final Integer code;
        private final String msg;

        WebResultEnum(final Integer code, String msg) {
            this.code = code;
            this.msg = msg;
        }
    }

}
