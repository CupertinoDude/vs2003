#include <stdafx.h>

#define XP_NOERROR              0
#define XP_ERROR                1
#define MAXCOLNAME				25
#define MAXNAME					25
#define MAXTEXT					255

#ifdef __cplusplus
extern "C" {
#endif

RETCODE __declspec(dllexport) [!output STORED_PROC_NAME](SRV_PROC *srvproc);

#ifdef __cplusplus
}
#endif

RETCODE __declspec(dllexport) [!output STORED_PROC_NAME](SRV_PROC *srvproc)
{

    DBSMALLINT i = 0;
    DBCHAR colname[MAXCOLNAME];
	DBCHAR spName[MAXNAME];
	DBCHAR spText[MAXTEXT];

	// Name of this procedure
	_snprintf(spName, MAXNAME, "[!output STORED_PROC_NAME]");


	//Send a text message
	_snprintf(spText, MAXTEXT, "%s Sample Extended Stored Procedure", spName);
	srv_sendmsg(
		srvproc,
		SRV_MSG_INFO,
		0,
		(DBTINYINT)0,
		(DBTINYINT)0,
		NULL,
		0,
		0,
		spText,
		SRV_NULLTERM);


	//Set up the column names
    _snprintf(colname, MAXCOLNAME, "ID");
    srv_describe(srvproc, 1, colname, SRV_NULLTERM, SRVINT2, sizeof(DBSMALLINT), SRVINT2, sizeof(DBSMALLINT), 0);

    _snprintf(colname, MAXCOLNAME, "spName");
    srv_describe(srvproc, 2, colname, SRV_NULLTERM, SRVCHAR, MAXNAME, SRVCHAR, 0, NULL);

    _snprintf(colname, MAXTEXT, "Text");
    srv_describe(srvproc, 3, colname, SRV_NULLTERM, SRVCHAR, MAXTEXT, SRVCHAR, 0, NULL);


	// Update field 2 "spName", same value for all rows
    srv_setcoldata(srvproc, 2, spName);
    srv_setcollen(srvproc, 2, static_cast<int>(strlen(spName)));


	// Send multiple rows of data
    for (i = 0; i < 3; i++) {

		// Update field 1 "ID"
		srv_setcoldata(srvproc, 1, &i);

		// Update field 3 "Text"
		_snprintf(spText, MAXTEXT, "%d) Sample rowset generated by the %s extended stored procedure", i, spName);

		srv_setcoldata(srvproc, 3, spText);
        srv_setcollen(srvproc, 3, static_cast<int>(strlen(spText)));

		// Send the entire row
        srv_sendrow(srvproc);
    }

  
	// Now return the number of rows processed
	srv_senddone(srvproc, SRV_DONE_MORE | SRV_DONE_COUNT, (DBUSMALLINT)0, (DBINT)i);

	return XP_NOERROR ;
}

