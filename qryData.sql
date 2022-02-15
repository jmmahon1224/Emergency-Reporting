SELECT Incidents.IncidentID
, Incidents.FDID
, DateSerial(Left([Incidents]![IncidentDate],4),Mid([Incidents]![IncidentDate],5,2),Right([Incidents]![IncidentDate],2)) AS Expr1
, Incidents.IncidentDate
, Incidents.IncidentTime
, Incidents.Station
, Incidents.IncidentNumber
, Incidents.Address
, Incidents.IncidentType
, Incidents.DispatchID
, Basic.ShiftsOrPlatoon
, (SELECT UserDefinedFieldsAnswers.Answer FROM UserDefinedFieldsAnswers WHERE UserDefinedFieldsAnswers.IID = Incidents.IncidentID AND UserDefinedFieldsAnswers.UserDefinedFieldID = 15037) AS 90Due
, (SELECT UserDefinedFieldsAnswers.Answer FROM UserDefinedFieldsAnswers WHERE UserDefinedFieldsAnswers.IID = Incidents.IncidentID AND UserDefinedFieldsAnswers.UserDefinedFieldID = 15459) AS 91Due
, (SELECT UserDefinedFieldsAnswers.Answer FROM UserDefinedFieldsAnswers WHERE UserDefinedFieldsAnswers.IID = Incidents.IncidentID AND UserDefinedFieldsAnswers.UserDefinedFieldID = 15460) AS 92Due
, (SELECT UserDefinedFieldsAnswers.Answer FROM UserDefinedFieldsAnswers WHERE UserDefinedFieldsAnswers.IID = Incidents.IncidentID AND UserDefinedFieldsAnswers.UserDefinedFieldID = 15461) AS ChiefPage
, (SELECT UserDefinedFieldsAnswers.Answer FROM UserDefinedFieldsAnswers WHERE UserDefinedFieldsAnswers.IID = Incidents.IncidentID AND UserDefinedFieldsAnswers.UserDefinedFieldID = 15462) AS DispatchType
, UserDefinedFieldsAnswers.UserDefinedFieldId
, UserDefinedFieldsAnswers.Answer
FROM (((Exposures INNER JOIN Incidents ON Exposures.IID = Incidents.IncidentID) 
	INNER JOIN Basic ON Exposures.ExposureID = Basic.EID) 
	INNER JOIN UserDefinedFieldsAnswers ON (Incidents.IncidentID = UserDefinedFieldsAnswers.IID) AND (Incidents.AID = UserDefinedFieldsAnswers.AID)) 	
WHERE DateSerial(Left([Incidents]![IncidentDate],4),Mid([Incidents]![IncidentDate],5,2),Right([Incidents]![IncidentDate],2)))>#12/31/2019# 
	AND Basic.ShiftsOrPlatoon Is Not Null 
	AND Basic.ShiftsOrPlatoon <> " " 
	AND UserDefinedFieldsAnswers.UserDefinedFieldId = 15462 --UserDefinedFields question What is the box type, Local, Tactical, Box, Rescue, Hazmat etc
