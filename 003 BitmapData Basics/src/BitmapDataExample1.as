/**
 * BitmapDataExample1.as by Lee Burrows
 * Sep 19, 2010
 * Visit blog.leeburrows.com for more stuff
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 **/
package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(backgroundColor="#CCCCCC", frameRate="30", width="200", height="200")]
	public class BitmapDataExample1 extends Sprite
	{
		private var bm:Bitmap;

		public function BitmapDataExample1()
		{
			//do some general housekeeping
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//create a new BitmapData object
			var bmd:BitmapData = new BitmapData(100, 100, false, 0x000000);
			//create bitmap and pass in BitmapData object
			bm = new Bitmap(bmd);
			//add bitmap to stage
			bm.x = 50;
			bm.y = 50;
			addChild(bm);
			//add loop
			addEventListener(Event.ENTER_FRAME, loop);
			//add listener to stage as bitmaps dont dispatch mouse events
			stage.addEventListener(MouseEvent.CLICK, reset);
		}
		
		//run every frame
		private function loop(event:Event):void
		{
			//choose random x and y positions
			var xp:uint = uint(Math.random()*100);
			var yp:uint = uint(Math.random()*100);
			//choose random colour
			var c:uint = uint(Math.random()*0xFFFFFF);
			//set pixel
			bm.bitmapData.setPixel(xp, yp, c);
		}
		
		private function reset(event:MouseEvent):void
		{
			//remove old bitmapData object
			bm.bitmapData.dispose();
			//insert new bitmapData object
			bm.bitmapData = new BitmapData(100, 100, false, 0x000000);
		}
		
	}
}