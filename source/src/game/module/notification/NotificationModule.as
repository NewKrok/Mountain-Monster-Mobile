﻿package src.game.module.notification{	import flash.utils.Dictionary;	import net.fpp.common.starling.module.AModule;	import src.game.module.notification.constant.CNotification;	import src.game.module.notification.view.NotificationModuleView;	public class NotificationModule extends AModule	{		private var _notificationManifest:Dictionary = new Dictionary();		public function NotificationModule():void		{			this._view = this.createModuleView( NotificationModuleView ) as NotificationModuleView;			this._notificationManifest[ CNotification.FRONT_FLIP ] = ( this._view as NotificationModuleView ).addFrontFlipNotification;			this._notificationManifest[ CNotification.BACK_FLIP ] = ( this._view as NotificationModuleView ).addBackFlipNotification;			this._notificationManifest[ CNotification.NICE_AIR ] = ( this._view as NotificationModuleView ).addNiceAirTimeNotification;			this._notificationManifest[ CNotification.NICE_WHEELIE ] = ( this._view as NotificationModuleView ).addNiceWheelieTimeNotification;		}		public function add( type:String ):void		{			this._notificationManifest[ type ].call();		}	}}