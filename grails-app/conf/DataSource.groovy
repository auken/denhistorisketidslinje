dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = org.hibernate.dialect.MySQL5InnoDBDialect // must be set for transactions to work!
    username = "root"
    password = "igdefault"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost:3306/dht"
        }
    }
    qa {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost:3306/dht_qa?autoReconnect=true"
        }
    }

    // Grails default settings for prod. We can change these settings later if the need be
    production {
        dataSource {
            dbCreate = "update"
            // url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            // jdbc:mysql://mydbinstance.abcdefghijkl.us-east-1.rds.amazonaws.com:3306/employees?user=sa&password=mypassword
            url = "jdbc:mysql://aal7b0ks88beri.c7jhigc3i7up.us-west-2.rds.amazonaws.com:3306/dht?user=dht&password=axelesbenlasse"
		    username = "dht"
		    password = "axelesbenlasse"
            pooled = true
            properties {
                maxActive = -1
                minEvictableIdleTimeMillis = 1800000
                timeBetweenEvictionRunsMillis = 1800000
                numTestsPerEvictionRun = 3
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = true
                validationQuery = "SELECT 1"
            }
        }
    }
}
