﻿#Область ПрограммныйИнтерфейс

Функция ТекущийПользователь() Экспорт
	
	Значение = Неопределено;
	
	Попытка
		Значение = ПараметрыСеанса.Сотрудник;
	Исключение
	КонецПопытки;
	
	Возврат Значение;
	
КонецФункции

#КонецОбласти

