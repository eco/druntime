/**
 * D header file for POSIX.
 *
 * Copyright: Copyright Sean Kelly 2005 - 2009, Sönke Ludwig 2013.
 * License:   <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors:   Sean Kelly, Alex Rønne Petersen, Sönke Ludwig
 * Standards: The Open Group Base Specifications Issue 6, IEEE Std 1003.1, 2004 Edition
 */

/*          Copyright Sean Kelly 2005 - 2009.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module core.sys.posix.grp;

private import core.sys.posix.config;
public import core.sys.posix.sys.types; // for gid_t, uid_t

version (Posix):
extern (C):
nothrow:

//
// Required
//
/*
struct group
{
    char*   gr_name;
    char*   gr_passwd;
    gid_t   gr_gid;
    char**  gr_mem;
}

group* getgrnam(in char*);
group* getgrgid(gid_t);
*/

version( linux )
{
    struct group
    {
        char*   gr_name;
        char*   gr_passwd;
        gid_t   gr_gid;
        char**  gr_mem;
    }
}
else version( OSX )
{
    struct group
    {
        char*   gr_name;
        char*   gr_passwd;
        gid_t   gr_gid;
        char**  gr_mem;
    }
}
else version( FreeBSD )
{
    struct group
    {
        char*   gr_name;
        char*   gr_passwd;
        gid_t   gr_gid;
        char**  gr_mem;
    }
}
else
{
    static assert(false, "Unsupported platform");
}

group* getgrnam(in char*);
group* getgrgid(gid_t);

//
// Thread-Safe Functions (TSF)
//
/*
int getgrnam_r(in char*, group*, char*, size_t, group**);
int getgruid_r(gid_t, group*, char*, size_t, group**);
*/

version( linux )
{
    int getgrnam_r(in char*, group*, char*, size_t, group**);
    int getgruid_r(gid_t, group*, char*, size_t, group**);
}
else version( OSX )
{
    int getgrnam_r(in char*, group*, char*, size_t, group**);
    int getgruid_r(gid_t, group*, char*, size_t, group**);
}
else version( FreeBSD )
{
    int getgrnam_r(in char*, group*, char*, size_t, group**);
    int getgruid_r(gid_t, group*, char*, size_t, group**);
}
else
{
    static assert(false, "Unsupported platform");
}

//
// XOpen (XSI)
//
/*
struct group  *getgrent(void);
void           endgrent(void);
void           setgrent(void);
*/

version( linux )
{
    group* getgrent();
    @trusted void endgrent();
    @trusted void setgrent();
}
else version( OSX )
{
    group* getgrent();
    @trusted void endgrent();
    @trusted void setgrent();
}
else version( FreeBSD )
{
    group* getgrent();
    @trusted void endgrent();
    @trusted void setgrent();
}
else
{
    static assert(false, "Unsupported platform");
}
