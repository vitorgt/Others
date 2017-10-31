int hum;

void setup(){
	Serial.begin(9600);
	pinMode(8, OUTPUT);
}

void loop(){
	hum = analogRead(A0);
	int Porcento = map(hum, 1023, 0, 0, 100);

	Serial.print(Porcento);
	Serial.print("%\n");

	if(Porcento <= 60){
		Serial.print("Irrigando...\n");
		digitalWrite(8, LOW);
		delay(1000);
	}
	else{
		digitalWrite(8, HIGH);
		delay(60000);
	}
}
