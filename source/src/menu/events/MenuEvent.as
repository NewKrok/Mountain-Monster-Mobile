﻿package src.menu.events{	import starling.events.Event;	public class MenuEvent extends Event	{		public static const START_GAME_REQUEST:String = "MenuEvent.START_GAME_REQUEST";		public static const MAIN_MENU_REQUEST:String = "MenuEvent.MAIN_MENU_REQUEST";		public static const NORMAL_GAME_REQUEST:String = "MenuEvent.NORMAL_GAME_REQUEST";		public static const OPEN_CAR_SELECT_REQUEST:String = "MenuEvent.OPEN_CAR_SELECT_REQUEST"		public static const NEXT_LEVEL_REQUEST:String = "MenuEvent.NEXT_LEVEL_REQUEST";		public static const OPTIONS_REQUEST:String = "MenuEvent.OPTIONS_REQUEST";		public function MenuEvent( type:String, data:Object = null ):void		{			super( type, false, data );		}	}}