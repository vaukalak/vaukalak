package by.vaukalak.core.commands {
	/**
	 * ...
	 * @author Boutylin Mikhail
	 */
	public dynamic class Command extends Array{
		public var name:String;
		
		public function Command(name:String, args:Array = null) {
			super();
			this.name = name;
			if (args && args.length) super.push.apply(this, args);
		}
		
		public function clone():Command {
			return new Command(this.name, this);
		}
		
		public function call(client:Object, ns:Namespace=null):* {
            return client[ new QName( ns || '', this.name ) ].apply( client, this );
		}
		
		public function toString():String {
			return name + (super.length ? ":\t" + super.join(", ") : "");
		}
		
	}

}