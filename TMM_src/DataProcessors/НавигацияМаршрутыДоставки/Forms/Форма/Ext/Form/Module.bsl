﻿


&НаКлиенте
Процедура ДоставкаОтправленийПолучателям(Команда)
	
	ОткрытьФорму("ОбщаяФорма.ФормаПроверкиКарты");
	//Сообщить("Позволяет стартануть геолокацию и отслеживание трека перемещения");	
	
КонецПроцедуры

&НаКлиенте
Процедура НарисоватьМаршрутДоставки(Команда)
	
	ОткрытьФорму("Справочник.МаршрутыДоставки.ФормаОбъекта");
	//Сообщить("Позволяет самостоятельно нарисовать маршрут доставки. Полезно для случаев, когда отслеживание трека перемещения недоступно из-за плохого сигнала GPS или сотовой сети");
	
КонецПроцедуры

&НаКлиенте
Процедура ВнестиИзмененияВПрошлыеМаршрутыДоставки(Команда)
	
	ОткрытьФорму("Справочник.МаршрутыДоставки.ФормаСписка");
	Сообщить("Забыли внести какую-то информацию по маршруту? Хотите прикрепить фото/видео или нужно что-то исправить? Тогда добро пожаловать в этот раздел");
	
КонецПроцедуры

&НаКлиенте
Процедура ОтчётыПоДоставке(Команда)
	
	ОткрытьФорму("Обработка.СписокОтчётовПоДоставке.Форма");
	//Сообщить("Покажет разные отчётики, например статистику доставки отправлений по маршрутам, пройденный километраж, какие места с какой частотой посещались");
	
КонецПроцедуры

&НаКлиенте
Процедура Декорация1Нажатие(Элемент)
	
	ОткрытьФорму("ОбщаяФорма.ФормаПроверкиКарты");
	
КонецПроцедуры

&НаКлиенте
Процедура Декорация2Нажатие(Элемент)
	
	ОткрытьФорму("Справочник.МаршрутыДоставки.ФормаСписка");
	
КонецПроцедуры

&НаКлиенте
Процедура Декорация3Нажатие(Элемент)
	
	ОткрытьФорму("Справочник.МаршрутыДоставки.ФормаОбъекта");
	
КонецПроцедуры

&НаКлиенте
Процедура Декорация4Нажатие(Элемент)
	
	ОткрытьФорму("Обработка.СписокОтчётовПоДоставке.Форма");
	
КонецПроцедуры


