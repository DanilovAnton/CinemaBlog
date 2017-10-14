package com.home.validator;

import com.home.model.Post;
import com.home.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class PostValidator implements Validator {

    @Autowired
    PostService postService;

    @Override
    public boolean supports(Class<?> clazz) {
        return Post.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "text", "Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tags", "Required");

    }
}
