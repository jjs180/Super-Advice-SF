Sub CFS_Personal_Macro()

'
' CFS Personal Macro
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
    Range("AL2:AL" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("AC2:AC" & LastRow).NumberFormat = "m/d/yyyy;@"
    
    Range("J2:S" & LastRow).NumberFormat = "0.00"
    Range("AK2:AK" & LastRow).NumberFormat = "0.00"

    'Concatent Address Fields
    For Each cCell In Range("AD2:AD" & LastRow)
    'concatenate
    cCell.Value = cCell.Value + " " + cCell.Offset(0, 1)
    Next cCell
    
    'Remove bad text fields from binding death nomination expiration
    For Each cCell In Range("AC2:AC" & LastRow)
    'perform action if cell value is bad
    If cCell.Value = "N/A" Then
        'change the cell value to ""
        cCell.Value = ""
    End If
    Next cCell
    
    'Add necessary salesforce fields
    Range("AM1").Value = "RecordTypeId"
    Range("AM2:AM" & LastRow).Value = "012900000019VHz"
    Range("AN1").Value = "IsMember"
    Range("AN2:AN" & LastRow).Value = "TRUE"
    Range("AO1").Value = "IsActive"
    Range("AO2:AO" & LastRow).Value = "TRUE"
    Range("AP1").Value = "Employer_Number__c" 'Employer number for Ex-Member Account
    Range("AP2:AP" & LastRow).Value = "73032100"

    MsgBox "Finished!  Do not press twice."
    


End Sub
