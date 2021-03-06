﻿
&НаКлиенте
Процедура КоординатыПриИзменении(Элемент)
	
	ОбновлениеДанныхНаОсновеКоординат();	
	
КонецПроцедуры

&НаКлиенте
Процедура ОбновлениеДанныхНаОсновеКоординат()
	
	ПересчётРасстояния();
	
КонецПроцедуры

&НаКлиенте
Процедура ПересчётРасстояния()
	
	КоличествоСтрок =  Координаты.Количество();
	
	Если  КоличествоСтрок> 1 Тогда
		
		Координаты[0].Расстояние = 0;
		
		Для Сч=1 По КоличествоСтрок-1 Цикл
			
			Стр =  Координаты[Сч-1];
			ПрежняяШирота =Стр.Широта;
			ПрежняяДолгота =Стр.Долгота;
			
			Стр =  Координаты[Сч];
			НоваяШирота =  Стр.Широта;
			НоваяДолгота = Стр.Долгота;
			Стр.Расстояние = РасстояниеПоКоординатам(ПрежняяШирота,ПрежняяДолгота,НоваяШирота,НоваяДолгота);
			
		КонецЦикла;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Функция РасстояниеПоКоординатам(StartLat, StartLong, EndLat, EndLong)
    // Передаваемые широта/долгота в градусах и сотых долях
    //StartLat: double; // Начальная широта
    //StartLong: double; // Начальная долгота
    //EndLat: double; // Конечная широта
    //EndLong: double; // Конечная долгота

    //// Переменные, используемые для вычисления смещения и расстояния
    //fPhimean: Double; // Средняя широта
    //fdLambda: Double; // Разница между двумя значениями долготы
    //fdPhi: Double; // Разница между двумя значениями широты
    //fAlpha: Double; // Смещение
    //fRho: Double; // Меридианский радиус кривизны
    //fNu: Double; // Поперечный радиус кривизны
    //fR: Double; // Радиус сферы Земли
    //fz: Double; // Угловое расстояние от центра сфероида
    //fTemp: Double; // Временная переменная, использующаяся в вычислениях
    //Distance: Double; // Вычисленное расстояния в метрах
    //Bearing: Double; // Вычисленное от и до смещение


    // Константы, используемые для вычисления смещения и расстояния
    D2R = 0.017453; // Константа для преобразования градусов в радианы
    R2D = 57.295781; // Константа для преобразования радиан в градусы
    a = 6378137.0; // Основные полуоси
    b = 6356752.314245; // Неосновные полуоси
    e2 = 0.006739496742337; // Квадрат эксцентричности эллипсоида
    f = 0.003352810664747; // Выравнивание эллипсоида

    fdLambda = (StartLong - EndLong) * D2R;
    fdPhi = (StartLat - EndLat) * D2R;
    fPhimean = ((StartLat + EndLat) / 2.0) * D2R;

    // Вычисляем меридианные и поперечные радиусы кривизны средней широты
    fTemp = 1 - e2 * (Pow(Sin(fPhimean), 2));
    fRho = (a * (1 - e2)) / Pow(fTemp, 1.5);
    fNu = a / (Sqrt(1 - e2 * (Sin(fPhimean) * Sin(fPhimean))));

    // Вычисляем угловое расстояние
    fz = Sqrt(Pow(Sin(fdPhi / 2.0), 2) + Cos(EndLat * D2R) * Cos(StartLat * D2R) * Pow(Sin(fdLambda / 2.0), 2));

    fz = 2 * ASin(fz);

    // Вычисляем смещение
    fAlpha = Cos(EndLat * D2R) * Sin(fdLambda) * 1 / Sin(fz);
    fAlpha = ASin(fAlpha);

    // Вычисляем радиус Земли
    fR = (fRho * fNu) / ((fRho * Pow(Sin(fAlpha), 2)) + (fNu * Pow(Cos(fAlpha), 2)));

    // Получаем смещение и расстояние
    Distance = (fz * fR);

    Возврат Distance/1000;

КонецФункции

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	//заполним некоторые значения по умолчанию
	нов = Координаты.Добавить();
	нов.Долгота = 44.129723;
	нов.Широта = 43.069055;
	нов.Представление = "Лес";
	нов.Цвет = "darkGreen";
	
	нов = Координаты.Добавить();
	нов.Долгота = 44.123421; 
	нов.Широта = 43.060582;
	нов.Представление = "Снова лес";
	нов.Цвет = "green";

	нов = Координаты.Добавить();
	нов.Долгота = 44.124644; 
	нов.Широта = 43.026650;
	нов.Представление = "Лес...";
	нов.Цвет = "olive";
		
	ОбновлениеДанныхНаОсновеКоординат();
		
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// ГОТОВИМ HTML для вывода
	ЧтениеHTML = Новый ЧтениеHTML;
	ЧтениеHTML.ОткрытьФайл(ПараметрыСеанса.ПутьКэшаКартыOSM, "UTF-8");
	ПостроительDOM = Новый ПостроительDOM;
	ДокументHTML = ПостроительDOM.Прочитать(ЧтениеHTML);
	ЧтениеHTML.Закрыть();
	
	ЗапиcьHTML = Новый ЗаписьHTML;
	ЗапиcьHTML.УстановитьСтроку();
	ЗаписьDOM = Новый ЗаписьDOM;
	ЗаписьDOM.Записать(ДокументHTML, ЗапиcьHTML);
	ТекстHTML = ЗапиcьHTML.Закрыть();

КонецПроцедуры


