package;

import Hello;

/**
 * Main is an example of using the statically linked extern class Hello.
 */
class Main {
	static function main() {
		final greeter:Hello = Hello.create();
		greeter.sayGoodbye();
		greeter.sayHello();
	}
}
