package {
	public class ChromelessPlayerConstants {
		
		//////////////////////////////////////////////////////////////////////////////
		// Events
		//////////////////////////////////////////////////////////////////////////////
		
		/**
		 * This event is fired when the player is loaded and initialized, meaning it is ready to receive API calls.
		 * 
		 */
		public static const EVENT_READY:String = 'onReady';
		
		/**
		 * This event is fired whenever the player's state changes. 
		 * Possible values are 
		 * 		unstarted (-1), 
		 * 		ended (0), 
		 * 		playing (1), 
		 * 		paused (2), 
		 * 		buffering (3), 
		 * 		video cued (5). 
		 * When the SWF is first loaded it will broadcast an unstarted (-1) event. 
		 * When the video is cued and ready to play it will broadcast a video cued event (5).
		 */
		public static const EVENT_STATE_CHANGE:String = 'onStateChange';
		
		/**
		 * This event is fired whenever the video playback quality changes. 
		 * For example, if you call the setPlaybackQuality(suggestedQuality) function, 
		 * this event will fire if the playback quality actually changes. 
		 * Your code should respond to the event and should not assume that the quality 
		 * will automatically change when the setPlaybackQuality(suggestedQuality) function is called. 
		 * Similarly, your code should not assume that playback quality will only change as a result 
		 * of an explicit call to setPlaybackQuality or any other function that 
		 * allows you to set a suggested playback quality.
		 * 
		 * The value that the event broadcasts is the new playback quality. 
		 * Possible values are "normal", "high" and "hd720".
		 * 
		 */ 
		public static const EVENT_PLAYBACK_QUALITY_CHANGE:String = 'onPlaybackQualityChange';
		
		public static const PLAYBACK_QUALITY_DEFAULT:String = 'default';
		
		public static const PLAYBACK_QUALITY_NORMAL:String = 'normal';
		
		public static const PLAYBACK_QUALITY_HIGH:String = 'high';
		
		public static const PLAYBACK_QUALITY_HD720:String = 'hd720';
		
		/**
		 * Transport modes
		 * 
		 */
		public static const TRANSPORT_PROGRESSIVE:String = 'progressive';
		
		public static const TRANSPORT_RTMP:String = 'rtmp';
		
		public static const TRANSPORT_RTMP_ADAPTIVE:String = 'rtmpAdaptive';
		
		
		/**
		 * This mean automatic stream selection
		 * 
		 */
		public static const STREAM_AUTO_MODE:Number = -1;
		
		/**
		 * This event is dispatched when current video stream is switched either by user or atomatically  
		 * 
		 */
		public static const EVENT_STREAM_CHANGED:String = 'streamChanged';
		
		
		/**
		 * This event is fired when an error in the player occurs. 
		 * The possible error codes are 100, 101, and 150. 
		 * The 100 error code is broadcast when the video requested is not found. 
		 * This occurs when a video has been removed (for any reason), or it has been marked as private. 
		 * The 101 error code is broadcast when the video requested does not allow playback in 
		 * the embedded players. The error code 150 is the same as 101, it's just 101 in disguise!
		 * 
		 */
		public static const EVENT_ERROR:String = 'onError';
		
		public static const ERROR_VIDEO_NOT_AVAILABLE:Number = 100; // video not found or deleted
		
		public static const ERROR_EMBEDDING_NOT_ALLOWED:Number = 101; // this is not used by viddler, at least not now
		public static const ERROR_EMBEDDING_NOT_ALLOWED_ALT:Number = 150; // this is not used by viddler, at least not now
		
		public static const ERROR_VIDEO_FORBIDDEN:Number = 111; // this means that user is not permitted to view this video 
		public static const ERROR_TRIAL_EXPIRED:Number = 112; // this means that video's author's account has expired
		
		
		/**
		 * This event is fired when new branding info is loaded
		 * Data contains new BrandingInfo object. 
		 * If data is null, skin should use default branding.
		 */
		public static const EVENT_BRANDING_UPDATE:String = 'onBrandingUpdate';
		
		/**
		 * This event is fired when security is updated after loading
		 * new video info or updating old one.
		 * Data property contains SecurityManager instance.
		 */
		public static const EVENT_SECURITY_UPDATE:String = 'onSecurityUpdate';
		
		/**
		 * This event is fired when email is sent.
		 * Data property contains result:
		 * 0 - everything is ok, email was sent
		 * 1 - wrong method was used: sendEmail() for anonymous user or sendEmailAnonymous() for logged user
		 * 2 - error, something went wrong (net error, server error), we can't do anything about this
		 * 		show user error message and move on
		 */
		public static const EVENT_SEND_EMAIL_RESULT:String = 'onSendEmailResult';
		
		public static const SEND_EMAIL_RESULT_SUCCESS:Number = 0;
		
		public static const SEND_EMAIL_RESULT_INVALID_METHOD:Number = 1;
		
		public static const SEND_EMAIL_RESULT_ERROR:Number = 2;
		
		
		/**
		 * This event is fired when tag is saved
		 * Data property contains results:
		 * Array of TagInfo instances - saved tags, everything went ok
		 * null - error occurred, we can't do anything about this
		 * 
		 */
		public static const EVENT_SAVE_TAG_RESULT:String = 'onSaveTagResult';
		
		/**
		 * This event is fired when comment is saved
		 * Data property contains results:
		 * CommentInfo instance - saved comment info, everything went ok
		 * null - error occued, we can't do anything about this
		 */
		public static const EVENT_SAVE_COMMENT_RESULT:String = 'onSaveCommentResult';
		
		/**
		 * This event is fired when comment is rated
		 * Data property contains results:
		 * 0 - everything is ok, comment was rate
		 * 1 - error, something went wrong (net error, server error), we can't do anythin about this
		 */
		public static const EVENT_RATE_COMMENT_RESULT:String = 'onRateCommentResult';
		
		public static const RATE_COMMENT_RESULT_SUCCESS:Number = 0;
		
		public static const RATE_COMMENT_RESULT_ERROR:Number = 1;
		
		/**
		 * This event is fired when comment is deleted
		 * Data property contains:
		 * 0 - comment deleted
		 * 1 - error, something went wrong
		 */
		public static const EVENT_DELETE_COMMENT_RESULT:String = 'onDeleteCommentResult';
		
		public static const DELETE_COMMENT_RESULT_SUCCESS:Number = 0;
		
		public static const DELETE_COMMENT_RESULT_ERROR:Number = 1;
		
		
		/**
		 * This event is fired after login request
		 * Data property contains results:
		 * 0 - everything is ok,  user was logged in
		 * 1 - error, something went wrong
		 */
		public static const EVENT_LOGIN_RESULT:String = 'onLoginResult';
		
		public static const LOGIN_RESULT_SUCCESS:Number = 0;
		
		public static const LOGIN_RESULT_ERROR:Number = 1;
		
		
		/**
		 * This event is fired in response to User Register reques
		 * data property contains UserRegisterInfo object 
		 * 
		 */ 
		public static const EVENT_USER_REGISTER_RESULT:String = 'onUserRegisterResult';
		
		/**
		 * This event is fired after getAuthorVideos function is called.
		 * Data property contains result:
		 * null - error, no videos were retrieved
		 * array of UserVideoInfo instances - everything is ok 
		 */
		public static const EVENT_GET_AUTHOR_VIDEOS_RESULT:String = 'onGetAuthorVideosResult';
		
		/**
		 * This event is fired after getPlayAllUserVideos method is called.
		 * Data property contains result:
		 * null - error, no videos were retrieved
		 * array of PlayAllVideoInfo instances = everything is ok
		 * 
		 */
		public static const EVENT_GET_PLAY_ALL_USER_VIDEOS_RESULT:String = 'onGetPlayAllUserVideosResult';
		
		/**
		 * This event is fired after getPlayAllGroupVideos method is called
		 * Data property contains result:
		 * null - error, no video were retrieved
		 * array of PlayAllViideoInfo instances = everything is ok
		 *
		 */
		public static const EVENT_GET_PLAY_ALL_GROUP_VIDEOS_RESULT:String = 'onGetPlayAllGroupVideosResult';
		
		/**
		 * This event is fired after ChromelessPlayerInterface.setVolume method call.
		 * Data property contains result new volume.
		 * 
		 */
		public static const EVENT_VOLUME_CHANGE:String = 'onVolumeChange';
		
		
		/**
		 * This event is fired after ChromelessPlayerInterface.mute and ChromelessPlayerInterface.unMute methods call.
		 * Data property contains boolean indicating if video is muted.  
		 */		
		public static const EVENT_MUTE_CHANGE:String = 'onMuteChange';
		
		/**
		 * This event is fired after ChromelessPlayerInterface.setThumbnail.
		 * Data property contains results:
		 * 0 - everything is ok,  new thumbnail will be created
		 * 1 - error, something went wrong
		 * 
		 */
		public static const EVENT_SET_THUMBNAIL_RESULT:String = 'onSetThumbnailResult';
		
		public static const SET_THUMBNAIL_RESULT_SUCCESS:Number = 0;
		
		public static const SET_THUMBNAIL_RESULT_ERROR:Number = 1;
		
		
		/**
		 * This event is fired when thumbnail is loaded.
		 * 
		 */
		public static const EVENT_THUMBNAIL_READY:String = 'onThumbnailReady';
		
		
		/**
		 * This event is fired when skin is ready 
		 * 
		 */
		
		public static const EVENT_SKIN_READY:String = 'onSkinReady';
		
		/**
		 * This event is fired in response to getEmbedCodeTypes request
		 * 
		 * Data property contains list of available embed types or
		 * null if there was an error
		 */
		public static const EVENT_GET_EMBED_CODE_TYPES_RESULT:String = 'onGetEmbedCodeTypesResult';		
		
		
		/**
		 * This event is fired in response to getEmbedCodeResult
		 * 
		 * Data property contains embed code or
		 * null if error has occured  
		 */
		public static const EVENT_GET_EMBED_CODE_RESULT:String = 'onGetEmbedCodeResult';		
		
		//////////////////////////////////////////////////////////////////////////////
		// Player states
		//////////////////////////////////////////////////////////////////////////////
		
		/**
		 * Player state unstarted, value: -1
		 * 
		 */ 
		public static const PLAYER_STATE_UNSTARTED:Number = -1;
		
		/**
		 * Player state ended, value: 0
		 * 
		 */
		public static const PLAYER_STATE_ENDED:Number = 0;
		
		/**
		 * Player state playing, value: 1
		 * 
		 */
		public static const PLAYER_STATE_PLAYING:Number = 1;
		
		/**
		 * Player state paused, value: 2
		 * 
		 */
		public static const PLAYER_STATE_PAUSED:Number = 2;
		
		/**
		 * Player state buffering, value: 3
		 * 
		 */
		public static const PLAYER_STATE_BUFFERING:Number = 3;
		
		/**
		 * Player state video cued, value: 5
		 * 
		 */
		public static const PLAYER_STATE_VIDEO_CUED:Number = 5;  
		
		/**
		 * Player state locked, value: 11
		 */
		public static const PLAYER_STATE_LOCKED:Number = 11;
		
		
		//////////////////////////////////////////////////////////////////////////////
		// Logo align
		//////////////////////////////////////////////////////////////////////////////
		
		public static const LOGO_ALIGN_TOP_LEFT:String = 'tl';
		public static const LOGO_ALIGN_LEFT:String = 'l';
		public static const LOGO_ALIGN_BOTTOM_LEFT:String = 'bl';
		public static const LOGO_ALIGN_BOTTOM:String = 'b';
		public static const LOGO_ALIGN_BOTTOM_RIGHT:String = 'br';
		public static const LOGO_ALIGN_RIGHT:String = 'r';
		public static const LOGO_ALIGN_TOP_RIGHT:String = 'tr';
		public static const LOGO_ALIGN_TOP:String = 't';		
	}
}