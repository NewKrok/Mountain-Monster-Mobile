﻿package src.menu.module.carselect.carselectpanel{	import feathers.controls.ScrollContainer;	import feathers.controls.Scroller;	import net.fpp.services.store.StaticStoreManager;	import src.assets.CarDatas;	import src.constant.CPurchaseItems;	import src.data.PlayerData;	import src.menu.module.carselect.carselectpanel.events.CarSelectModuleEvent;	import starling.display.Sprite;	import starling.events.Event;	public class CarList extends Sprite	{		private const X_OFFSET_BETWEEN_2_CAR:uint = 10;		private var _scrollContainer:ScrollContainer;		private var _container:Sprite;		private var _carItemViews:Vector.<CarItemView> = new Vector.<CarItemView>;		private var _width:Number;		public function CarList( $width:Number ):void		{			_width = $width;			addEventListener( Event.ADDED_TO_STAGE, loaded );		}		private function loaded( event:Event ):void		{			removeEventListener( Event.ADDED_TO_STAGE, loaded );			addChild( _scrollContainer = new ScrollContainer );			_scrollContainer.addChild( _container = new Sprite );			_scrollContainer.width = _width - 20;			_scrollContainer.horizontalScrollPolicy = Scroller.SCROLL_POLICY_ON;			_scrollContainer.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;			_scrollContainer.snapScrollPositionsToPixels = true;			_scrollContainer.isEnabled = true;			_scrollContainer.x = 10;			generateList();			_scrollContainer.height = _container.height + 60;		}		private function generateList():void		{			for( var i:uint = 0; i < CarDatas.CAR_DATAS.length; i++ )			{				_carItemViews.push( _container.addChild( new CarItemView( CarDatas.CAR_DATAS[i].id ) ) as CarItemView );				_carItemViews[ i ].x = i * ( _carItemViews[ i ].width + X_OFFSET_BETWEEN_2_CAR );				_carItemViews[ i ].addEventListener( CarSelectModuleEvent.SELECT_CAR, selectCar );				_carItemViews[ i ].addEventListener( CarSelectModuleEvent.BUY_CAR, buyCar );			}		}		public function unlockCar( carId:uint ):void		{			for( var i:uint = 0; i < CarDatas.CAR_DATAS.length; i++ )			{				if ( CarDatas.CAR_DATAS[i].id == carId )				{					_carItemViews[ i ].unlock();				}			}		}		private function selectCar( event:CarSelectModuleEvent ):void		{			PlayerData.carID = uint( event.data );			dispatchEventWith( CarSelectModuleEvent.SELECT_CAR );		}		private function buyCar( e:CarSelectModuleEvent ):void		{			switch( e.data )			{				case 1000:					StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItems.PURCHASE_ITEM_CAR_1 );					break;				case 1001:					StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItems.PURCHASE_ITEM_CAR_2 );					break;				case 1002:					StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItems.PURCHASE_ITEM_CAR_3 );					break;				case 1003:					StaticStoreManager.purchaseNonConsumableProduct( CPurchaseItems.PURCHASE_ITEM_CAR_4 );					break;			}		}		override public function dispose():void		{			for( var i:uint = 0; i < _carItemViews.length; i++ )			{				_carItemViews[ i ].removeEventListener( CarSelectModuleEvent.SELECT_CAR, selectCar );				_carItemViews[ i ].removeEventListener( CarSelectModuleEvent.BUY_CAR, buyCar );				_carItemViews[ i ].removeFromParent( true );				_carItemViews[ i ] = null;			}			_carItemViews.length = 0;			_carItemViews = null;			_container.removeFromParent( true );			removeChild( _scrollContainer );			_scrollContainer.dispose();			_scrollContainer = null;			super.dispose();		}	}}