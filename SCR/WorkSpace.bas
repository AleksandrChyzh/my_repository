VBA_HOSTPROJECT,BEGIN,ThisProject
	Dim p(20) As String  ' массив с именами мнемосхем
	Dim b(20) As String  ' массив с ветками
	Public id As Integer ' указатель на текущий элемент
	Public FlagPrevOpen As Integer ' установлен при открытии предидущего окна
	
	Public Sub ShiftArray()
	Rem при переполнении буфера сдвигаем масив (элементы >20 теряются)
	    Dim k As Integer
	    For k = 1 To 19
	        p(k) = p(k + 1)
	        b(k) = b(k + 1)
	    Next k
	    id = 20
	End Sub
	
	Public Sub NameBranchSave(Mim As String, Optional Brn As String = "")
	Rem при открытии мнемосхемы сохраняем её название и ветвь
	
	    If (FlagPrevOpen = 0) Then
	        id = id + 1
	        If id >= 21 Then ThisProject.ShiftArray
	               
	        p(id) = Mim
	        b(id) = Brn
	    End If
	    
	End Sub
	
	Public Sub PrevOpen()
	Rem Открываем предидущую мнемосхему
	    If (id > 1) Then
	        id = id - 1
	        
	        If (p(id) = "" Or id > 20) Then
	        ' Обработка ошибки если нет имени мнемосхемы
	            id = 0 ' после открытия станет 1
	            Mimics.Open "404", ""
	        Else
	        ' нормальное открытие
	            Mimics.Close ' вызывающую закрываем
	            FlagPrevOpen = 1
	            Mimics.Open p(id), b(id)
	            FlagPrevOpen = 0
	        End If
	 
	    End If
	    ' Else id<=1 оставляем текущую
	    
	End Sub
	
	'Private Sub fvProject_StartupComplete()
	 Rem Заполняем начальный элемент навигации и указываем на него
	    
	    'id = 0
	    'FlagPrevOpen = 0
	' Функция не подходит т.к. вызывается после открытия первой мнемосхемы
	' Считаем что петременные =0 при старте
	'End Sub
	
	
	
	
	
VBA_HOSTPROJECT,END
