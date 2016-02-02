Sub IOOF_Format()
'
' IOOF_Format Macro
'

'
Dim sht As Worksheet
Dim LastRow As Long

Set sht = ThisWorkbook.ActiveSheet
LastRow = sht.Cells(sht.Rows.Count, "A").End(xlUp).Row
    
    'Format bad date and number fields.
    
    'Convert AU to UTC date format
    For Each cCell In Range("O2:O" & LastRow)
        Dim auDate As String
        Dim strpos As Integer
        Dim search As String
        search = "/"
        auDate = CStr(cCell.Value)
        If Len(auDate) < 10 Then
            cCell.NumberFormat = "d/m/yyyy;@"  'This is some bullcrap right here...
        Else
            cCell.Value = Right(auDate, 4) & "-" & Mid(auDate, 4, 2) & "-" & Left(auDate, 2)  'Seriously...why do we have different date formats?
            cCell.NumberFormat = "m/d/yyyy"
        End If
    Next cCell
    
    For Each cCell In Range("R2:R" & LastRow)
        auDate = CStr(cCell.Value)
        If Len(auDate) < 10 Then
            cCell.NumberFormat = "d/m/yyyy;@"
        Else
            cCell.Value = Right(auDate, 4) & "-" & Mid(auDate, 4, 2) & "-" & Left(auDate, 2)
            cCell.NumberFormat = "m/d/yyyy"
        End If
    Next cCell

    For Each cCell In Range("AK2:AK" & LastRow)
        auDate = CStr(cCell.Value)
        If Len(auDate) < 10 Then
            cCell.NumberFormat = "d/m/yyyy;@"
        Else
            cCell.Value = Right(auDate, 4) & "-" & Mid(auDate, 4, 2) & "-" & Left(auDate, 2)
            cCell.NumberFormat = "m/d/yyyy"
        End If
    Next cCell
    
    For Each cCell In Range("BN2:BN" & LastRow)
        auDate = CStr(cCell.Value)
        If Len(auDate) < 10 Then
            cCell.NumberFormat = "d/m/yyyy;@"
        Else
            cCell.Value = Right(auDate, 4) & "-" & Mid(auDate, 4, 2) & "-" & Left(auDate, 2)
            cCell.NumberFormat = "m/d/yyyy"
        End If
    Next cCell
    
    'Concatent Address Fields
    For Each cCell In Range("H2:H" & LastRow)
    'concatenate
    cCell.Value = cCell.Value + " " + cCell.Offset(0, 1) + " " + cCell.Offset(0, 2)
    Next cCell
    
    'Add necessary salesforce fields
    Range("BX1").Value = "RecordTypeId"
    Range("BX2:BX" & LastRow).Value = "012900000019VI1"
    Range("BY1").Value = "IsMember"
    Range("BY2:BY" & LastRow).Value = "TRUE"
    Range("BZ1").Value = "IsActive"
    Range("BZ2:BZ" & LastRow).Value = "TRUE"

    MsgBox "Finished!"
End Sub

