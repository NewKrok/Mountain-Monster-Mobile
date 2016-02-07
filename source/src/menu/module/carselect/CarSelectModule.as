﻿package src.menu.module.carselect{	import net.fpp.starling.module.AModule;	import net.fpp.starling.module.events.ModuleEvent;	import src.constant.CStarRequired;	import src.common.DataManager;	import src.menu.module.carselect.view.CarSelectModuleView;	import starling.events.Event;	public class CarSelectModule extends AModule	{		public function CarSelectModule():void		{			this.unlockAvailableCars();			this._view = new CarSelectModuleView();			this._view.addEventListener( ModuleEvent.DISPOSE_REQUEST, this.backToMapRequest );		}		private function unlockAvailableCars():void		{			var allEarnedStarCount:int = DataManager.getAllEarnedStarCount();			if ( allEarnedStarCount >= CStarRequired.UNLOCK_CAR_TYPE_1 )			{				DataManager.unlockCar( 1 );			}			if ( allEarnedStarCount >= CStarRequired.UNLOCK_CAR_TYPE_2 )			{				DataManager.unlockCar( 2 );			}			if ( allEarnedStarCount >= CStarRequired.UNLOCK_CAR_TYPE_3 )			{				DataManager.unlockCar( 3 );			}			if ( allEarnedStarCount >= CStarRequired.UNLOCK_CAR_TYPE_4 )			{				DataManager.unlockCar( 4 );			}		}		private function backToMapRequest( event:Event ):void		{			this.disposeRequest();		}		public function unlockCar( carId:uint ):void		{			( this._view as CarSelectModuleView ).unlockCar( carId );		}		override public function dispose():void		{			this._view.removeEventListener( ModuleEvent.DISPOSE_REQUEST, this.backToMapRequest );			this._view.dispose();			this._view = null;			super.dispose();		}	}}