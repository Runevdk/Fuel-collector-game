int lichtsensor = 2;
int licht = 0;
void setup() {
  // put your setup code here, to run once:
pinMode(2, INPUT);
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
licht = digitalRead(lichtsensor);
Serial.print(String(licht));
delay(100);
}
