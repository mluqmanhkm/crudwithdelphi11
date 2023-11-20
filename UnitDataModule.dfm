object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object ZQueryPerangkat: TZQuery
    Connection = ZConnection1
    SortedFields = 'id_aktivasi'
    SortType = stDescending
    SQL.Strings = (
      
        'SELECT aktivasi.id_aktivasi, perangkat.nama_perangkat, perangkat' +
        '.tanggal, perangkat.jenis, status.status, lokasi.nama_tempat, lo' +
        'kasi.koordinat, lokasi.alamat, desa.desa, '
      'kecamatan.kecamatan FROM aktivasi'
      
        'INNER JOIN perangkat ON aktivasi.id_perangkat = perangkat.id_per' +
        'angkat'
      'INNER JOIN status ON perangkat.id_status=status.id_status '
      'INNER JOIN lokasi ON perangkat.id_lokasi=lokasi.id_lokasi '
      'INNER JOIN desa ON lokasi.id_desa=desa.id_desa '
      
        'INNER JOIN kecamatan ON lokasi.id_kecamatan=kecamatan.id_kecamat' +
        'an')
    Params = <>
    Properties.Strings = (
      
        'SELECT aktivasi.id_aktivasi, perangkat.id_perangkat, perangkat.n' +
        'ama_perangkat, perangkat.tanggal, status.status, lokasi2.nama_te' +
        'mpat, lokasi2.koordinat, lokasi2.alamat, desa.desa, kecamatan.ke' +
        'camatan FROM aktivasi INNER JOIN perangkat ON aktivasi.id_perang' +
        'kat = perangkat.id_perangkat INNER JOIN status ON perangkat.id_s' +
        'tatus=status.id_status INNER JOIN lokasi ON perangkat.id_lokasi=' +
        'lokasi.id_lokasi INNER JOIN desa ON lokasi2.id_desa=desa.id_desa' +
        ' INNER JOIN kecamatan ON lokasi2.id_kecamatan=kecamatan.id_kecam' +
        'atan')
    IndexFieldNames = 'id_aktivasi Desc'
    Left = 56
    Top = 88
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = 'LocalHost'
    Port = 3306
    Database = 'sirinetsunami'
    User = 'root'
    Password = ''
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Users\User\Documents\Embarcadero\Studio\Projects\sirinetsunam' +
      'i\libmysql.dll'
    Left = 16
    Top = 24
  end
  object DataSourcePerangkat: TDataSource
    DataSet = ZQueryPerangkat
    Left = 16
    Top = 88
  end
  object DataSourcePenanganan: TDataSource
    DataSet = ZQueryPenanganan
    Left = 16
    Top = 200
  end
  object ZQueryPenanganan: TZQuery
    Connection = ZConnection1
    SortedFields = 'id_penanganan'
    SortType = stDescending
    SQL.Strings = (
      'SELECT * FROM penanganan')
    Params = <>
    Properties.Strings = (
      
        'SELECT perangkat.id_perangkat, perangkat.nama_perangkat, perangk' +
        'at.tanggal, status.status, perangkat.id_lokasi FROM perangkat IN' +
        'NER JOIN status ON perangkat.id_status=status.id_status ORDER BY' +
        ' perangkat.id_status')
    IndexFieldNames = 'id_penanganan Desc'
    Left = 59
    Top = 200
    object ZQueryPenangananid_penanganan: TIntegerField
      FieldName = 'id_penanganan'
    end
    object ZQueryPenanganannama_perangkat: TWideStringField
      FieldName = 'nama_perangkat'
    end
    object ZQueryPenanganantanggal_kerusakan: TDateTimeField
      FieldName = 'tanggal_kerusakan'
    end
    object ZQueryPenanganankerusakan: TWideMemoField
      FieldName = 'kerusakan'
      OnGetText = ZQueryPenanganankerusakanGetText
      BlobType = ftWideMemo
    end
    object ZQueryPenanganantanggal_penanganan: TDateTimeField
      FieldName = 'tanggal_penanganan'
    end
    object ZQueryPenangananteknisi: TWideStringField
      FieldName = 'teknisi'
      Size = 25
    end
    object ZQueryPenanganancreated_at: TDateTimeField
      FieldName = 'created_at'
      Visible = False
    end
    object ZQueryPenangananupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Visible = False
    end
  end
  object ZQueryLogin: TZQuery
    Connection = ZConnection1
    Params = <>
    Properties.Strings = (
      'select * from account'
      '')
    Left = 59
    Top = 24
  end
  object ZQueryUser: TZQuery
    Connection = ZConnection1
    SortedFields = 'id_account'
    SortType = stDescending
    SQL.Strings = (
      'select * from akun'
      '')
    Params = <>
    Properties.Strings = (
      'select * from account'
      '')
    IndexFieldNames = 'id_account Desc'
    Left = 59
    Top = 144
    object ZQueryUserid_account: TIntegerField
      FieldName = 'id_account'
      ReadOnly = True
      Required = True
    end
    object ZQueryUsernama: TWideStringField
      FieldName = 'nama'
      ReadOnly = True
      Size = 25
    end
    object ZQueryUserusername: TWideStringField
      FieldName = 'username'
      ReadOnly = True
      Size = 25
    end
    object ZQueryUserpassword: TWideStringField
      FieldName = 'password'
      ReadOnly = True
      Size = 25
    end
    object ZQueryUseremail: TWideStringField
      FieldName = 'email'
      ReadOnly = True
      Size = 25
    end
    object ZQueryUserhak_akses: TWideStringField
      FieldName = 'hak_akses'
      ReadOnly = True
      Size = 10
    end
    object ZQueryUserno_hp: TWideStringField
      FieldName = 'no_hp'
      ReadOnly = True
      Size = 15
    end
    object ZQueryUsercreated_at: TDateTimeField
      FieldName = 'created_at'
      ReadOnly = True
      Visible = False
    end
    object ZQueryUserupdated_at: TDateTimeField
      FieldName = 'updated_at'
      ReadOnly = True
      Visible = False
    end
  end
  object DataSourceUser: TDataSource
    DataSet = ZQueryUser
    Left = 16
    Top = 144
  end
  object ZQueryTambahDesa: TZQuery
    Connection = ZConnection1
    SortedFields = 'id_desa'
    SortType = stDescending
    SQL.Strings = (
      'SELECT * FROM desa'
      '')
    Params = <>
    Properties.Strings = (
      'select * from account'
      '')
    IndexFieldNames = 'id_desa Desc'
    Left = 563
    Top = 8
    object ZQueryTambahDesaid_desa: TIntegerField
      FieldName = 'id_desa'
      ReadOnly = True
      Required = True
    end
    object ZQueryTambahDesadesa: TWideStringField
      FieldName = 'desa'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahDesacreated_at: TDateTimeField
      FieldName = 'created_at'
      ReadOnly = True
      Visible = False
    end
    object ZQueryTambahDesaupdated_at: TDateTimeField
      FieldName = 'updated_at'
      ReadOnly = True
      Visible = False
    end
  end
  object DataSourceTambahDesa: TDataSource
    DataSet = ZQueryTambahDesa
    Left = 528
    Top = 8
  end
  object ZQueryTambahKecamatan: TZQuery
    Connection = ZConnection1
    SortedFields = 'id_kecamatan'
    SortType = stDescending
    SQL.Strings = (
      'SELECT * FROM kecamatan')
    Params = <>
    Properties.Strings = (
      'select * from account'
      '')
    IndexFieldNames = 'id_kecamatan Desc'
    Left = 563
    Top = 64
    object ZQueryTambahKecamatanid_kecamatan: TIntegerField
      FieldName = 'id_kecamatan'
      ReadOnly = True
      Required = True
    end
    object ZQueryTambahKecamatankecamatan: TWideStringField
      FieldName = 'kecamatan'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahKecamatancreated_at: TDateTimeField
      FieldName = 'created_at'
      ReadOnly = True
      Visible = False
    end
    object ZQueryTambahKecamatanupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Visible = False
    end
  end
  object DataSourceTambahKecamatan: TDataSource
    DataSet = ZQueryTambahKecamatan
    Left = 528
    Top = 64
  end
  object ZQueryTambahLokasi: TZQuery
    Connection = ZConnection1
    SortedFields = 'id_lokasi'
    SortType = stDescending
    ReadOnly = True
    SQL.Strings = (
      
        'SELECT lokasi.id_lokasi, lokasi.nama_tempat, lokasi.koordinat, l' +
        'okasi.alamat, desa.desa, '
      
        'kecamatan.kecamatan, jenis_tempat_ibadah.jenis_tempat_ibadah FRO' +
        'M lokasi'
      'INNER JOIN desa ON lokasi.id_desa=desa.id_desa '
      
        'INNER JOIN kecamatan ON lokasi.id_kecamatan=kecamatan.id_kecamat' +
        'an'
      
        'INNER JOIN jenis_tempat_ibadah ON lokasi.id_jenis_tempat_ibadah=' +
        'jenis_tempat_ibadah.id_jenis_tempat_ibadah')
    Params = <>
    Properties.Strings = (
      'select * from account'
      '')
    IndexFieldNames = 'id_lokasi Desc'
    Left = 563
    Top = 120
    object ZQueryTambahLokasiid_lokasi: TIntegerField
      FieldName = 'id_lokasi'
      ReadOnly = True
    end
    object ZQueryTambahLokasinama_tempat: TWideStringField
      FieldName = 'nama_tempat'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahLokasikoordinat: TWideStringField
      FieldName = 'koordinat'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahLokasialamat: TWideStringField
      FieldName = 'alamat'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahLokasidesa: TWideStringField
      FieldName = 'desa'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahLokasikecamatan: TWideStringField
      FieldName = 'kecamatan'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahLokasijenis_tempat_ibadah: TWideStringField
      FieldName = 'jenis_tempat_ibadah'
      ReadOnly = True
      Size = 15
    end
  end
  object DataSourceTambahLokasi: TDataSource
    DataSet = ZQueryTambahLokasi
    Left = 528
    Top = 120
  end
  object ZQueryTambahStatus: TZQuery
    Connection = ZConnection1
    SortedFields = 'id_status'
    SortType = stDescending
    SQL.Strings = (
      'SELECT * FROM status')
    Params = <>
    Properties.Strings = (
      'select * from account'
      '')
    IndexFieldNames = 'id_status Desc'
    Left = 563
    Top = 176
    object ZQueryTambahStatusid_status: TIntegerField
      FieldName = 'id_status'
      ReadOnly = True
      Required = True
    end
    object ZQueryTambahStatusstatus: TWideStringField
      FieldName = 'status'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object ZQueryTambahStatuscreated_at: TDateTimeField
      FieldName = 'created_at'
      ReadOnly = True
      Visible = False
    end
    object ZQueryTambahStatusupdated_at: TDateTimeField
      FieldName = 'updated_at'
      ReadOnly = True
      Visible = False
    end
  end
  object DataSourceTambahStatus: TDataSource
    DataSet = ZQueryTambahStatus
    Left = 528
    Top = 176
  end
  object ZQueryTambahPerangkat: TZQuery
    Connection = ZConnection1
    SortedFields = 'id_perangkat'
    SortType = stDescending
    ReadOnly = True
    SQL.Strings = (
      
        'SELECT perangkat.id_perangkat, perangkat.nama_perangkat, perangk' +
        'at.tanggal, perangkat.jenis, status.status, lokasi.nama_tempat, ' +
        'lokasi.koordinat, lokasi.alamat, desa.desa, '
      'kecamatan.kecamatan FROM perangkat'
      'INNER JOIN status ON perangkat.id_status=status.id_status '
      'INNER JOIN lokasi ON perangkat.id_lokasi=lokasi.id_lokasi '
      'INNER JOIN desa ON lokasi.id_desa=desa.id_desa '
      
        'INNER JOIN kecamatan ON lokasi.id_kecamatan=kecamatan.id_kecamat' +
        'an'
      '')
    Params = <>
    Properties.Strings = (
      'select * from account'
      '')
    IndexFieldNames = 'id_perangkat Desc'
    Left = 563
    Top = 232
    object ZQueryTambahPerangkatid_perangkat: TIntegerField
      FieldName = 'id_perangkat'
      ReadOnly = True
    end
    object ZQueryTambahPerangkatnama_perangkat: TWideStringField
      FieldName = 'nama_perangkat'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahPerangkattanggal: TDateTimeField
      FieldName = 'tanggal'
      ReadOnly = True
    end
    object ZQueryTambahPerangkatjenis: TWideStringField
      FieldName = 'jenis'
      ReadOnly = True
      Size = 15
    end
    object ZQueryTambahPerangkatstatus: TWideStringField
      FieldName = 'status'
      ReadOnly = True
      Size = 10
    end
    object ZQueryTambahPerangkatnama_tempat: TWideStringField
      FieldName = 'nama_tempat'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahPerangkatkoordinat: TWideStringField
      FieldName = 'koordinat'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahPerangkatalamat: TWideStringField
      FieldName = 'alamat'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahPerangkatdesa: TWideStringField
      FieldName = 'desa'
      ReadOnly = True
      Size = 25
    end
    object ZQueryTambahPerangkatkecamatan: TWideStringField
      FieldName = 'kecamatan'
      ReadOnly = True
      Size = 25
    end
  end
  object DataSourceTambahPerangkat: TDataSource
    DataSet = ZQueryTambahPerangkat
    Left = 528
    Top = 232
  end
  object DataSourceTambahJenisTempatIbadah: TDataSource
    DataSet = ZQueryTambahJenisTempatIbadah
    Left = 528
    Top = 288
  end
  object ZQueryTambahJenisTempatIbadah: TZQuery
    Connection = ZConnection1
    SortedFields = 'id_jenis_tempat_ibadah'
    SortType = stDescending
    ReadOnly = True
    SQL.Strings = (
      'SELECT * FROM jenis_tempat_ibadah')
    Params = <>
    Properties.Strings = (
      'select * from account'
      '')
    IndexFieldNames = 'id_jenis_tempat_ibadah Desc'
    Left = 563
    Top = 288
    object ZQueryTambahJenisTempatIbadahid_jenis_tempat_ibadah: TIntegerField
      FieldName = 'id_jenis_tempat_ibadah'
      ReadOnly = True
    end
    object ZQueryTambahJenisTempatIbadahjenis_tempat_ibadah: TWideStringField
      FieldName = 'jenis_tempat_ibadah'
      ReadOnly = True
      Size = 15
    end
    object ZQueryTambahJenisTempatIbadahcreated_at: TDateTimeField
      FieldName = 'created_at'
      ReadOnly = True
      Visible = False
    end
    object ZQueryTambahJenisTempatIbadahupdated_at: TDateTimeField
      FieldName = 'updated_at'
      ReadOnly = True
      Visible = False
    end
  end
  object ZQueryLog: TZQuery
    Connection = ZConnection1
    SortedFields = 'id_log'
    SortType = stDescending
    SQL.Strings = (
      'select * from log')
    Params = <>
    IndexFieldNames = 'id_log Desc'
    Left = 416
    Top = 8
    object ZQueryLogid_log: TIntegerField
      FieldName = 'id_log'
      Required = True
    end
    object ZQueryLogaktivitas: TWideMemoField
      DisplayWidth = 30
      FieldName = 'aktivitas'
      OnGetText = ZQueryLogaktivitasGetText
      BlobType = ftWideMemo
    end
    object ZQueryLogtanggal: TDateTimeField
      FieldName = 'tanggal'
    end
    object ZQueryLogadmin: TWideStringField
      FieldName = 'admin'
      Size = 50
    end
  end
  object DataSourceLog: TDataSource
    DataSet = ZQueryLog
    Left = 376
    Top = 8
  end
end
