VBA_HOSTPROJECT,BEGIN,ThisProject
	Dim p(20) As String  ' ���ᨢ � ������� ������奬
	Dim b(20) As String  ' ���ᨢ � ��⪠��
	Public id As Integer ' 㪠��⥫� �� ⥪�騩 �����
	Public FlagPrevOpen As Integer ' ��⠭����� �� ����⨨ �।���饣� ����
	
	Public Sub ShiftArray()
	Rem �� ��९������� ���� ᤢ����� ��ᨢ (������ >20 �������)
	    Dim k As Integer
	    For k = 1 To 19
	        p(k) = p(k + 1)
	        b(k) = b(k + 1)
	    Next k
	    id = 20
	End Sub
	
	Public Sub NameBranchSave(Mim As String, Optional Brn As String = "")
	Rem �� ����⨨ ������奬� ��࠭塞 �� �������� � ����
	
	    If (FlagPrevOpen = 0) Then
	        id = id + 1
	        If id >= 21 Then ThisProject.ShiftArray
	               
	        p(id) = Mim
	        b(id) = Brn
	    End If
	    
	End Sub
	
	Public Sub PrevOpen()
	Rem ���뢠�� �।������ ������奬�
	    If (id > 1) Then
	        id = id - 1
	        
	        If (p(id) = "" Or id > 20) Then
	        ' ��ࠡ�⪠ �訡�� �᫨ ��� ����� ������奬�
	            id = 0 ' ��᫥ ������ �⠭�� 1
	            Mimics.Open "404", ""
	        Else
	        ' ��ଠ�쭮� ����⨥
	            Mimics.Close ' ��뢠���� ����뢠��
	            FlagPrevOpen = 1
	            Mimics.Open p(id), b(id)
	            FlagPrevOpen = 0
	        End If
	 
	    End If
	    ' Else id<=1 ��⠢�塞 ⥪����
	    
	End Sub
	
	'Private Sub fvProject_StartupComplete()
	 Rem ������塞 ��砫�� ����� ������樨 � 㪠�뢠�� �� ����
	    
	    'id = 0
	    'FlagPrevOpen = 0
	' �㭪�� �� ���室�� �.�. ��뢠���� ��᫥ ������ ��ࢮ� ������奬�
	' ��⠥� �� ���६���� =0 �� ����
	'End Sub
	
	
	
	
	
VBA_HOSTPROJECT,END
