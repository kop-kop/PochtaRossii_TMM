﻿
Процедура УстановкаПараметровСеанса(ТребуемыеПараметры)
			
		ПараметрыСеанса.Сотрудник = Справочники.Сотрудники.ПустаяСсылка();
		ПараметрыСеанса.СотрудникУдалён = Ложь;
		
		ПараметрыСеанса.ПутьКэшаКартыOSM = ОбщегоНазначенияВызовСервера.ЗаписатьКэшКартыOSM();				
		
КонецПроцедуры
