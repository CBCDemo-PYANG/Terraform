resource "google_sql_database_instance" "testDataBaseInstance-1" {
  name             = "master-instance"
  database_version = "POSTGRES_11"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      require_ssl = false
      authorized_networks {
        name  = "public-ingress"
        value = "0.0.0.0"
      }
    }
  }
}

resource "google_sql_database_instance" "testDataBaseInstance-2" {
  name             = "master-instance-2"
  database_version = "POSTGRES_11"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
    backup_configuration {
         enabled = false
    }
  }
}

resource "google_sql_database_instance" "mySqlServer" {
  name = "another-sql-server"
  database_version = "MYSQL_8_0"
  region = "us-west1"
  
  settings {
    tier = "db-f1-micro"
    database_flags {
      name = "local_infile"
      value = "on"
    }
    database_flags {
      name = "skip_show_database"
      value = "off"
    }
    database_flags {
      name = "remote access"
      value = "on"
    }
    database_flags {
      name = "3625"
      value = "on"
    }
  }
}