int analogValue = 0;  
int avgSensorOne = 0;
int avgSensorTwo = 0;
int avgSensorThree = 0;
int avgSensorFour = 0;
int avgSensorFive = 0;
int avgSensorSix = 0;

void setup(){
  // initialize serial commuincations at 9600 bps:
  Serial.begin(9600);
  establishContact();
}

void loop(){
  if(Serial.available() > 0) {
    int inByte = Serial.read();
    // compute average of twenty readings to produce a smoother flow of data
    for(int i=0; i<20; i++){
      // read in the sensor values
      int analogValue = analogRead(A0)/4;  
      avgSensorOne += analogValue;
      analogValue = analogRead(A1)/4;
      avgSensorTwo += analogValue;
      analogValue = analogRead(A2)/4;
      avgSensorThree += analogValue;
      analogValue = analogRead(A3)/4;
      avgSensorFour += analogValue;
      analogValue = analogRead(A4)/4;
      avgSensorFive += analogValue;
      analogValue = analogRead(A5)/4;
      avgSensorSix += analogValue;
    }

    Serial.print(avgSensorOne/20);
    Serial.print(",");
    delay(1);
    Serial.print(avgSensorTwo/20);
    Serial.print(",");
    delay(1);
    Serial.print(avgSensorThree/20);
    Serial.print(",");
    delay(1);
    Serial.print(avgSensorFour/20);
    Serial.print(",");
    delay(1);
    Serial.print(avgSensorFive/20);
    Serial.print(",");
    delay(1);
    Serial.println(avgSensorSix/20);
    delay(1);
    avgSensorOne = 0;
    avgSensorTwo = 0;
    avgSensorThree = 0;
    avgSensorFour = 0;
    avgSensorFive = 0;
    avgSensorSix = 0;
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("hello");  // send a starting message
    delay(300);
  }
}



