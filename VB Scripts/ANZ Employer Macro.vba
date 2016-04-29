Sub ANZ_Import_Format()
'
' ANZ Format Macro
'

'
Dim sht As Worksheet
Dim LastRow As Long

Set sht = ThisWorkbook.ActiveSheet
LastRow = sht.Cells(sht.Rows.Count, "D").End(xlUp).Row
    
    'Delete pending account statuses in column J
    Dim acctStatus As String
    For i = LastRow To 2 Step -1
        If (Cells(i, "G").Value) <> "OPEN" Then
            Cells(i, "A").EntireRow.Delete
        End If
    Next i
    
'recount last row
LastRow = sht.Cells(sht.Rows.Count, "A").End(xlUp).Row

    'Format bad date and number fields
    Range("K2:L" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("N2:N" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("AE2:AE" & LastRow).NumberFormat = "m/d/yyyy;@"

    'Concatent Address Fields
    For Each cCell In Range("AM2:AM" & LastRow)
    'concatenate
    cCell.Value = cCell.Value & " " & cCell.Offset(0, 1)
    Next cCell
    
    
    'Add necessary salesforce fields
    Range("AS1").Value = "RecordTypeId"
    Range("AS2:AS" & LastRow).Value = "01290000000ub9N"
    Range("AT1").Value = "IsMember"
    Range("AT2:AT" & LastRow).Value = "TRUE"
    Range("AU1").Value = "IsActive"
    Range("AU2:AU" & LastRow).Value = "TRUE"

    MsgBox "Finished!  Do not press twice."
    


End Sub
