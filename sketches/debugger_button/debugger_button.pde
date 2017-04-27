boolean status1 = TRUE;
boolean status2 = FALSE;
boolean mouseON = FALSE;
mouseover = FALSE;
int[] button1 = { 50, 50, 100, 100 }; // Declare, create, assign // x, y, w, h

void setup() {
  size(900, 600);
  smooth();
  frameRate(30);
  background(255);
}

void draw() {
	if (status1) {
		background(255);
		draw_button(button1);
		check_mouseover(button1);
		if (mouseover) {
			mouseClicked();
			if (mouseON) {
				status1 = FALSE;
				status2 = TRUE;
				mouseON = FALSE;
			}			
		}
	}
	
	if (status2) {
		background(0);		
	}
}

void check_mouseover(int[] button_info) {
	for (int i = 0, i < 4, i++) {
		print(button_info[i])
	}
	if ( mouseX > button_info[0] &&
		mouseX < (button_info[0] + button_info[2] &&
		mouseY > button_info[1] &&
		mouseY < button_info[1] + button_info[3]
		) {
			mouseover = TRUE;
	}
}

void draw_button(int[] button_info) {
	fill();
	stroke();
	rect(button_info[0], button_info[1], button_info[2], button_info[3]);	
}

void mouseClicked() {
	mouseON = TRUE;	
}