// Include the Ruby headers and goodies
#include "ruby.h"

VALUE GC = Qnil;
VALUE Giraffe = Qnil;

typedef struct method {
    str * name;             // jméno metody
    /* TODO ? code; */      // její kód 
} method; 

// struktura třídy
typedef struct class {
    int size;               // třída má nějakou velikost                        
    str * name;             // jméno
    struct class * sclass;  // superclass
    method * methods;       // metody
} class;

// struktura instance
typedef struct object {
    int GCFlag;             // byl objekt označen GC ?
    int size;               // musí tady být, nedal by se odvodit z class v případech pole Objekt[]
    struct object * class   // ukazatel na svoji třídu - ta je také objekt
}

VALUE test(VALUE obj, VALUE val) {

    printf("arg: %d\n", NUM2INT(val));

    return Qnil;

}

/* Alokuje v paměti místo pro objekt
 * dělá tak skrz GC, aby se kontrolovala
 * velikost a mohl se provádět scavenge */
obj * new_obj(class * clazz, int size) {
    obj* o;

    // alokuje (do vlastni spravovane pameti)
    o = (obj *) gc_alloc(sizeof ( obj ) + size * sizeof(int*));

    // vynuluje 
    bzero( (void *) o, sizeof ( obj ) + size * sizeof(int*));
    o->size = size;
    o->class = (obj *) clazz;   
    return o;
}

obj *


//VALUE rb_ivar_get(VALUE obj, ID id);
//VALUE rb_ivar_set(VALUE obj, ID id, VALUE val);

VALUE initialize(VALUE obj, VALUE val) {

    // kolik se ma alokovat ?
}

VALUE gc_allocate(VALUE clazz) {

}

void Init_gc() {

    // vytvori stejny objekt a bude konflikt ... 
    Giraffe = rb_define_module("Giraffe");
    GC = rb_define_class_under(Giraffe,"GC",rb_cObject);
    rb_define_method(GC,"test", test, 1);

    // initialize
    rb_define_method(GC,"initialize", initialize, 1);

    // jak alokovat GC
    rb_define_alloc_func(GC, gc_allocate);

}
