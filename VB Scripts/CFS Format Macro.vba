Sub CFS_Import_Macro()
'
' CFS_Format Macro
'

'
Dim sht As Worksheet
Dim LastRow As Long

Set sht = ThisWorkbook.ActiveSheet
LastRow = sht.Cells(sht.Rows.Count, "D").End(xlUp).Row
    
    'Delete pending account statuses in column J
    Dim acctStatus As String
    For i = LastRow To 1 Step -1
        If (Cells(i, "J").Value) = "P" Then
            Cells(i, "A").EntireRow.Delete
        End If
    Next i
    
'recount last row
LastRow = sht.Cells(sht.Rows.Count, "D").End(xlUp).Row

    'Format bad date and number fields
    Range("AA2:AA" & LastRow).NumberFormat = "0.00"
    Range("AC2:AC" & LastRow).NumberFormat = "0.00"
    Range("AG2:AR" & LastRow).NumberFormat = "0.00"

    'Fix serialized date fields
    For Each cCell In Range("X2:X" & LastRow)
        Dim theDate As String
        theDate = cCell.Value
        cCell.Value = Left(theDate, 4) & "-" & Mid(theDate, 5, 2) & "-" & Right(theDate, 2)
        cCell.NumberFormat = "m/d/yyyy;@"
    Next cCell
    
    For Each cCell In Range("AD2:AD" & LastRow)
        theDate = cCell.Value
        cCell.Value = Left(theDate, 4) & "-" & Mid(theDate, 5, 2) & "-" & Right(theDate, 2)
        cCell.NumberFormat = "m/d/yyyy;@"
    Next cCell

    For Each cCell In Range("AF2:AF" & LastRow)
        theDate = cCell.Value
        cCell.Value = Left(theDate, 4) & "-" & Mid(theDate, 5, 2) & "-" & Right(theDate, 2)
        cCell.NumberFormat = "m/d/yyyy;@"
    Next cCell

    For Each cCell In Range("AV2:AV" & LastRow)
        theDate = cCell.Value
        cCell.Value = Left(theDate, 4) & "-" & Mid(theDate, 5, 2) & "-" & Right(theDate, 2)
        cCell.NumberFormat = "m/d/yyyy;@"
    Next cCell
    
    
    'Add necessary salesforce fields
    Range("AZ1").Value = "RecordTypeId"
    Range("AZ2:AZ" & LastRow).Value = "012900000019VHz"
    Range("BA1").Value = "IsMember"
    Range("BA2:BA" & LastRow).Value = "TRUE"
    Range("BB1").Value = "IsActive"
    Range("BB2:BB" & LastRow).Value = "TRUE"

    MsgBox "Finished!"
End Sub



