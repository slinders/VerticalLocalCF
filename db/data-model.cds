namespace EPM;

   entity Address { 
	   key NODE_KEY:  Binary(16) not null;
	   CITY:  String(40);
	   POSTAL_CODE:  String(10);
	   STREET:  String(60);
	   BUILDING:  String(10);
	   COUNTRY:  String(3);
	   ADDRESS_TYPE:  String(2);
	   VAL_START_DATE:  Timestamp;
	   VAL_END_DATE:  Timestamp;
	   LATITUDE:  Decimal(15,12);
	   LONGITUDE:  Decimal(15,12); 
}
