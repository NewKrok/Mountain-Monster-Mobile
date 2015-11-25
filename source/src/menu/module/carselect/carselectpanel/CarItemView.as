﻿package src.menu.module.carselect.carselectpanel{	import caurina.transitions.Tweener;	import net.fpp.starling.StaticAssetManager;	import src.assets.Fonts;	import src.data.CarData;	import src.assets.CarDatas;	import src.data.DataManager;	import src.data.PlayerData;	import src.events.PlayerDataEvent;	import src.menu.StarGuiView;	import src.menu.module.carselect.carselectpanel.events.CarSelectModuleEvent;	import src.utils.SimpleProgressBar;	import starling.display.Button;	import starling.display.Image;	import starling.display.Sprite;	import starling.events.Event;	import starling.text.TextField;	import starling.utils.HAlign;	import starling.utils.VAlign;	public class CarItemView extends Sprite	{		private var _starGuiView:StarGuiView;		private var _speedText:TextField;		private var _rotationText:TextField;		private var _wheelsText:TextField;		private var _selectButton:Button;		private var _buyButton:Button;		private var _speedProgress:SimpleProgressBar;		private var _rotationProgress:SimpleProgressBar;		private var _wheelsProgress:SimpleProgressBar;		private var _carData:CarData;		private var _car:Image;		private var _infoBack:Image;		private var _infoContainer:Sprite;		public function CarItemView( carType:uint ):void		{			this._carData = CarDatas.getData( carType );			this.addEventListener( Event.ADDED_TO_STAGE, this.loaded );		}		private function loaded( event:Event ):void		{			this.removeEventListener( Event.ADDED_TO_STAGE, loaded );			this.addChild( this._infoContainer = new Sprite );			this.createBackGraphic();			this.createTextFields();			this.createProgressBars();			this.createActionbuttons();			this.createRequiredStarsView();			this.createCarGraphic();			this.setPositions();			this.updateProgressBarRatios();			this.updateButtonsStates();			this.updateStarViewVisibility();			PlayerData.addEventListener( PlayerDataEvent.CAR_ID_CHANGED, this.playerCarIDChangedHandler );		}		private function createBackGraphic():void		{			this._infoContainer.addChild( this._infoBack = new Image( StaticAssetManager.instance.getTexture( "car_info_back" ) ) );		}		private function createTextFields():void		{			this._infoContainer.addChild( this._speedText = this.createInfoTextField( 'SPEED' ) );			this._infoContainer.addChild( this._rotationText = this.createInfoTextField( 'ROTATION' ) );			this._infoContainer.addChild( this._wheelsText = this.createInfoTextField( 'WHEELS' ) );		}		private function createInfoTextField( text:String ):TextField		{			var textField:TextField = new TextField( this.width, 13, text, Fonts.getAachenLightFont().name );			textField.fontSize = 11;			textField.color = 0xFFFFFF;			textField.vAlign = VAlign.CENTER;			textField.hAlign = HAlign.CENTER;			return textField;		}		private function createProgressBars():void		{			this._infoContainer.addChild( this._speedProgress = this.createCarInfoProgressBar() );			this._infoContainer.addChild( this._rotationProgress = this.createCarInfoProgressBar() );			this._infoContainer.addChild( this._wheelsProgress = this.createCarInfoProgressBar() );		}		private function createCarInfoProgressBar():SimpleProgressBar		{			return new SimpleProgressBar(					new Image( StaticAssetManager.instance.getTexture( "car_info_line_active" ) ),					new Image( StaticAssetManager.instance.getTexture( "car_info_line" ) )			);		}		private function createActionbuttons():void		{			this._infoContainer.addChild( this._selectButton = this.createCarInfoButton( 'SELECT', 'car_info_select_button' ) );			this._infoContainer.addChild( this._buyButton = this.createCarInfoButton( 'UNLOCK NOW', 'car_info_buy_button' ) );		}		private function createCarInfoButton( text:String, textureName:String ):Button		{			var button:Button = new Button( StaticAssetManager.instance.getTexture( textureName ), text );			button.fontColor = 0xFFFF00;			button.fontName = Fonts.getAachenLightFont().name;			button.addEventListener( Event.TRIGGERED, this.onButtonTriggered );			return button;		}		private function createRequiredStarsView():void		{			this._infoContainer.addChild( this._starGuiView = new StarGuiView() );		}		private function createCarGraphic():void		{			this.addChild( this._car = new Image( StaticAssetManager.instance.getTexture( "car_info_car_" + this._carData.graphicID ) ) );		}		private function setPositions():void		{			const gapBetweenInfoBlocks:Number = 6;			const gapBetweenTextAndProgressBar:Number = 1;			this._infoContainer.y = 110;			this._speedText.y = 10;			this._speedProgress.x = this.width / 2 - this._speedProgress.width / 2;			this._speedProgress.y = this._speedText.y + this._speedText.height + gapBetweenTextAndProgressBar;			this._rotationText.y = this._speedProgress.y + this._speedProgress.height + gapBetweenInfoBlocks;			this._rotationProgress.x = this.width / 2 - this._rotationProgress.width / 2;			this._rotationProgress.y = this._rotationText.y + this._rotationText.height + gapBetweenTextAndProgressBar;			this._wheelsText.y = this._rotationProgress.y + this._rotationProgress.height + gapBetweenInfoBlocks;			this._wheelsProgress.x = this.width / 2 - this._wheelsProgress.width / 2;			this._wheelsProgress.y = this._wheelsText.y + this._wheelsText.height + gapBetweenTextAndProgressBar;			this._selectButton.x = width / 2 - this._selectButton.width / 2;			this._selectButton.y = this._infoBack.height;			this._buyButton.x = _selectButton.x;			this._buyButton.y = _selectButton.y;			this._starGuiView.x = width / 2 - this._starGuiView.width / 2;			this._starGuiView.y = _selectButton.y;			this._car.x = this._infoBack.width / 2 - this._car.width / 2;			this._car.y = this._infoContainer.y - this._car.height - 5;		}		private function updateProgressBarRatios():void		{			var speedRatio:Number = ( CarDatas.MIN_SPEED - CarDatas.MAX_SPEED - ( this._carData.speed - CarDatas.MAX_SPEED ) ) / ( CarDatas.MIN_SPEED - CarDatas.MAX_SPEED );			Tweener.addTween( this._speedProgress, {time: .5, ratio: speedRatio} );			var rotationRatio:Number = ( CarDatas.MIN_ROTATION - CarDatas.MAX_ROTATION - ( this._carData.rotation - CarDatas.MAX_ROTATION ) ) / ( CarDatas.MIN_ROTATION - CarDatas.MAX_ROTATION );			Tweener.addTween( this._rotationProgress, {time: .5, ratio: rotationRatio} );			var dampingRatio:Number = ( CarDatas.MAX_DAMPING - CarDatas.MIN_DAMPING - ( this._carData.damping - CarDatas.MIN_DAMPING ) ) / ( CarDatas.MAX_DAMPING - CarDatas.MIN_DAMPING );			Tweener.addTween( this._wheelsProgress, {time: .5, ratio: dampingRatio} );		}		private function onButtonTriggered( e:Event ):void		{			var button:Button = e.target as Button;			if( button == this._selectButton )			{				this.dispatchEvent( new CarSelectModuleEvent( CarSelectModuleEvent.SELECT_CAR, this._carData.id ) );			}			else if( button == this._buyButton )			{				this.dispatchEvent( new CarSelectModuleEvent( CarSelectModuleEvent.BUY_CAR, this._carData.id ) );			}		}		private function playerCarIDChangedHandler( event:PlayerDataEvent ):void		{			this.updateButtonsStates();		}		private function updateButtonsStates():void		{			var isCarUnlocked:Boolean = DataManager.getIsCarUnlocked( this._carData.id );			var needStarToUnlock:Boolean = this._carData.starRequired != 0;			if( !isCarUnlocked && needStarToUnlock )			{				this._selectButton.enabled = false;				this._selectButton.visible = false;				this._buyButton.enabled = false;				this._buyButton.visible = false;			}			else			{				var isThisCarSelected:Boolean = this._carData.id == PlayerData.carID;				this._selectButton.enabled = isCarUnlocked && !isThisCarSelected;				this._selectButton.visible = this._selectButton.enabled;				this._buyButton.enabled = !isCarUnlocked;				this._buyButton.visible = this._buyButton.enabled;			}		}		private function updateStarViewVisibility():void		{			var isCarUnlocked:Boolean = DataManager.getIsCarUnlocked( this._carData.id );			var needStarToUnlock:Boolean = this._carData.starRequired != 0;			this._starGuiView.updateValue( this._carData.starRequired );			this._starGuiView.visible = !isCarUnlocked && needStarToUnlock;		}		public function unlock():void		{			this.updateButtonsStates();		}		override public function dispose():void		{			PlayerData.removeEventListener( PlayerDataEvent.CAR_ID_CHANGED, playerCarIDChangedHandler );			this._selectButton.removeEventListener( Event.TRIGGERED, this.onButtonTriggered );			this._selectButton.removeFromParent( true );			this._selectButton = null;			this._buyButton.removeEventListener( Event.TRIGGERED, this.onButtonTriggered );			this._buyButton.removeFromParent( true );			this._buyButton = null;			this._speedText.removeFromParent( true );			this._speedText = null;			this._rotationText.removeFromParent( true );			this._rotationText = null;			this._wheelsText.removeFromParent( true );			this._wheelsText = null;			Tweener.removeTweens( this._speedProgress );			this._speedProgress.removeFromParent( true );			this._speedProgress = null;			Tweener.removeTweens( this._rotationProgress );			this._rotationProgress.removeFromParent( true );			this._rotationProgress = null;			Tweener.removeTweens( this._wheelsProgress );			this._wheelsProgress.removeFromParent( true );			this._wheelsProgress = null;			this._car.removeFromParent( true );			this._car = null;			this._infoBack.removeFromParent( true );			this._infoBack = null;			this._infoContainer.removeFromParent( true );			this._infoContainer = null;			super.dispose();		}	}}