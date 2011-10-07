// garar was here but went for the beer
/**
 * Version 0.1, 07.10.2011
 */ 
package {
	
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.system.Security;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Timer;
	
	[SWF(width="600", height="400", frameRate="10")]
	public class ExampleSkin extends Sprite {
		
		private var loader:Loader;
		
		private var player:Object;
		
		private var playButton:Button;
		
		private var stopButton:Button;
		
		private var statusField:TextField; 
		
		private var volumeField:TextField;
		
		private var bytesTotalField:TextField;
		
		private var bytesLoadedField:TextField;
		
		private var bytesStartField:TextField;
		
		private var durationField:TextField;
		
		private var currentTimeField:TextField;
		
		public function ExampleSkin() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			createButtons();
			createFields();
			
			stage.addEventListener(Event.RESIZE, onStageResize);
			
			var timer:Timer = new Timer(250);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			
			loadPlayer();
		}
		
		private function loadPlayer():void {
			loader = new Loader();
			// TODO add error handling
			loader.contentLoaderInfo.addEventListener(Event.INIT, onLoaderInit);
			loader.load(new URLRequest("http://www.viddler.com/chromeless/"));			
		}
		
		private function onLoaderInit(event:Event):void {
			trace('onLoaderInit, event:', event);
			addChild(loader);
			Security.allowDomain(loader.content.loaderInfo.url);
			loader.content.addEventListener(ChromelessPlayerConstants.EVENT_READY, onPlayerReady);
			loader.content.addEventListener(ChromelessPlayerConstants.EVENT_ERROR, onPlayerError);
			loader.content.addEventListener(ChromelessPlayerConstants.EVENT_STATE_CHANGE, onPlayerStateChange);
			loader.content.addEventListener(ChromelessPlayerConstants.EVENT_PLAYBACK_QUALITY_CHANGE, onPlayerPlaybackQualityChange);
		}
		
		
		private function onPlayerReady(event:Event):void {
			trace('onPlayerReady, event:', event);
			player = loader.content;
			
			addChild(stopButton);
			addChild(playButton);
			addChild(statusField);
			addChild(volumeField);
			addChild(bytesTotalField);
			addChild(bytesLoadedField);
			addChild(bytesStartField);
			addChild(durationField);
			addChild(currentTimeField);
			onStageResize(null);
			player.cueVideoByKey('d6c37b62');
		}
		
		private function onPlayerError(event:Event):void {
			trace('onPlayerError, event: ' + event);	
		}
		
		private function onPlayerStateChange(event:Event):void {
			trace('onPlayerStateChange, event: ' + event);
			var data:Number = Object(event).data;
			if (data == ChromelessPlayerConstants.PLAYER_STATE_UNSTARTED) {
				updateStatus('unstarted');
				playButton.enabled = false;
			} else if (data == ChromelessPlayerConstants.PLAYER_STATE_ENDED) {
				updateStatus('ended');
				playButton.label = 'replay';
				playButton.enabled = true;
				stopButton.enabled = false;
			} else if (data == ChromelessPlayerConstants.PLAYER_STATE_PLAYING) {
				updateStatus('playing');
				playButton.label = 'pause';
				playButton.enabled = true;
				stopButton.enabled = true;
			} else if (data == ChromelessPlayerConstants.PLAYER_STATE_PAUSED) {
				updateStatus('paused');
				playButton.label = 'play';
				stopButton.enabled = true;
			} else if (data == ChromelessPlayerConstants.PLAYER_STATE_BUFFERING) {
				updateStatus('buffering');
				playButton.label = 'pause';
				playButton.enabled = true;
				stopButton.enabled = true;
			} else if (data == ChromelessPlayerConstants.PLAYER_STATE_VIDEO_CUED) {
				playButton.label = 'play';
				playButton.enabled = true;
				updateStatus('video cued');
			}
		}
		
		private function onPlayerPlaybackQualityChange(event:Event):void {
			trace('onPlayerPlaybackQualityChange, event:', event);
		}
		
		private function onStageResize(event:Event):void {
			trace('onStageResize, event:', event);
			if (player != null) {
				player.setSize(stage.stageWidth, stage.stageHeight);
			}
			var padding:Number = 10;
			var y:Number = stage.stageHeight - 30;
			
			stopButton.x = padding;
			stopButton.y = y;
			
			playButton.x = stopButton.x + stopButton.width + padding;
			playButton.y = y;
			
			statusField.x = padding;
			statusField.y = padding;
			
			volumeField.x = statusField.x;
			volumeField.y = statusField.y + statusField.height + padding;
			
			bytesTotalField.x = volumeField.x;
			bytesTotalField.y = volumeField.y + volumeField.height + padding;
			
			bytesLoadedField.x = bytesTotalField.x;
			bytesLoadedField.y = bytesTotalField.y + bytesTotalField.height + padding;
			
			bytesStartField.x = bytesLoadedField.x;
			bytesStartField.y = bytesLoadedField.y + bytesLoadedField.height + padding;
			
			durationField.x = bytesStartField.x;
			durationField.y = bytesStartField.y + bytesStartField.height + padding;
			
			currentTimeField.x = durationField.x;
			currentTimeField.y = durationField.y + durationField.height + padding;
		}
		
		private function createTextField():TextField {
			var textField:TextField = new TextField();
			textField = new TextField();
			textField.background = true;
			textField.backgroundColor = 0xFFFFFF;
			textField.selectable = false;
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.text = 'none';
			return textField;
		}
		
		//
		// Fields
		//
		
		private function createFields():void {
			statusField = createTextField();
			volumeField = createTextField();
			updateVolume(0);
			bytesTotalField = createTextField();
			updateBytesTotal(0);
			bytesLoadedField = createTextField();
			updateBytesLoaded(0);
			bytesStartField = createTextField();
			updateBytesStart(0);
			durationField = createTextField();
			updateDuration(0);
			currentTimeField = createTextField();
			updateCurrentTime(0);
		}
		
		private function updateStatus(status:String):void {
			statusField.text = status;
		}
		
		private function updateVolume(volume:Number):void {
			volumeField.text = 'Volume: ' + volume;
		}
		
		private function updateBytesLoaded(bytesLoaded:Number):void {
			bytesLoadedField.text = 'Bytes loaded: ' + bytesLoaded;
		}
		
		private function updateBytesTotal(bytesTotal:Number):void {
			bytesTotalField.text = 'Bytes total: ' + bytesTotal;
		}
		
		private function updateBytesStart(bytesStart:Number):void {
			bytesStartField .text = 'Bytes start: ' + bytesStart;
		}
		
		private function updateDuration(duration:Number):void {
			durationField.text = 'Duration: ' + duration;
		}
		
		private function updateCurrentTime(currentTime:Number):void {
			currentTimeField.text = 'Current time: ' + currentTime;
		}
		
		//
		// Update timer
		// 
		
		private function onTimer(event:TimerEvent):void {
			if (player) {
				updateVolume(player.getVolume());
				updateBytesLoaded(player.getVideoBytesLoaded());
				updateBytesTotal(player.getVideoBytesTotal());
				updateBytesStart(player.getVideoStartBytes());
				updateDuration(player.getDuration());
				updateCurrentTime(player.getCurrentTime());
			}
		}
		
		//
		// Buttons
		//
		
		private function createButtons():void {
			playButton = new Button('play');
			playButton.addEventListener(MouseEvent.CLICK, onPlayButtonClick);
			stopButton = new Button('stop');
			stopButton.addEventListener(MouseEvent.CLICK, onStopButtonClick);
			stopButton.enabled = false;
		}
		
		private function onPlayButtonClick(e:MouseEvent):void {
			switch (player.getPlayerState()) {
				case ChromelessPlayerConstants.PLAYER_STATE_VIDEO_CUED:
				case ChromelessPlayerConstants.PLAYER_STATE_PAUSED:
					player.playVideo();
					break;
				case ChromelessPlayerConstants.PLAYER_STATE_BUFFERING:
				case ChromelessPlayerConstants.PLAYER_STATE_PLAYING:
					player.pauseVideo();
					break;
				case ChromelessPlayerConstants.PLAYER_STATE_ENDED:
					player.seekTo(0);
//					player.playVideo();
					break;
			}
		}
		
		private function onStopButtonClick(e:MouseEvent):void {
			player.stopVideo();
		}
		
		//
		// 
		//
		
		
	}
}