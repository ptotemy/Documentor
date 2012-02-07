//////////////////////////////////////////////////////////////
// SVG-VML mini graphic library 
// =================================================
// written by Gerard Ferrandez -=[ge1doot]=-
// initial version - June 28, 2006
// updated - May 1st, 2009 - IE8 standard mode VML support
// www.dhteumeuleu.com
// use under CC-BY-NC license
//////////////////////////////////////////////////////////////

var __SVG = false;
var __svgNS = false;
if (document.createElementNS) {
	__svgNS = "http://www.w3.org/2000/svg";
	__svg = document.createElementNS(__svgNS, "svg");
	__SVG = (__svg.x != null);
}

if (__SVG) {
	/* ============= SVG ============== */
	vectorGraphics = function(o, antialias) {
		this.canvas = document.createElementNS(__svgNS, "svg");
		this.canvas.style.position = "absolute";
		o.appendChild(this.canvas);
		this.createLine = function(w, col, linecap) {
			var o = document.createElementNS(__svgNS, "line");
			o.setAttribute("shape-rendering", antialias?"auto":"optimizeSpeed");
			o.setAttribute("stroke-width", Math.round(w)+"px");
			if (col) o.setAttribute("stroke", col);
			if (linecap) o.setAttribute("stroke-linecap", linecap);
			o.move = function(x1, y1, x2, y2) {
				this.setAttribute("x1", Math.round(x1) + .5);
				this.setAttribute("y1", Math.round(y1));
				this.setAttribute("x2", Math.round(x2));
				this.setAttribute("y2", Math.round(y2));
			}
			o.color = function(c){ this.setAttribute("stroke", c); }
			o.RGBcolor = function(R, G, B){ this.setAttribute("stroke", "rgb("+Math.round(R)+","+Math.round(G)+","+Math.round(B)+")"); }
			o.stroke_weight = function(s){ this.setAttribute("stroke-width", Math.round(s)+"px"); }
			this.canvas.appendChild(o);
			return o;
		}
		this.createPolyline = function(w, points, col, fill) {
			var o = document.createElementNS(__svgNS, "polyline");
			o.setAttribute("shape-rendering", antialias?"auto":"optimizeSpeed");
			o.setAttribute("stroke-width", Math.round(w));
			if (col) o.setAttribute("stroke", col);
			o.setAttribute("fill", fill?fill:"none");
			if (points) o.setAttribute("points", points);
			o.move = function(points) {
				this.setAttribute("points", points);
			}
			this.canvas.appendChild(o);
			return o;
		}
		this.createOval = function(diam, filled) {
			var o = document.createElementNS(__svgNS, "circle");
			o.setAttribute("shape-rendering", antialias?"auto":"optimizeSpeed");
			o.setAttribute("stroke-width", 0);
			o.setAttribute("r", Math.round(diam / 2));
			o.style.cursor = "pointer";
			o.move = function(x1, y1, radius) {
				this.setAttribute("cx", Math.round(x1));
				this.setAttribute("cy", Math.round(y1));
				this.setAttribute("r", Math.round(radius));
			}
			o.stroke_color = function(col) { this.setAttribute("stroke", col); }
			o.fill_color = function(col) { this.setAttribute("fill", col); }
			o.stroke_weight = function(sw) { this.setAttribute("stroke-width", sw); }
			this.canvas.appendChild(o);
			return o;
		}
	}
	
} else if (document.createStyleSheet) {
	/* ============= VML ============== */
	vectorGraphics = function(o, antialias) {
		document.namespaces.add("v", "urn:schemas-microsoft-com:vml");
		var style = document.createStyleSheet();
		var VMLel = ['line','stroke','polyline','fill','oval'];
		for (var i=0,l=VMLel.length;i<l;i++) {
			style.addRule('v\\:'+VMLel[i], "behavior: url(#default#VML);");
			style.addRule('v\\:'+VMLel[i], "antialias: "+antialias+";");
		}
		this.canvas = o;
		this.createLine = function(w, col, linecap) {
			var o = document.createElement("v:line");
			o.strokeweight = Math.round(w)+"px";
			if (col) o.strokecolor = col;
			o.move = function(x1, y1, x2, y2) {
				this.to   = (Math.round(x1) + .5) + "," + Math.round(y1);
				this.from = Math.round(x2) + "," + Math.round(y2);
			}
			o.color = function(c){ this.strokecolor = c; }
			o.RGBcolor = function(R, G, B){ this.strokecolor = "rgb("+Math.round(R)+","+Math.round(G)+","+Math.round(B)+")"; }
			o.stroke_weight = function(s){ this.strokeweight = Math.round(s)+"px"; }
			if (linecap) {
				s = document.createElement("v:stroke");
				s.endcap = linecap;
				o.appendChild(s);
			}
			this.canvas.appendChild(o);
			return o;
		}
		this.createPolyline = function(w, points, col, fill) {
			var o = document.createElement("v:polyline");
			o.strokeweight = Math.round(w)+"px";
			if (col) o.strokecolor = col;
			o.points = points;
			if (fill) o.fillcolor = fill;
			else {
				s = document.createElement("v:fill");
				s.on = "false";
				o.appendChild(s);
			}
			o.move = function(points) {
				this.points.value = points;
			}
			this.canvas.appendChild(o);
			return o;
		}
		this.createOval = function(diam, filled) {
			var o = document.createElement("v:oval");
			var os = o.style;
			os.position = "absolute";
			os.cursor = "pointer";
			o.strokeweight = 1;
			o.filled = filled;
			os.width = Math.round(diam) + "px";
			os.height = Math.round(diam) + "px";
			o.move = function(x1, y1, radius) {
				os.left   = Math.round(x1 - radius) + "px";
				os.top    = Math.round(y1 - radius) + "px";
				os.width  = Math.round(radius * 2) + "px";
				os.height = Math.round(radius * 2) + "px";
			}
			o.stroke_color = function(col) { this.strokecolor = col; }
			o.fill_color = function(col) { this.fillcolor = col; }
			o.stroke_weight = function(sw) { this.strokeweight = sw; }
			this.canvas.appendChild(o);
			return o;
		}
	}
} else {
	/* ==== no script ==== */
	vectorGraphics = function(o, i) {
		return false;
	}
}