﻿
Процедура ПриНачалеРаботыСистемы()
	
	РезультатПроверки = ОбщегоНазначенияВызовСервера.ПрохождениеПроверкиПриНачалеРаботыСистемы();
	Если РезультатПроверки.НовыйСотрудник  Тогда
		
			ОткрытьФорму("ОбщаяФорма.ОкноРегистрацииСотрудника");
			
		ИначеЕсли  РезультатПроверки.СотрудникУдален Тогда
			
			ОткрытьФорму("ОбщаяФорма.ФормаПринудительногоЗавершенияСеанса",Новый Структура("ТекстСообщения","У вас нет доступа к системе"));			
			
	КонецЕсли;
		
КонецПроцедуры

