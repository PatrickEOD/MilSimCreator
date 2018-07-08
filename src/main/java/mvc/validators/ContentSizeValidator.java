package mvc.validators;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import mvc.utils.enums.WeaponType;

public class ContentSizeValidator implements ConstraintValidator<ContentSize, WeaponType> {

	public void initialize(ContentSize constraintAnnotation) {
	}

	public boolean isValid(WeaponType value, ConstraintValidatorContext context) {
		return value != null;
	}
	
}
