package {
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class Button extends SimpleButton {

//		private var _enabled:Boolean = true;
		
		private var _label:String;
		
		private var upTextField:TextField;
		
		private var overTextField:TextField;
		
		private var downTextField:TextField;
		
		public function Button(label:String) {

			_label = label;
			upTextField = createState(_label, 0xFFFFFF);
			overTextField = createState(_label, 0x999999);
			downTextField = createState(_label, 0x555555);
			super(upTextField, overTextField, downTextField, upTextField);
//			addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void { if (!enabled) { event.preventDefault(); } });
		}
		
		private function createState(label:String, color:Number):TextField {
			var tf:TextField = new TextField();
			tf.autoSize = TextFieldAutoSize.LEFT;
			tf.background = true;
			tf.backgroundColor = color;
			tf.text = label;
			tf.selectable = false;
			return tf;
		}

		
		override public function set enabled(value:Boolean):void {
			if (super.enabled != value) {
				super.enabled = value;
				mouseEnabled = value;
			}			
		}
		
		
		public function get label():String {
			return _label;
		}
		
		public function set label(value:String):void {
			if (_label != value) {
				_label = value;
				upTextField.text = value;
				overTextField.text = value;
				downTextField.text = value;
			}
		}
	}
}