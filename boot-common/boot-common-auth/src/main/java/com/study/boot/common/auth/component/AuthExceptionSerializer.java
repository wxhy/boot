package com.study.boot.common.auth.component;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import com.study.boot.common.auth.exception.PigAuth2Exception;
import com.study.boot.common.enums.CommonConstants;
import lombok.SneakyThrows;

/**
 * @author Administrator
 */
public class AuthExceptionSerializer extends StdSerializer<PigAuth2Exception> {

    protected AuthExceptionSerializer(Class<PigAuth2Exception> t) {
        super(t);
    }

    @Override
    @SneakyThrows
    public void serialize(PigAuth2Exception value, JsonGenerator gen, SerializerProvider provider) {
        gen.writeStartObject();
        gen.writeObjectField("code", CommonConstants.FAIL);
        gen.writeStringField("msg", value.getMessage());
        gen.writeStringField("data", value.getErrorCode());
        gen.writeEndObject();
    }
}