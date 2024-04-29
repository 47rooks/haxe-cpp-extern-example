package;

/**
 * An example wrapper class for a CPP static link library.
 * 
 * @:include points to the library header file.
 * @:buildXml defines the location of the library to be linked with
 * @:native defines the native name to be used for the class. Specifically in this case a pointer to the class. My understanding of why this is done is that Haxe cannot call the extern cannot constructor and must instead use a `create()` factory function. This will then return a reference to the class instance (pointer). This is why is defines the name as `Hello *`.
 * Related to the last point above is the `@:native("new Hello")` for the `create()` factory function.
 */
@:include("./cpp/hello/hello.h")
@:buildXml('
    <target  id="haxe">
    <lib name="..\\..\\..\\extlib\\cpp\\hello\\x64\\Debug\\hello.lib"/>
	</target>
')
@:native("Hello *")
extern class Hello {
	/**
	 * Factory function mapped to the native constructor.
	 * @return a Hello instance
	 */
	@:native("new Hello") public static function create():Hello;

	@:native("sayHello") public function sayHello():Void;
	@:native("sayGoodbye") public function sayGoodbye():Void;
}
