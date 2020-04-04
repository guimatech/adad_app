object ConnectionProvider: TConnectionProvider
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 238
  Width = 328
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Lucas\Projetos\Delphi\Android\ADADApp\ADADApp\' +
        'db\ADADApp.sdb'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnectionBeforeConnect
    Left = 40
    Top = 24
  end
  object qryEvent: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      #9'id,'
      #9'description,'
      #9'date,'
      #9'STRFTIME('#39'%d'#39', date) as day,'
      #9'CASE'
      #9#9'WHEN CAST(STRFTIME('#39'%w'#39', date) AS INT) = 0 THEN '#39'Domingo'#39
      
        #9#9'WHEN CAST(STRFTIME('#39'%w'#39', date) AS INT) = 1 THEN '#39'Segunda-feira' +
        #39
      #9#9'WHEN CAST(STRFTIME('#39'%w'#39', date) AS INT) = 2 THEN '#39'Ter'#231'a-feira'#39
      #9#9'WHEN CAST(STRFTIME('#39'%w'#39', date) AS INT) = 3 THEN '#39'Quarta-feira'#39
      #9#9'WHEN CAST(STRFTIME('#39'%w'#39', date) AS INT) = 4 THEN '#39'Quinta-feira'#39
      #9#9'WHEN CAST(STRFTIME('#39'%w'#39', date) AS INT) = 5 THEN '#39'Sexta-feira'#39
      #9#9'WHEN CAST(STRFTIME('#39'%w'#39', date) AS INT) = 6 THEN '#39'S'#225'bado'#39
      #9#9'ELSE '#39#39
      #9'END as dayOfWeek,'
      #9'CASE'
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 1 THEN '#39'Janeiro'#39
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 2 THEN '#39'Fevereiro'#39
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 3 THEN '#39'Mar'#231'o'#39
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 4 THEN '#39'Abril'#39
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 5 THEN '#39'Maio'#39
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 6 THEN '#39'Junho'#39
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 7 THEN '#39'Julho'#39
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 8 THEN '#39'Agosto'#39
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 9 THEN '#39'Setembro'#39
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 10 THEN '#39'Outubro'#39
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 11 THEN '#39'Novembro'#39
      #9#9'WHEN CAST(STRFTIME('#39'%m'#39', date) AS INT) = 12 THEN '#39'Dezembro'#39
      #9#9'ELSE '#39#39
      #9'END || '#39' de '#39' || STRFTIME('#39'%Y'#39', date) as monthOfyear'
      'FROM'
      #9'event'
      'WHERE'
      #9'date > CURRENT_DATE'
      'ORDER BY'
      #9'date')
    Left = 40
    Top = 80
    object qryEventid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object qryEventdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 255
    end
    object qryEventdate: TDateField
      FieldName = 'date'
      Origin = 'date'
    end
    object qryEventday: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'day'
      Origin = 'day'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryEventdayOfWeek: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dayOfWeek'
      Origin = 'dayOfWeek'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryEventmonthOfyear: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'monthOfyear'
      Origin = 'monthOfyear'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object link: TFDPhysSQLiteDriverLink
    Left = 104
    Top = 24
  end
  object cursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 152
    Top = 24
  end
end
