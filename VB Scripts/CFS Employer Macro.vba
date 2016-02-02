Sub CFS_Employer_Macro()
'
' CFS Employer Macro
'

'
Dim sht As Worksheet
Dim LastRow As Long

Set sht = ThisWorkbook.ActiveSheet
LastRow = sht.Cells(sht.Rows.Count, "D").End(xlUp).Row
    
    'Delete pending account statuses in column J
    Dim acctStatus As String
    For i = LastRow To 1 Step -1
        If (Cells(i, "B").Value) = "Pending" Then
            Cells(i, "A").EntireRow.Delete
        End If
    Next i
    
'recount last row
LastRow = sht.Cells(sht.Rows.Count, "A").End(xlUp).Row

    'Format bad date and number fields
    Range("F2:F" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("AZ2:AZ" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("BI2:BI" & LastRow).NumberFormat = "m/d/yyyy;@"

    'Concatent Address Fields
    For Each cCell In Range("BA2:BA" & LastRow)
    'concatenate
    cCell.Value = cCell.Value + " " + cCell.Offset(0, 1)
    Next cCell
    
    
    'Add necessary salesforce fields
    Range("BJ1").Value = "RecordTypeId"
    Range("BJ2:BJ" & LastRow).Value = "012900000019VHz"
    Range("BK1").Value = "IsMember"
    Range("BK2:BK" & LastRow).Value = "TRUE"
    Range("BL1").Value = "IsActive"
    Range("BL2:BL" & LastRow).Value = "TRUE"

    MsgBox "Finished!  Do not press twice."
    
End Sub

