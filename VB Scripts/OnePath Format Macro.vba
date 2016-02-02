Sub OnePath_Format_Macro()
'
' OnePath_Format Macro
'

'
Dim sht As Worksheet
Dim LastRow As Long
Dim LastCol As Long

Set sht = ThisWorkbook.ActiveSheet
LastRow = sht.Cells(sht.Rows.Count, "A").End(xlUp).Row
    
    'Format bad date and number fields.
    'Range("E2:E" & LastRow).NumberFormat = "d/m/yyyy;@"
    'Range("AC2:AC" & LastRow).NumberFormat = "d/m/yyyy;@"
    Range("AD2:AF" & LastRow).NumberFormat = "0.00"
    
    'Convert AU to UTC date format
    For Each cCell In Range("E2:E" & LastRow)
        Dim auDate As String
        auDate = CStr(cCell.Value)
        cCell.Value = Right(auDate, 4) & "-" & Mid(auDate, 4, 2) & "-" & Left(auDate, 2)
        cCell.NumberFormat = "m/d/yyyy;@"
    Next cCell
    
    For Each cCell In Range("AC2:AC" & LastRow)
        auDate = CStr(cCell.Value)
        cCell.Value = Mid(auDate, 4, 2) & "/" & Left(auDate, 2) & "/" & Right(auDate, 4)
        cCell.NumberFormat = "m/d/yyyy;@"
    Next cCell
    
    'Concatent Address Fields
    For Each cCell In Range("F2:F" & LastRow)
    'concatenate
    cCell.Value = cCell.Value + " " + cCell.Offset(0, 1)
    Next cCell
    
    'Add necessary salesforce fields
    Range("AG1").Value = "RecordTypeId"
    Range("AG2:AG" & LastRow).Value = "012900000019VI3"
    Range("AH1").Value = "IsMember"
    Range("AH2:AH" & LastRow).Value = "TRUE"
    Range("AI1").Value = "IsActive"
    Range("AI2:AI" & LastRow).Value = "TRUE"

    MsgBox "Finished! Do not press again."
End Sub



