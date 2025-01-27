#include <ruby.h>
#include <math.h>
#include "extconf.h"

VALUE power(VALUE self, VALUE base, VALUE exp) {
    double base_value = NUM2DBL(base);
    double exponential = NUM2DBL(exp);
    double result = pow(base_value, exponential);

    return DBL2NUM(result);
}

/**
 * Initializes the power extension for Ruby.
 *
 * This function defines the "power" method in the Math module.
 * The method takes two arguments, the base and the exponent, and returns the result of raising the base to the exponent.
 * 
 *
 * @example Usage of the power method
 *  Math.power(2, 3) # => 8
 *  LekitoMath.power(2, 3) # => 8
 */

void Init_power_extension() {
    // Here i am creating a custom module
    VALUE mod = rb_define_module("LekitoMath");
    rb_define_singleton_method(mod, "power", power, 2);

     // Here i will update the Built-in Math module
    rb_define_singleton_method(rb_mMath, "power", power, 2);
}
