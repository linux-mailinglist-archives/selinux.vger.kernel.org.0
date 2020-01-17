Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C040140FF4
	for <lists+selinux@lfdr.de>; Fri, 17 Jan 2020 18:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgAQRee (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 17 Jan 2020 12:34:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40484 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726603AbgAQRee (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 17 Jan 2020 12:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579282470;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ONdZUU3s76TMOi5rPbBdfSXCMFaU54zjvcHxpw1plA8=;
        b=GyQYRL4Buvh2sKgh59bJ0QqB6rZp4iE7MCObzDgH3iUquDAL4OY5uGkL8uyAMwwKoRfI94
        imvZ/yYyykwjJy9zymUb0/lU0onKWmBgljRRqdMV0YMUavusWVGwzricDBR80ltlj5l3hp
        8lJVAYLjPa8fV3vZsZ3xrnMNs7RWvgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-L6HT-bM0PW2jIJFvrM_p5A-1; Fri, 17 Jan 2020 12:34:28 -0500
X-MC-Unique: L6HT-bM0PW2jIJFvrM_p5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93E9EDB61;
        Fri, 17 Jan 2020 17:34:27 +0000 (UTC)
Received: from localhost (ovpn-206-47.brq.redhat.com [10.40.206.47])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 689927DB34;
        Fri, 17 Jan 2020 17:34:26 +0000 (UTC)
References: <20200115155523.69438-1-sds@tycho.nsa.gov> <pjdh80vqivt.fsf@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Petr Lautrbach <plautrba@redhat.com>
To:     selinux@vger.kernel.org
Cc:     Petr Lautrbach <plautrba@redhat.com>,
        Stephen Smalley <sds@tycho.nsa.gov>
Subject: Re: [PATCH] libselinux: remove flask.h and av_permissions.h
In-reply-to: <pjdh80vqivt.fsf@redhat.com>
Date:   Fri, 17 Jan 2020 18:34:24 +0100
Message-ID: <pjdd0biq95r.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org


Petr Lautrbach <plautrba@redhat.com> writes:

> Stephen Smalley <sds@tycho.nsa.gov> writes:
>
>> The flask.h and av_permissions.h header files were deprecated and
>> all selinux userspace references to them were removed in
>> commit 76913d8adb61b5 ("Deprecate use of flask.h and av_permissions.h.")
>> back in 2014 and included in the 20150202 / 2.4 release.
>> All userspace object managers should have been updated
>> to use the dynamic class/perm mapping support since that time.
>> Remove these headers finally to ensure that no users remain and
>> that no future uses are ever introduced.
>
> I've patched libselinux and I'm building all packages which requires
> libselinux-devel [1] in Fedora. I'm in the middle of package list and so far there
> are only 3 packages which fails to build without flask.h or
> av_permission.h - libuser (the particular file wasn't updated since
> 2012), ipsec-tools and mesa. When it's finished I'll investigate all
> results, but I don't think there will be some blocker.
>
> [1] https://copr.fedorainfracloud.org/coprs/plautrba/libselinux-without-flask.h/builds/
>

So the complete list of Fedora packages dependent on selinux/flask.h is:

xinetd
usermode
sed
pam
oddjob
libuser
ipsec-tools

Problems are usually in tests or in Fedora specific patches. I'll start
to work on fixes with affected maintainers.



> Acked-by: Petr Lautrbach <plautrba@redhat.com>
>
>
>> Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
>> ---
>>  libselinux/include/selinux/av_permissions.h | 1029 -------------------
>>  libselinux/include/selinux/flask.h          |  118 ---
>>  2 files changed, 1147 deletions(-)
>>  delete mode 100644 libselinux/include/selinux/av_permissions.h
>>  delete mode 100644 libselinux/include/selinux/flask.h
>>
>> diff --git a/libselinux/include/selinux/av_permissions.h b/libselinux/include/selinux/av_permissions.h
>> deleted file mode 100644
>> index c1269af9b72d..000000000000
>> --- a/libselinux/include/selinux/av_permissions.h
>> +++ /dev/null
>> @@ -1,1029 +0,0 @@
>> -#warning "Please remove any #include of this header in your source code."
>> -#warning "Instead, use string_to_av_perm() to map the permission name to a value."
>> -
>> -/* This file is automatically generated.  Do not edit. */
>> -#define COMMON_FILE__IOCTL                               0x00000001UL
>> -#define COMMON_FILE__READ                                0x00000002UL
>> -#define COMMON_FILE__WRITE                               0x00000004UL
>> -#define COMMON_FILE__CREATE                              0x00000008UL
>> -#define COMMON_FILE__GETATTR                             0x00000010UL
>> -#define COMMON_FILE__SETATTR                             0x00000020UL
>> -#define COMMON_FILE__LOCK                                0x00000040UL
>> -#define COMMON_FILE__RELABELFROM                         0x00000080UL
>> -#define COMMON_FILE__RELABELTO                           0x00000100UL
>> -#define COMMON_FILE__APPEND                              0x00000200UL
>> -#define COMMON_FILE__UNLINK                              0x00000400UL
>> -#define COMMON_FILE__LINK                                0x00000800UL
>> -#define COMMON_FILE__RENAME                              0x00001000UL
>> -#define COMMON_FILE__EXECUTE                             0x00002000UL
>> -#define COMMON_FILE__SWAPON                              0x00004000UL
>> -#define COMMON_FILE__QUOTAON                             0x00008000UL
>> -#define COMMON_FILE__MOUNTON                             0x00010000UL
>> -#define COMMON_SOCKET__IOCTL                             0x00000001UL
>> -#define COMMON_SOCKET__READ                              0x00000002UL
>> -#define COMMON_SOCKET__WRITE                             0x00000004UL
>> -#define COMMON_SOCKET__CREATE                            0x00000008UL
>> -#define COMMON_SOCKET__GETATTR                           0x00000010UL
>> -#define COMMON_SOCKET__SETATTR                           0x00000020UL
>> -#define COMMON_SOCKET__LOCK                              0x00000040UL
>> -#define COMMON_SOCKET__RELABELFROM                       0x00000080UL
>> -#define COMMON_SOCKET__RELABELTO                         0x00000100UL
>> -#define COMMON_SOCKET__APPEND                            0x00000200UL
>> -#define COMMON_SOCKET__BIND                              0x00000400UL
>> -#define COMMON_SOCKET__CONNECT                           0x00000800UL
>> -#define COMMON_SOCKET__LISTEN                            0x00001000UL
>> -#define COMMON_SOCKET__ACCEPT                            0x00002000UL
>> -#define COMMON_SOCKET__GETOPT                            0x00004000UL
>> -#define COMMON_SOCKET__SETOPT                            0x00008000UL
>> -#define COMMON_SOCKET__SHUTDOWN                          0x00010000UL
>> -#define COMMON_SOCKET__RECVFROM                          0x00020000UL
>> -#define COMMON_SOCKET__SENDTO                            0x00040000UL
>> -#define COMMON_SOCKET__RECV_MSG                          0x00080000UL
>> -#define COMMON_SOCKET__SEND_MSG                          0x00100000UL
>> -#define COMMON_SOCKET__NAME_BIND                         0x00200000UL
>> -#define COMMON_IPC__CREATE                               0x00000001UL
>> -#define COMMON_IPC__DESTROY                              0x00000002UL
>> -#define COMMON_IPC__GETATTR                              0x00000004UL
>> -#define COMMON_IPC__SETATTR                              0x00000008UL
>> -#define COMMON_IPC__READ                                 0x00000010UL
>> -#define COMMON_IPC__WRITE                                0x00000020UL
>> -#define COMMON_IPC__ASSOCIATE                            0x00000040UL
>> -#define COMMON_IPC__UNIX_READ                            0x00000080UL
>> -#define COMMON_IPC__UNIX_WRITE                           0x00000100UL
>> -#define COMMON_DATABASE__CREATE                          0x00000001UL
>> -#define COMMON_DATABASE__DROP                            0x00000002UL
>> -#define COMMON_DATABASE__GETATTR                         0x00000004UL
>> -#define COMMON_DATABASE__SETATTR                         0x00000008UL
>> -#define COMMON_DATABASE__RELABELFROM                     0x00000010UL
>> -#define COMMON_DATABASE__RELABELTO                       0x00000020UL
>> -#define FILESYSTEM__MOUNT                         0x00000001UL
>> -#define FILESYSTEM__REMOUNT                       0x00000002UL
>> -#define FILESYSTEM__UNMOUNT                       0x00000004UL
>> -#define FILESYSTEM__GETATTR                       0x00000008UL
>> -#define FILESYSTEM__RELABELFROM                   0x00000010UL
>> -#define FILESYSTEM__RELABELTO                     0x00000020UL
>> -#define FILESYSTEM__TRANSITION                    0x00000040UL
>> -#define FILESYSTEM__ASSOCIATE                     0x00000080UL
>> -#define FILESYSTEM__QUOTAMOD                      0x00000100UL
>> -#define FILESYSTEM__QUOTAGET                      0x00000200UL
>> -#define DIR__IOCTL                                0x00000001UL
>> -#define DIR__READ                                 0x00000002UL
>> -#define DIR__WRITE                                0x00000004UL
>> -#define DIR__CREATE                               0x00000008UL
>> -#define DIR__GETATTR                              0x00000010UL
>> -#define DIR__SETATTR                              0x00000020UL
>> -#define DIR__LOCK                                 0x00000040UL
>> -#define DIR__RELABELFROM                          0x00000080UL
>> -#define DIR__RELABELTO                            0x00000100UL
>> -#define DIR__APPEND                               0x00000200UL
>> -#define DIR__UNLINK                               0x00000400UL
>> -#define DIR__LINK                                 0x00000800UL
>> -#define DIR__RENAME                               0x00001000UL
>> -#define DIR__EXECUTE                              0x00002000UL
>> -#define DIR__SWAPON                               0x00004000UL
>> -#define DIR__QUOTAON                              0x00008000UL
>> -#define DIR__MOUNTON                              0x00010000UL
>> -#define DIR__ADD_NAME                             0x00020000UL
>> -#define DIR__REMOVE_NAME                          0x00040000UL
>> -#define DIR__REPARENT                             0x00080000UL
>> -#define DIR__SEARCH                               0x00100000UL
>> -#define DIR__RMDIR                                0x00200000UL
>> -#define DIR__OPEN                                 0x00400000UL
>> -#define FILE__IOCTL                               0x00000001UL
>> -#define FILE__READ                                0x00000002UL
>> -#define FILE__WRITE                               0x00000004UL
>> -#define FILE__CREATE                              0x00000008UL
>> -#define FILE__GETATTR                             0x00000010UL
>> -#define FILE__SETATTR                             0x00000020UL
>> -#define FILE__LOCK                                0x00000040UL
>> -#define FILE__RELABELFROM                         0x00000080UL
>> -#define FILE__RELABELTO                           0x00000100UL
>> -#define FILE__APPEND                              0x00000200UL
>> -#define FILE__UNLINK                              0x00000400UL
>> -#define FILE__LINK                                0x00000800UL
>> -#define FILE__RENAME                              0x00001000UL
>> -#define FILE__EXECUTE                             0x00002000UL
>> -#define FILE__SWAPON                              0x00004000UL
>> -#define FILE__QUOTAON                             0x00008000UL
>> -#define FILE__MOUNTON                             0x00010000UL
>> -#define FILE__EXECUTE_NO_TRANS                    0x00020000UL
>> -#define FILE__ENTRYPOINT                          0x00040000UL
>> -#define FILE__EXECMOD                             0x00080000UL
>> -#define FILE__OPEN                                0x00100000UL
>> -#define LNK_FILE__IOCTL                           0x00000001UL
>> -#define LNK_FILE__READ                            0x00000002UL
>> -#define LNK_FILE__WRITE                           0x00000004UL
>> -#define LNK_FILE__CREATE                          0x00000008UL
>> -#define LNK_FILE__GETATTR                         0x00000010UL
>> -#define LNK_FILE__SETATTR                         0x00000020UL
>> -#define LNK_FILE__LOCK                            0x00000040UL
>> -#define LNK_FILE__RELABELFROM                     0x00000080UL
>> -#define LNK_FILE__RELABELTO                       0x00000100UL
>> -#define LNK_FILE__APPEND                          0x00000200UL
>> -#define LNK_FILE__UNLINK                          0x00000400UL
>> -#define LNK_FILE__LINK                            0x00000800UL
>> -#define LNK_FILE__RENAME                          0x00001000UL
>> -#define LNK_FILE__EXECUTE                         0x00002000UL
>> -#define LNK_FILE__SWAPON                          0x00004000UL
>> -#define LNK_FILE__QUOTAON                         0x00008000UL
>> -#define LNK_FILE__MOUNTON                         0x00010000UL
>> -#define CHR_FILE__IOCTL                           0x00000001UL
>> -#define CHR_FILE__READ                            0x00000002UL
>> -#define CHR_FILE__WRITE                           0x00000004UL
>> -#define CHR_FILE__CREATE                          0x00000008UL
>> -#define CHR_FILE__GETATTR                         0x00000010UL
>> -#define CHR_FILE__SETATTR                         0x00000020UL
>> -#define CHR_FILE__LOCK                            0x00000040UL
>> -#define CHR_FILE__RELABELFROM                     0x00000080UL
>> -#define CHR_FILE__RELABELTO                       0x00000100UL
>> -#define CHR_FILE__APPEND                          0x00000200UL
>> -#define CHR_FILE__UNLINK                          0x00000400UL
>> -#define CHR_FILE__LINK                            0x00000800UL
>> -#define CHR_FILE__RENAME                          0x00001000UL
>> -#define CHR_FILE__EXECUTE                         0x00002000UL
>> -#define CHR_FILE__SWAPON                          0x00004000UL
>> -#define CHR_FILE__QUOTAON                         0x00008000UL
>> -#define CHR_FILE__MOUNTON                         0x00010000UL
>> -#define CHR_FILE__EXECUTE_NO_TRANS                0x00020000UL
>> -#define CHR_FILE__ENTRYPOINT                      0x00040000UL
>> -#define CHR_FILE__EXECMOD                         0x00080000UL
>> -#define CHR_FILE__OPEN                            0x00100000UL
>> -#define BLK_FILE__IOCTL                           0x00000001UL
>> -#define BLK_FILE__READ                            0x00000002UL
>> -#define BLK_FILE__WRITE                           0x00000004UL
>> -#define BLK_FILE__CREATE                          0x00000008UL
>> -#define BLK_FILE__GETATTR                         0x00000010UL
>> -#define BLK_FILE__SETATTR                         0x00000020UL
>> -#define BLK_FILE__LOCK                            0x00000040UL
>> -#define BLK_FILE__RELABELFROM                     0x00000080UL
>> -#define BLK_FILE__RELABELTO                       0x00000100UL
>> -#define BLK_FILE__APPEND                          0x00000200UL
>> -#define BLK_FILE__UNLINK                          0x00000400UL
>> -#define BLK_FILE__LINK                            0x00000800UL
>> -#define BLK_FILE__RENAME                          0x00001000UL
>> -#define BLK_FILE__EXECUTE                         0x00002000UL
>> -#define BLK_FILE__SWAPON                          0x00004000UL
>> -#define BLK_FILE__QUOTAON                         0x00008000UL
>> -#define BLK_FILE__MOUNTON                         0x00010000UL
>> -#define BLK_FILE__OPEN                            0x00020000UL
>> -#define SOCK_FILE__IOCTL                          0x00000001UL
>> -#define SOCK_FILE__READ                           0x00000002UL
>> -#define SOCK_FILE__WRITE                          0x00000004UL
>> -#define SOCK_FILE__CREATE                         0x00000008UL
>> -#define SOCK_FILE__GETATTR                        0x00000010UL
>> -#define SOCK_FILE__SETATTR                        0x00000020UL
>> -#define SOCK_FILE__LOCK                           0x00000040UL
>> -#define SOCK_FILE__RELABELFROM                    0x00000080UL
>> -#define SOCK_FILE__RELABELTO                      0x00000100UL
>> -#define SOCK_FILE__APPEND                         0x00000200UL
>> -#define SOCK_FILE__UNLINK                         0x00000400UL
>> -#define SOCK_FILE__LINK                           0x00000800UL
>> -#define SOCK_FILE__RENAME                         0x00001000UL
>> -#define SOCK_FILE__EXECUTE                        0x00002000UL
>> -#define SOCK_FILE__SWAPON                         0x00004000UL
>> -#define SOCK_FILE__QUOTAON                        0x00008000UL
>> -#define SOCK_FILE__MOUNTON                        0x00010000UL
>> -#define FIFO_FILE__IOCTL                          0x00000001UL
>> -#define FIFO_FILE__READ                           0x00000002UL
>> -#define FIFO_FILE__WRITE                          0x00000004UL
>> -#define FIFO_FILE__CREATE                         0x00000008UL
>> -#define FIFO_FILE__GETATTR                        0x00000010UL
>> -#define FIFO_FILE__SETATTR                        0x00000020UL
>> -#define FIFO_FILE__LOCK                           0x00000040UL
>> -#define FIFO_FILE__RELABELFROM                    0x00000080UL
>> -#define FIFO_FILE__RELABELTO                      0x00000100UL
>> -#define FIFO_FILE__APPEND                         0x00000200UL
>> -#define FIFO_FILE__UNLINK                         0x00000400UL
>> -#define FIFO_FILE__LINK                           0x00000800UL
>> -#define FIFO_FILE__RENAME                         0x00001000UL
>> -#define FIFO_FILE__EXECUTE                        0x00002000UL
>> -#define FIFO_FILE__SWAPON                         0x00004000UL
>> -#define FIFO_FILE__QUOTAON                        0x00008000UL
>> -#define FIFO_FILE__MOUNTON                        0x00010000UL
>> -#define FIFO_FILE__OPEN                           0x00020000UL
>> -#define FD__USE                                   0x00000001UL
>> -#define SOCKET__IOCTL                             0x00000001UL
>> -#define SOCKET__READ                              0x00000002UL
>> -#define SOCKET__WRITE                             0x00000004UL
>> -#define SOCKET__CREATE                            0x00000008UL
>> -#define SOCKET__GETATTR                           0x00000010UL
>> -#define SOCKET__SETATTR                           0x00000020UL
>> -#define SOCKET__LOCK                              0x00000040UL
>> -#define SOCKET__RELABELFROM                       0x00000080UL
>> -#define SOCKET__RELABELTO                         0x00000100UL
>> -#define SOCKET__APPEND                            0x00000200UL
>> -#define SOCKET__BIND                              0x00000400UL
>> -#define SOCKET__CONNECT                           0x00000800UL
>> -#define SOCKET__LISTEN                            0x00001000UL
>> -#define SOCKET__ACCEPT                            0x00002000UL
>> -#define SOCKET__GETOPT                            0x00004000UL
>> -#define SOCKET__SETOPT                            0x00008000UL
>> -#define SOCKET__SHUTDOWN                          0x00010000UL
>> -#define SOCKET__RECVFROM                          0x00020000UL
>> -#define SOCKET__SENDTO                            0x00040000UL
>> -#define SOCKET__RECV_MSG                          0x00080000UL
>> -#define SOCKET__SEND_MSG                          0x00100000UL
>> -#define SOCKET__NAME_BIND                         0x00200000UL
>> -#define TCP_SOCKET__IOCTL                         0x00000001UL
>> -#define TCP_SOCKET__READ                          0x00000002UL
>> -#define TCP_SOCKET__WRITE                         0x00000004UL
>> -#define TCP_SOCKET__CREATE                        0x00000008UL
>> -#define TCP_SOCKET__GETATTR                       0x00000010UL
>> -#define TCP_SOCKET__SETATTR                       0x00000020UL
>> -#define TCP_SOCKET__LOCK                          0x00000040UL
>> -#define TCP_SOCKET__RELABELFROM                   0x00000080UL
>> -#define TCP_SOCKET__RELABELTO                     0x00000100UL
>> -#define TCP_SOCKET__APPEND                        0x00000200UL
>> -#define TCP_SOCKET__BIND                          0x00000400UL
>> -#define TCP_SOCKET__CONNECT                       0x00000800UL
>> -#define TCP_SOCKET__LISTEN                        0x00001000UL
>> -#define TCP_SOCKET__ACCEPT                        0x00002000UL
>> -#define TCP_SOCKET__GETOPT                        0x00004000UL
>> -#define TCP_SOCKET__SETOPT                        0x00008000UL
>> -#define TCP_SOCKET__SHUTDOWN                      0x00010000UL
>> -#define TCP_SOCKET__RECVFROM                      0x00020000UL
>> -#define TCP_SOCKET__SENDTO                        0x00040000UL
>> -#define TCP_SOCKET__RECV_MSG                      0x00080000UL
>> -#define TCP_SOCKET__SEND_MSG                      0x00100000UL
>> -#define TCP_SOCKET__NAME_BIND                     0x00200000UL
>> -#define TCP_SOCKET__CONNECTTO                     0x00400000UL
>> -#define TCP_SOCKET__NEWCONN                       0x00800000UL
>> -#define TCP_SOCKET__ACCEPTFROM                    0x01000000UL
>> -#define TCP_SOCKET__NODE_BIND                     0x02000000UL
>> -#define TCP_SOCKET__NAME_CONNECT                  0x04000000UL
>> -#define UDP_SOCKET__IOCTL                         0x00000001UL
>> -#define UDP_SOCKET__READ                          0x00000002UL
>> -#define UDP_SOCKET__WRITE                         0x00000004UL
>> -#define UDP_SOCKET__CREATE                        0x00000008UL
>> -#define UDP_SOCKET__GETATTR                       0x00000010UL
>> -#define UDP_SOCKET__SETATTR                       0x00000020UL
>> -#define UDP_SOCKET__LOCK                          0x00000040UL
>> -#define UDP_SOCKET__RELABELFROM                   0x00000080UL
>> -#define UDP_SOCKET__RELABELTO                     0x00000100UL
>> -#define UDP_SOCKET__APPEND                        0x00000200UL
>> -#define UDP_SOCKET__BIND                          0x00000400UL
>> -#define UDP_SOCKET__CONNECT                       0x00000800UL
>> -#define UDP_SOCKET__LISTEN                        0x00001000UL
>> -#define UDP_SOCKET__ACCEPT                        0x00002000UL
>> -#define UDP_SOCKET__GETOPT                        0x00004000UL
>> -#define UDP_SOCKET__SETOPT                        0x00008000UL
>> -#define UDP_SOCKET__SHUTDOWN                      0x00010000UL
>> -#define UDP_SOCKET__RECVFROM                      0x00020000UL
>> -#define UDP_SOCKET__SENDTO                        0x00040000UL
>> -#define UDP_SOCKET__RECV_MSG                      0x00080000UL
>> -#define UDP_SOCKET__SEND_MSG                      0x00100000UL
>> -#define UDP_SOCKET__NAME_BIND                     0x00200000UL
>> -#define UDP_SOCKET__NODE_BIND                     0x00400000UL
>> -#define RAWIP_SOCKET__IOCTL                       0x00000001UL
>> -#define RAWIP_SOCKET__READ                        0x00000002UL
>> -#define RAWIP_SOCKET__WRITE                       0x00000004UL
>> -#define RAWIP_SOCKET__CREATE                      0x00000008UL
>> -#define RAWIP_SOCKET__GETATTR                     0x00000010UL
>> -#define RAWIP_SOCKET__SETATTR                     0x00000020UL
>> -#define RAWIP_SOCKET__LOCK                        0x00000040UL
>> -#define RAWIP_SOCKET__RELABELFROM                 0x00000080UL
>> -#define RAWIP_SOCKET__RELABELTO                   0x00000100UL
>> -#define RAWIP_SOCKET__APPEND                      0x00000200UL
>> -#define RAWIP_SOCKET__BIND                        0x00000400UL
>> -#define RAWIP_SOCKET__CONNECT                     0x00000800UL
>> -#define RAWIP_SOCKET__LISTEN                      0x00001000UL
>> -#define RAWIP_SOCKET__ACCEPT                      0x00002000UL
>> -#define RAWIP_SOCKET__GETOPT                      0x00004000UL
>> -#define RAWIP_SOCKET__SETOPT                      0x00008000UL
>> -#define RAWIP_SOCKET__SHUTDOWN                    0x00010000UL
>> -#define RAWIP_SOCKET__RECVFROM                    0x00020000UL
>> -#define RAWIP_SOCKET__SENDTO                      0x00040000UL
>> -#define RAWIP_SOCKET__RECV_MSG                    0x00080000UL
>> -#define RAWIP_SOCKET__SEND_MSG                    0x00100000UL
>> -#define RAWIP_SOCKET__NAME_BIND                   0x00200000UL
>> -#define RAWIP_SOCKET__NODE_BIND                   0x00400000UL
>> -#define NODE__TCP_RECV                            0x00000001UL
>> -#define NODE__TCP_SEND                            0x00000002UL
>> -#define NODE__UDP_RECV                            0x00000004UL
>> -#define NODE__UDP_SEND                            0x00000008UL
>> -#define NODE__RAWIP_RECV                          0x00000010UL
>> -#define NODE__RAWIP_SEND                          0x00000020UL
>> -#define NODE__ENFORCE_DEST                        0x00000040UL
>> -#define NODE__DCCP_RECV                           0x00000080UL
>> -#define NODE__DCCP_SEND                           0x00000100UL
>> -#define NODE__RECVFROM                            0x00000200UL
>> -#define NODE__SENDTO                              0x00000400UL
>> -#define NETIF__TCP_RECV                           0x00000001UL
>> -#define NETIF__TCP_SEND                           0x00000002UL
>> -#define NETIF__UDP_RECV                           0x00000004UL
>> -#define NETIF__UDP_SEND                           0x00000008UL
>> -#define NETIF__RAWIP_RECV                         0x00000010UL
>> -#define NETIF__RAWIP_SEND                         0x00000020UL
>> -#define NETIF__DCCP_RECV                          0x00000040UL
>> -#define NETIF__DCCP_SEND                          0x00000080UL
>> -#define NETIF__INGRESS                            0x00000100UL
>> -#define NETIF__EGRESS                             0x00000200UL
>> -#define NETLINK_SOCKET__IOCTL                     0x00000001UL
>> -#define NETLINK_SOCKET__READ                      0x00000002UL
>> -#define NETLINK_SOCKET__WRITE                     0x00000004UL
>> -#define NETLINK_SOCKET__CREATE                    0x00000008UL
>> -#define NETLINK_SOCKET__GETATTR                   0x00000010UL
>> -#define NETLINK_SOCKET__SETATTR                   0x00000020UL
>> -#define NETLINK_SOCKET__LOCK                      0x00000040UL
>> -#define NETLINK_SOCKET__RELABELFROM               0x00000080UL
>> -#define NETLINK_SOCKET__RELABELTO                 0x00000100UL
>> -#define NETLINK_SOCKET__APPEND                    0x00000200UL
>> -#define NETLINK_SOCKET__BIND                      0x00000400UL
>> -#define NETLINK_SOCKET__CONNECT                   0x00000800UL
>> -#define NETLINK_SOCKET__LISTEN                    0x00001000UL
>> -#define NETLINK_SOCKET__ACCEPT                    0x00002000UL
>> -#define NETLINK_SOCKET__GETOPT                    0x00004000UL
>> -#define NETLINK_SOCKET__SETOPT                    0x00008000UL
>> -#define NETLINK_SOCKET__SHUTDOWN                  0x00010000UL
>> -#define NETLINK_SOCKET__RECVFROM                  0x00020000UL
>> -#define NETLINK_SOCKET__SENDTO                    0x00040000UL
>> -#define NETLINK_SOCKET__RECV_MSG                  0x00080000UL
>> -#define NETLINK_SOCKET__SEND_MSG                  0x00100000UL
>> -#define NETLINK_SOCKET__NAME_BIND                 0x00200000UL
>> -#define PACKET_SOCKET__IOCTL                      0x00000001UL
>> -#define PACKET_SOCKET__READ                       0x00000002UL
>> -#define PACKET_SOCKET__WRITE                      0x00000004UL
>> -#define PACKET_SOCKET__CREATE                     0x00000008UL
>> -#define PACKET_SOCKET__GETATTR                    0x00000010UL
>> -#define PACKET_SOCKET__SETATTR                    0x00000020UL
>> -#define PACKET_SOCKET__LOCK                       0x00000040UL
>> -#define PACKET_SOCKET__RELABELFROM                0x00000080UL
>> -#define PACKET_SOCKET__RELABELTO                  0x00000100UL
>> -#define PACKET_SOCKET__APPEND                     0x00000200UL
>> -#define PACKET_SOCKET__BIND                       0x00000400UL
>> -#define PACKET_SOCKET__CONNECT                    0x00000800UL
>> -#define PACKET_SOCKET__LISTEN                     0x00001000UL
>> -#define PACKET_SOCKET__ACCEPT                     0x00002000UL
>> -#define PACKET_SOCKET__GETOPT                     0x00004000UL
>> -#define PACKET_SOCKET__SETOPT                     0x00008000UL
>> -#define PACKET_SOCKET__SHUTDOWN                   0x00010000UL
>> -#define PACKET_SOCKET__RECVFROM                   0x00020000UL
>> -#define PACKET_SOCKET__SENDTO                     0x00040000UL
>> -#define PACKET_SOCKET__RECV_MSG                   0x00080000UL
>> -#define PACKET_SOCKET__SEND_MSG                   0x00100000UL
>> -#define PACKET_SOCKET__NAME_BIND                  0x00200000UL
>> -#define KEY_SOCKET__IOCTL                         0x00000001UL
>> -#define KEY_SOCKET__READ                          0x00000002UL
>> -#define KEY_SOCKET__WRITE                         0x00000004UL
>> -#define KEY_SOCKET__CREATE                        0x00000008UL
>> -#define KEY_SOCKET__GETATTR                       0x00000010UL
>> -#define KEY_SOCKET__SETATTR                       0x00000020UL
>> -#define KEY_SOCKET__LOCK                          0x00000040UL
>> -#define KEY_SOCKET__RELABELFROM                   0x00000080UL
>> -#define KEY_SOCKET__RELABELTO                     0x00000100UL
>> -#define KEY_SOCKET__APPEND                        0x00000200UL
>> -#define KEY_SOCKET__BIND                          0x00000400UL
>> -#define KEY_SOCKET__CONNECT                       0x00000800UL
>> -#define KEY_SOCKET__LISTEN                        0x00001000UL
>> -#define KEY_SOCKET__ACCEPT                        0x00002000UL
>> -#define KEY_SOCKET__GETOPT                        0x00004000UL
>> -#define KEY_SOCKET__SETOPT                        0x00008000UL
>> -#define KEY_SOCKET__SHUTDOWN                      0x00010000UL
>> -#define KEY_SOCKET__RECVFROM                      0x00020000UL
>> -#define KEY_SOCKET__SENDTO                        0x00040000UL
>> -#define KEY_SOCKET__RECV_MSG                      0x00080000UL
>> -#define KEY_SOCKET__SEND_MSG                      0x00100000UL
>> -#define KEY_SOCKET__NAME_BIND                     0x00200000UL
>> -#define UNIX_STREAM_SOCKET__IOCTL                 0x00000001UL
>> -#define UNIX_STREAM_SOCKET__READ                  0x00000002UL
>> -#define UNIX_STREAM_SOCKET__WRITE                 0x00000004UL
>> -#define UNIX_STREAM_SOCKET__CREATE                0x00000008UL
>> -#define UNIX_STREAM_SOCKET__GETATTR               0x00000010UL
>> -#define UNIX_STREAM_SOCKET__SETATTR               0x00000020UL
>> -#define UNIX_STREAM_SOCKET__LOCK                  0x00000040UL
>> -#define UNIX_STREAM_SOCKET__RELABELFROM           0x00000080UL
>> -#define UNIX_STREAM_SOCKET__RELABELTO             0x00000100UL
>> -#define UNIX_STREAM_SOCKET__APPEND                0x00000200UL
>> -#define UNIX_STREAM_SOCKET__BIND                  0x00000400UL
>> -#define UNIX_STREAM_SOCKET__CONNECT               0x00000800UL
>> -#define UNIX_STREAM_SOCKET__LISTEN                0x00001000UL
>> -#define UNIX_STREAM_SOCKET__ACCEPT                0x00002000UL
>> -#define UNIX_STREAM_SOCKET__GETOPT                0x00004000UL
>> -#define UNIX_STREAM_SOCKET__SETOPT                0x00008000UL
>> -#define UNIX_STREAM_SOCKET__SHUTDOWN              0x00010000UL
>> -#define UNIX_STREAM_SOCKET__RECVFROM              0x00020000UL
>> -#define UNIX_STREAM_SOCKET__SENDTO                0x00040000UL
>> -#define UNIX_STREAM_SOCKET__RECV_MSG              0x00080000UL
>> -#define UNIX_STREAM_SOCKET__SEND_MSG              0x00100000UL
>> -#define UNIX_STREAM_SOCKET__NAME_BIND             0x00200000UL
>> -#define UNIX_STREAM_SOCKET__CONNECTTO             0x00400000UL
>> -#define UNIX_STREAM_SOCKET__NEWCONN               0x00800000UL
>> -#define UNIX_STREAM_SOCKET__ACCEPTFROM            0x01000000UL
>> -#define UNIX_DGRAM_SOCKET__IOCTL                  0x00000001UL
>> -#define UNIX_DGRAM_SOCKET__READ                   0x00000002UL
>> -#define UNIX_DGRAM_SOCKET__WRITE                  0x00000004UL
>> -#define UNIX_DGRAM_SOCKET__CREATE                 0x00000008UL
>> -#define UNIX_DGRAM_SOCKET__GETATTR                0x00000010UL
>> -#define UNIX_DGRAM_SOCKET__SETATTR                0x00000020UL
>> -#define UNIX_DGRAM_SOCKET__LOCK                   0x00000040UL
>> -#define UNIX_DGRAM_SOCKET__RELABELFROM            0x00000080UL
>> -#define UNIX_DGRAM_SOCKET__RELABELTO              0x00000100UL
>> -#define UNIX_DGRAM_SOCKET__APPEND                 0x00000200UL
>> -#define UNIX_DGRAM_SOCKET__BIND                   0x00000400UL
>> -#define UNIX_DGRAM_SOCKET__CONNECT                0x00000800UL
>> -#define UNIX_DGRAM_SOCKET__LISTEN                 0x00001000UL
>> -#define UNIX_DGRAM_SOCKET__ACCEPT                 0x00002000UL
>> -#define UNIX_DGRAM_SOCKET__GETOPT                 0x00004000UL
>> -#define UNIX_DGRAM_SOCKET__SETOPT                 0x00008000UL
>> -#define UNIX_DGRAM_SOCKET__SHUTDOWN               0x00010000UL
>> -#define UNIX_DGRAM_SOCKET__RECVFROM               0x00020000UL
>> -#define UNIX_DGRAM_SOCKET__SENDTO                 0x00040000UL
>> -#define UNIX_DGRAM_SOCKET__RECV_MSG               0x00080000UL
>> -#define UNIX_DGRAM_SOCKET__SEND_MSG               0x00100000UL
>> -#define UNIX_DGRAM_SOCKET__NAME_BIND              0x00200000UL
>> -#define PROCESS__FORK                             0x00000001UL
>> -#define PROCESS__TRANSITION                       0x00000002UL
>> -#define PROCESS__SIGCHLD                          0x00000004UL
>> -#define PROCESS__SIGKILL                          0x00000008UL
>> -#define PROCESS__SIGSTOP                          0x00000010UL
>> -#define PROCESS__SIGNULL                          0x00000020UL
>> -#define PROCESS__SIGNAL                           0x00000040UL
>> -#define PROCESS__PTRACE                           0x00000080UL
>> -#define PROCESS__GETSCHED                         0x00000100UL
>> -#define PROCESS__SETSCHED                         0x00000200UL
>> -#define PROCESS__GETSESSION                       0x00000400UL
>> -#define PROCESS__GETPGID                          0x00000800UL
>> -#define PROCESS__SETPGID                          0x00001000UL
>> -#define PROCESS__GETCAP                           0x00002000UL
>> -#define PROCESS__SETCAP                           0x00004000UL
>> -#define PROCESS__SHARE                            0x00008000UL
>> -#define PROCESS__GETATTR                          0x00010000UL
>> -#define PROCESS__SETEXEC                          0x00020000UL
>> -#define PROCESS__SETFSCREATE                      0x00040000UL
>> -#define PROCESS__NOATSECURE                       0x00080000UL
>> -#define PROCESS__SIGINH                           0x00100000UL
>> -#define PROCESS__SETRLIMIT                        0x00200000UL
>> -#define PROCESS__RLIMITINH                        0x00400000UL
>> -#define PROCESS__DYNTRANSITION                    0x00800000UL
>> -#define PROCESS__SETCURRENT                       0x01000000UL
>> -#define PROCESS__EXECMEM                          0x02000000UL
>> -#define PROCESS__EXECSTACK                        0x04000000UL
>> -#define PROCESS__EXECHEAP                         0x08000000UL
>> -#define PROCESS__SETKEYCREATE                     0x10000000UL
>> -#define PROCESS__SETSOCKCREATE                    0x20000000UL
>> -#define IPC__CREATE                               0x00000001UL
>> -#define IPC__DESTROY                              0x00000002UL
>> -#define IPC__GETATTR                              0x00000004UL
>> -#define IPC__SETATTR                              0x00000008UL
>> -#define IPC__READ                                 0x00000010UL
>> -#define IPC__WRITE                                0x00000020UL
>> -#define IPC__ASSOCIATE                            0x00000040UL
>> -#define IPC__UNIX_READ                            0x00000080UL
>> -#define IPC__UNIX_WRITE                           0x00000100UL
>> -#define SEM__CREATE                               0x00000001UL
>> -#define SEM__DESTROY                              0x00000002UL
>> -#define SEM__GETATTR                              0x00000004UL
>> -#define SEM__SETATTR                              0x00000008UL
>> -#define SEM__READ                                 0x00000010UL
>> -#define SEM__WRITE                                0x00000020UL
>> -#define SEM__ASSOCIATE                            0x00000040UL
>> -#define SEM__UNIX_READ                            0x00000080UL
>> -#define SEM__UNIX_WRITE                           0x00000100UL
>> -#define MSGQ__CREATE                              0x00000001UL
>> -#define MSGQ__DESTROY                             0x00000002UL
>> -#define MSGQ__GETATTR                             0x00000004UL
>> -#define MSGQ__SETATTR                             0x00000008UL
>> -#define MSGQ__READ                                0x00000010UL
>> -#define MSGQ__WRITE                               0x00000020UL
>> -#define MSGQ__ASSOCIATE                           0x00000040UL
>> -#define MSGQ__UNIX_READ                           0x00000080UL
>> -#define MSGQ__UNIX_WRITE                          0x00000100UL
>> -#define MSGQ__ENQUEUE                             0x00000200UL
>> -#define MSG__SEND                                 0x00000001UL
>> -#define MSG__RECEIVE                              0x00000002UL
>> -#define SHM__CREATE                               0x00000001UL
>> -#define SHM__DESTROY                              0x00000002UL
>> -#define SHM__GETATTR                              0x00000004UL
>> -#define SHM__SETATTR                              0x00000008UL
>> -#define SHM__READ                                 0x00000010UL
>> -#define SHM__WRITE                                0x00000020UL
>> -#define SHM__ASSOCIATE                            0x00000040UL
>> -#define SHM__UNIX_READ                            0x00000080UL
>> -#define SHM__UNIX_WRITE                           0x00000100UL
>> -#define SHM__LOCK                                 0x00000200UL
>> -#define SECURITY__COMPUTE_AV                      0x00000001UL
>> -#define SECURITY__COMPUTE_CREATE                  0x00000002UL
>> -#define SECURITY__COMPUTE_MEMBER                  0x00000004UL
>> -#define SECURITY__CHECK_CONTEXT                   0x00000008UL
>> -#define SECURITY__LOAD_POLICY                     0x00000010UL
>> -#define SECURITY__COMPUTE_RELABEL                 0x00000020UL
>> -#define SECURITY__COMPUTE_USER                    0x00000040UL
>> -#define SECURITY__SETENFORCE                      0x00000080UL
>> -#define SECURITY__SETBOOL                         0x00000100UL
>> -#define SECURITY__SETSECPARAM                     0x00000200UL
>> -#define SECURITY__SETCHECKREQPROT                 0x00000400UL
>> -#define SYSTEM__IPC_INFO                          0x00000001UL
>> -#define SYSTEM__SYSLOG_READ                       0x00000002UL
>> -#define SYSTEM__SYSLOG_MOD                        0x00000004UL
>> -#define SYSTEM__SYSLOG_CONSOLE                    0x00000008UL
>> -#define CAPABILITY__CHOWN                         0x00000001UL
>> -#define CAPABILITY__DAC_OVERRIDE                  0x00000002UL
>> -#define CAPABILITY__DAC_READ_SEARCH               0x00000004UL
>> -#define CAPABILITY__FOWNER                        0x00000008UL
>> -#define CAPABILITY__FSETID                        0x00000010UL
>> -#define CAPABILITY__KILL                          0x00000020UL
>> -#define CAPABILITY__SETGID                        0x00000040UL
>> -#define CAPABILITY__SETUID                        0x00000080UL
>> -#define CAPABILITY__SETPCAP                       0x00000100UL
>> -#define CAPABILITY__LINUX_IMMUTABLE               0x00000200UL
>> -#define CAPABILITY__NET_BIND_SERVICE              0x00000400UL
>> -#define CAPABILITY__NET_BROADCAST                 0x00000800UL
>> -#define CAPABILITY__NET_ADMIN                     0x00001000UL
>> -#define CAPABILITY__NET_RAW                       0x00002000UL
>> -#define CAPABILITY__IPC_LOCK                      0x00004000UL
>> -#define CAPABILITY__IPC_OWNER                     0x00008000UL
>> -#define CAPABILITY__SYS_MODULE                    0x00010000UL
>> -#define CAPABILITY__SYS_RAWIO                     0x00020000UL
>> -#define CAPABILITY__SYS_CHROOT                    0x00040000UL
>> -#define CAPABILITY__SYS_PTRACE                    0x00080000UL
>> -#define CAPABILITY__SYS_PACCT                     0x00100000UL
>> -#define CAPABILITY__SYS_ADMIN                     0x00200000UL
>> -#define CAPABILITY__SYS_BOOT                      0x00400000UL
>> -#define CAPABILITY__SYS_NICE                      0x00800000UL
>> -#define CAPABILITY__SYS_RESOURCE                  0x01000000UL
>> -#define CAPABILITY__SYS_TIME                      0x02000000UL
>> -#define CAPABILITY__SYS_TTY_CONFIG                0x04000000UL
>> -#define CAPABILITY__MKNOD                         0x08000000UL
>> -#define CAPABILITY__LEASE                         0x10000000UL
>> -#define CAPABILITY__AUDIT_WRITE                   0x20000000UL
>> -#define CAPABILITY__AUDIT_CONTROL                 0x40000000UL
>> -#define CAPABILITY__SETFCAP                       0x80000000UL
>> -#define CAPABILITY2__MAC_OVERRIDE                 0x00000001UL
>> -#define CAPABILITY2__MAC_ADMIN                    0x00000002UL
>> -#define PASSWD__PASSWD                            0x00000001UL
>> -#define PASSWD__CHFN                              0x00000002UL
>> -#define PASSWD__CHSH                              0x00000004UL
>> -#define PASSWD__ROOTOK                            0x00000008UL
>> -#define PASSWD__CRONTAB                           0x00000010UL
>> -#define X_DRAWABLE__CREATE                        0x00000001UL
>> -#define X_DRAWABLE__DESTROY                       0x00000002UL
>> -#define X_DRAWABLE__READ                          0x00000004UL
>> -#define X_DRAWABLE__WRITE                         0x00000008UL
>> -#define X_DRAWABLE__BLEND                         0x00000010UL
>> -#define X_DRAWABLE__GETATTR                       0x00000020UL
>> -#define X_DRAWABLE__SETATTR                       0x00000040UL
>> -#define X_DRAWABLE__LIST_CHILD                    0x00000080UL
>> -#define X_DRAWABLE__ADD_CHILD                     0x00000100UL
>> -#define X_DRAWABLE__REMOVE_CHILD                  0x00000200UL
>> -#define X_DRAWABLE__LIST_PROPERTY                 0x00000400UL
>> -#define X_DRAWABLE__GET_PROPERTY                  0x00000800UL
>> -#define X_DRAWABLE__SET_PROPERTY                  0x00001000UL
>> -#define X_DRAWABLE__MANAGE                        0x00002000UL
>> -#define X_DRAWABLE__OVERRIDE                      0x00004000UL
>> -#define X_DRAWABLE__SHOW                          0x00008000UL
>> -#define X_DRAWABLE__HIDE                          0x00010000UL
>> -#define X_DRAWABLE__SEND                          0x00020000UL
>> -#define X_DRAWABLE__RECEIVE                       0x00040000UL
>> -#define X_SCREEN__GETATTR                         0x00000001UL
>> -#define X_SCREEN__SETATTR                         0x00000002UL
>> -#define X_SCREEN__HIDE_CURSOR                     0x00000004UL
>> -#define X_SCREEN__SHOW_CURSOR                     0x00000008UL
>> -#define X_SCREEN__SAVER_GETATTR                   0x00000010UL
>> -#define X_SCREEN__SAVER_SETATTR                   0x00000020UL
>> -#define X_SCREEN__SAVER_HIDE                      0x00000040UL
>> -#define X_SCREEN__SAVER_SHOW                      0x00000080UL
>> -#define X_GC__CREATE                              0x00000001UL
>> -#define X_GC__DESTROY                             0x00000002UL
>> -#define X_GC__GETATTR                             0x00000004UL
>> -#define X_GC__SETATTR                             0x00000008UL
>> -#define X_GC__USE                                 0x00000010UL
>> -#define X_FONT__CREATE                            0x00000001UL
>> -#define X_FONT__DESTROY                           0x00000002UL
>> -#define X_FONT__GETATTR                           0x00000004UL
>> -#define X_FONT__ADD_GLYPH                         0x00000008UL
>> -#define X_FONT__REMOVE_GLYPH                      0x00000010UL
>> -#define X_FONT__USE                               0x00000020UL
>> -#define X_COLORMAP__CREATE                        0x00000001UL
>> -#define X_COLORMAP__DESTROY                       0x00000002UL
>> -#define X_COLORMAP__READ                          0x00000004UL
>> -#define X_COLORMAP__WRITE                         0x00000008UL
>> -#define X_COLORMAP__GETATTR                       0x00000010UL
>> -#define X_COLORMAP__ADD_COLOR                     0x00000020UL
>> -#define X_COLORMAP__REMOVE_COLOR                  0x00000040UL
>> -#define X_COLORMAP__INSTALL                       0x00000080UL
>> -#define X_COLORMAP__UNINSTALL                     0x00000100UL
>> -#define X_COLORMAP__USE                           0x00000200UL
>> -#define X_PROPERTY__CREATE                        0x00000001UL
>> -#define X_PROPERTY__DESTROY                       0x00000002UL
>> -#define X_PROPERTY__READ                          0x00000004UL
>> -#define X_PROPERTY__WRITE                         0x00000008UL
>> -#define X_PROPERTY__APPEND                        0x00000010UL
>> -#define X_PROPERTY__GETATTR                       0x00000020UL
>> -#define X_PROPERTY__SETATTR                       0x00000040UL
>> -#define X_SELECTION__READ                         0x00000001UL
>> -#define X_SELECTION__WRITE                        0x00000002UL
>> -#define X_SELECTION__GETATTR                      0x00000004UL
>> -#define X_SELECTION__SETATTR                      0x00000008UL
>> -#define X_CURSOR__CREATE                          0x00000001UL
>> -#define X_CURSOR__DESTROY                         0x00000002UL
>> -#define X_CURSOR__READ                            0x00000004UL
>> -#define X_CURSOR__WRITE                           0x00000008UL
>> -#define X_CURSOR__GETATTR                         0x00000010UL
>> -#define X_CURSOR__SETATTR                         0x00000020UL
>> -#define X_CURSOR__USE                             0x00000040UL
>> -#define X_CLIENT__DESTROY                         0x00000001UL
>> -#define X_CLIENT__GETATTR                         0x00000002UL
>> -#define X_CLIENT__SETATTR                         0x00000004UL
>> -#define X_CLIENT__MANAGE                          0x00000008UL
>> -#define X_DEVICE__GETATTR                         0x00000001UL
>> -#define X_DEVICE__SETATTR                         0x00000002UL
>> -#define X_DEVICE__USE                             0x00000004UL
>> -#define X_DEVICE__READ                            0x00000008UL
>> -#define X_DEVICE__WRITE                           0x00000010UL
>> -#define X_DEVICE__GETFOCUS                        0x00000020UL
>> -#define X_DEVICE__SETFOCUS                        0x00000040UL
>> -#define X_DEVICE__BELL                            0x00000080UL
>> -#define X_DEVICE__FORCE_CURSOR                    0x00000100UL
>> -#define X_DEVICE__FREEZE                          0x00000200UL
>> -#define X_DEVICE__GRAB                            0x00000400UL
>> -#define X_DEVICE__MANAGE                          0x00000800UL
>> -#define X_SERVER__GETATTR                         0x00000001UL
>> -#define X_SERVER__SETATTR                         0x00000002UL
>> -#define X_SERVER__RECORD                          0x00000004UL
>> -#define X_SERVER__DEBUG                           0x00000008UL
>> -#define X_SERVER__GRAB                            0x00000010UL
>> -#define X_SERVER__MANAGE                          0x00000020UL
>> -#define X_EXTENSION__QUERY                        0x00000001UL
>> -#define X_EXTENSION__USE                          0x00000002UL
>> -#define X_RESOURCE__READ                          0x00000001UL
>> -#define X_RESOURCE__WRITE                         0x00000002UL
>> -#define X_EVENT__SEND                             0x00000001UL
>> -#define X_EVENT__RECEIVE                          0x00000002UL
>> -#define X_SYNTHETIC_EVENT__SEND                   0x00000001UL
>> -#define X_SYNTHETIC_EVENT__RECEIVE                0x00000002UL
>> -#define NETLINK_ROUTE_SOCKET__IOCTL               0x00000001UL
>> -#define NETLINK_ROUTE_SOCKET__READ                0x00000002UL
>> -#define NETLINK_ROUTE_SOCKET__WRITE               0x00000004UL
>> -#define NETLINK_ROUTE_SOCKET__CREATE              0x00000008UL
>> -#define NETLINK_ROUTE_SOCKET__GETATTR             0x00000010UL
>> -#define NETLINK_ROUTE_SOCKET__SETATTR             0x00000020UL
>> -#define NETLINK_ROUTE_SOCKET__LOCK                0x00000040UL
>> -#define NETLINK_ROUTE_SOCKET__RELABELFROM         0x00000080UL
>> -#define NETLINK_ROUTE_SOCKET__RELABELTO           0x00000100UL
>> -#define NETLINK_ROUTE_SOCKET__APPEND              0x00000200UL
>> -#define NETLINK_ROUTE_SOCKET__BIND                0x00000400UL
>> -#define NETLINK_ROUTE_SOCKET__CONNECT             0x00000800UL
>> -#define NETLINK_ROUTE_SOCKET__LISTEN              0x00001000UL
>> -#define NETLINK_ROUTE_SOCKET__ACCEPT              0x00002000UL
>> -#define NETLINK_ROUTE_SOCKET__GETOPT              0x00004000UL
>> -#define NETLINK_ROUTE_SOCKET__SETOPT              0x00008000UL
>> -#define NETLINK_ROUTE_SOCKET__SHUTDOWN            0x00010000UL
>> -#define NETLINK_ROUTE_SOCKET__RECVFROM            0x00020000UL
>> -#define NETLINK_ROUTE_SOCKET__SENDTO              0x00040000UL
>> -#define NETLINK_ROUTE_SOCKET__RECV_MSG            0x00080000UL
>> -#define NETLINK_ROUTE_SOCKET__SEND_MSG            0x00100000UL
>> -#define NETLINK_ROUTE_SOCKET__NAME_BIND           0x00200000UL
>> -#define NETLINK_ROUTE_SOCKET__NLMSG_READ          0x00400000UL
>> -#define NETLINK_ROUTE_SOCKET__NLMSG_WRITE         0x00800000UL
>> -#define NETLINK_FIREWALL_SOCKET__IOCTL            0x00000001UL
>> -#define NETLINK_FIREWALL_SOCKET__READ             0x00000002UL
>> -#define NETLINK_FIREWALL_SOCKET__WRITE            0x00000004UL
>> -#define NETLINK_FIREWALL_SOCKET__CREATE           0x00000008UL
>> -#define NETLINK_FIREWALL_SOCKET__GETATTR          0x00000010UL
>> -#define NETLINK_FIREWALL_SOCKET__SETATTR          0x00000020UL
>> -#define NETLINK_FIREWALL_SOCKET__LOCK             0x00000040UL
>> -#define NETLINK_FIREWALL_SOCKET__RELABELFROM      0x00000080UL
>> -#define NETLINK_FIREWALL_SOCKET__RELABELTO        0x00000100UL
>> -#define NETLINK_FIREWALL_SOCKET__APPEND           0x00000200UL
>> -#define NETLINK_FIREWALL_SOCKET__BIND             0x00000400UL
>> -#define NETLINK_FIREWALL_SOCKET__CONNECT          0x00000800UL
>> -#define NETLINK_FIREWALL_SOCKET__LISTEN           0x00001000UL
>> -#define NETLINK_FIREWALL_SOCKET__ACCEPT           0x00002000UL
>> -#define NETLINK_FIREWALL_SOCKET__GETOPT           0x00004000UL
>> -#define NETLINK_FIREWALL_SOCKET__SETOPT           0x00008000UL
>> -#define NETLINK_FIREWALL_SOCKET__SHUTDOWN         0x00010000UL
>> -#define NETLINK_FIREWALL_SOCKET__RECVFROM         0x00020000UL
>> -#define NETLINK_FIREWALL_SOCKET__SENDTO           0x00040000UL
>> -#define NETLINK_FIREWALL_SOCKET__RECV_MSG         0x00080000UL
>> -#define NETLINK_FIREWALL_SOCKET__SEND_MSG         0x00100000UL
>> -#define NETLINK_FIREWALL_SOCKET__NAME_BIND        0x00200000UL
>> -#define NETLINK_FIREWALL_SOCKET__NLMSG_READ       0x00400000UL
>> -#define NETLINK_FIREWALL_SOCKET__NLMSG_WRITE      0x00800000UL
>> -#define NETLINK_TCPDIAG_SOCKET__IOCTL             0x00000001UL
>> -#define NETLINK_TCPDIAG_SOCKET__READ              0x00000002UL
>> -#define NETLINK_TCPDIAG_SOCKET__WRITE             0x00000004UL
>> -#define NETLINK_TCPDIAG_SOCKET__CREATE            0x00000008UL
>> -#define NETLINK_TCPDIAG_SOCKET__GETATTR           0x00000010UL
>> -#define NETLINK_TCPDIAG_SOCKET__SETATTR           0x00000020UL
>> -#define NETLINK_TCPDIAG_SOCKET__LOCK              0x00000040UL
>> -#define NETLINK_TCPDIAG_SOCKET__RELABELFROM       0x00000080UL
>> -#define NETLINK_TCPDIAG_SOCKET__RELABELTO         0x00000100UL
>> -#define NETLINK_TCPDIAG_SOCKET__APPEND            0x00000200UL
>> -#define NETLINK_TCPDIAG_SOCKET__BIND              0x00000400UL
>> -#define NETLINK_TCPDIAG_SOCKET__CONNECT           0x00000800UL
>> -#define NETLINK_TCPDIAG_SOCKET__LISTEN            0x00001000UL
>> -#define NETLINK_TCPDIAG_SOCKET__ACCEPT            0x00002000UL
>> -#define NETLINK_TCPDIAG_SOCKET__GETOPT            0x00004000UL
>> -#define NETLINK_TCPDIAG_SOCKET__SETOPT            0x00008000UL
>> -#define NETLINK_TCPDIAG_SOCKET__SHUTDOWN          0x00010000UL
>> -#define NETLINK_TCPDIAG_SOCKET__RECVFROM          0x00020000UL
>> -#define NETLINK_TCPDIAG_SOCKET__SENDTO            0x00040000UL
>> -#define NETLINK_TCPDIAG_SOCKET__RECV_MSG          0x00080000UL
>> -#define NETLINK_TCPDIAG_SOCKET__SEND_MSG          0x00100000UL
>> -#define NETLINK_TCPDIAG_SOCKET__NAME_BIND         0x00200000UL
>> -#define NETLINK_TCPDIAG_SOCKET__NLMSG_READ        0x00400000UL
>> -#define NETLINK_TCPDIAG_SOCKET__NLMSG_WRITE       0x00800000UL
>> -#define NETLINK_NFLOG_SOCKET__IOCTL               0x00000001UL
>> -#define NETLINK_NFLOG_SOCKET__READ                0x00000002UL
>> -#define NETLINK_NFLOG_SOCKET__WRITE               0x00000004UL
>> -#define NETLINK_NFLOG_SOCKET__CREATE              0x00000008UL
>> -#define NETLINK_NFLOG_SOCKET__GETATTR             0x00000010UL
>> -#define NETLINK_NFLOG_SOCKET__SETATTR             0x00000020UL
>> -#define NETLINK_NFLOG_SOCKET__LOCK                0x00000040UL
>> -#define NETLINK_NFLOG_SOCKET__RELABELFROM         0x00000080UL
>> -#define NETLINK_NFLOG_SOCKET__RELABELTO           0x00000100UL
>> -#define NETLINK_NFLOG_SOCKET__APPEND              0x00000200UL
>> -#define NETLINK_NFLOG_SOCKET__BIND                0x00000400UL
>> -#define NETLINK_NFLOG_SOCKET__CONNECT             0x00000800UL
>> -#define NETLINK_NFLOG_SOCKET__LISTEN              0x00001000UL
>> -#define NETLINK_NFLOG_SOCKET__ACCEPT              0x00002000UL
>> -#define NETLINK_NFLOG_SOCKET__GETOPT              0x00004000UL
>> -#define NETLINK_NFLOG_SOCKET__SETOPT              0x00008000UL
>> -#define NETLINK_NFLOG_SOCKET__SHUTDOWN            0x00010000UL
>> -#define NETLINK_NFLOG_SOCKET__RECVFROM            0x00020000UL
>> -#define NETLINK_NFLOG_SOCKET__SENDTO              0x00040000UL
>> -#define NETLINK_NFLOG_SOCKET__RECV_MSG            0x00080000UL
>> -#define NETLINK_NFLOG_SOCKET__SEND_MSG            0x00100000UL
>> -#define NETLINK_NFLOG_SOCKET__NAME_BIND           0x00200000UL
>> -#define NETLINK_XFRM_SOCKET__IOCTL                0x00000001UL
>> -#define NETLINK_XFRM_SOCKET__READ                 0x00000002UL
>> -#define NETLINK_XFRM_SOCKET__WRITE                0x00000004UL
>> -#define NETLINK_XFRM_SOCKET__CREATE               0x00000008UL
>> -#define NETLINK_XFRM_SOCKET__GETATTR              0x00000010UL
>> -#define NETLINK_XFRM_SOCKET__SETATTR              0x00000020UL
>> -#define NETLINK_XFRM_SOCKET__LOCK                 0x00000040UL
>> -#define NETLINK_XFRM_SOCKET__RELABELFROM          0x00000080UL
>> -#define NETLINK_XFRM_SOCKET__RELABELTO            0x00000100UL
>> -#define NETLINK_XFRM_SOCKET__APPEND               0x00000200UL
>> -#define NETLINK_XFRM_SOCKET__BIND                 0x00000400UL
>> -#define NETLINK_XFRM_SOCKET__CONNECT              0x00000800UL
>> -#define NETLINK_XFRM_SOCKET__LISTEN               0x00001000UL
>> -#define NETLINK_XFRM_SOCKET__ACCEPT               0x00002000UL
>> -#define NETLINK_XFRM_SOCKET__GETOPT               0x00004000UL
>> -#define NETLINK_XFRM_SOCKET__SETOPT               0x00008000UL
>> -#define NETLINK_XFRM_SOCKET__SHUTDOWN             0x00010000UL
>> -#define NETLINK_XFRM_SOCKET__RECVFROM             0x00020000UL
>> -#define NETLINK_XFRM_SOCKET__SENDTO               0x00040000UL
>> -#define NETLINK_XFRM_SOCKET__RECV_MSG             0x00080000UL
>> -#define NETLINK_XFRM_SOCKET__SEND_MSG             0x00100000UL
>> -#define NETLINK_XFRM_SOCKET__NAME_BIND            0x00200000UL
>> -#define NETLINK_XFRM_SOCKET__NLMSG_READ           0x00400000UL
>> -#define NETLINK_XFRM_SOCKET__NLMSG_WRITE          0x00800000UL
>> -#define NETLINK_SELINUX_SOCKET__IOCTL             0x00000001UL
>> -#define NETLINK_SELINUX_SOCKET__READ              0x00000002UL
>> -#define NETLINK_SELINUX_SOCKET__WRITE             0x00000004UL
>> -#define NETLINK_SELINUX_SOCKET__CREATE            0x00000008UL
>> -#define NETLINK_SELINUX_SOCKET__GETATTR           0x00000010UL
>> -#define NETLINK_SELINUX_SOCKET__SETATTR           0x00000020UL
>> -#define NETLINK_SELINUX_SOCKET__LOCK              0x00000040UL
>> -#define NETLINK_SELINUX_SOCKET__RELABELFROM       0x00000080UL
>> -#define NETLINK_SELINUX_SOCKET__RELABELTO         0x00000100UL
>> -#define NETLINK_SELINUX_SOCKET__APPEND            0x00000200UL
>> -#define NETLINK_SELINUX_SOCKET__BIND              0x00000400UL
>> -#define NETLINK_SELINUX_SOCKET__CONNECT           0x00000800UL
>> -#define NETLINK_SELINUX_SOCKET__LISTEN            0x00001000UL
>> -#define NETLINK_SELINUX_SOCKET__ACCEPT            0x00002000UL
>> -#define NETLINK_SELINUX_SOCKET__GETOPT            0x00004000UL
>> -#define NETLINK_SELINUX_SOCKET__SETOPT            0x00008000UL
>> -#define NETLINK_SELINUX_SOCKET__SHUTDOWN          0x00010000UL
>> -#define NETLINK_SELINUX_SOCKET__RECVFROM          0x00020000UL
>> -#define NETLINK_SELINUX_SOCKET__SENDTO            0x00040000UL
>> -#define NETLINK_SELINUX_SOCKET__RECV_MSG          0x00080000UL
>> -#define NETLINK_SELINUX_SOCKET__SEND_MSG          0x00100000UL
>> -#define NETLINK_SELINUX_SOCKET__NAME_BIND         0x00200000UL
>> -#define NETLINK_AUDIT_SOCKET__IOCTL               0x00000001UL
>> -#define NETLINK_AUDIT_SOCKET__READ                0x00000002UL
>> -#define NETLINK_AUDIT_SOCKET__WRITE               0x00000004UL
>> -#define NETLINK_AUDIT_SOCKET__CREATE              0x00000008UL
>> -#define NETLINK_AUDIT_SOCKET__GETATTR             0x00000010UL
>> -#define NETLINK_AUDIT_SOCKET__SETATTR             0x00000020UL
>> -#define NETLINK_AUDIT_SOCKET__LOCK                0x00000040UL
>> -#define NETLINK_AUDIT_SOCKET__RELABELFROM         0x00000080UL
>> -#define NETLINK_AUDIT_SOCKET__RELABELTO           0x00000100UL
>> -#define NETLINK_AUDIT_SOCKET__APPEND              0x00000200UL
>> -#define NETLINK_AUDIT_SOCKET__BIND                0x00000400UL
>> -#define NETLINK_AUDIT_SOCKET__CONNECT             0x00000800UL
>> -#define NETLINK_AUDIT_SOCKET__LISTEN              0x00001000UL
>> -#define NETLINK_AUDIT_SOCKET__ACCEPT              0x00002000UL
>> -#define NETLINK_AUDIT_SOCKET__GETOPT              0x00004000UL
>> -#define NETLINK_AUDIT_SOCKET__SETOPT              0x00008000UL
>> -#define NETLINK_AUDIT_SOCKET__SHUTDOWN            0x00010000UL
>> -#define NETLINK_AUDIT_SOCKET__RECVFROM            0x00020000UL
>> -#define NETLINK_AUDIT_SOCKET__SENDTO              0x00040000UL
>> -#define NETLINK_AUDIT_SOCKET__RECV_MSG            0x00080000UL
>> -#define NETLINK_AUDIT_SOCKET__SEND_MSG            0x00100000UL
>> -#define NETLINK_AUDIT_SOCKET__NAME_BIND           0x00200000UL
>> -#define NETLINK_AUDIT_SOCKET__NLMSG_READ          0x00400000UL
>> -#define NETLINK_AUDIT_SOCKET__NLMSG_WRITE         0x00800000UL
>> -#define NETLINK_AUDIT_SOCKET__NLMSG_RELAY         0x01000000UL
>> -#define NETLINK_AUDIT_SOCKET__NLMSG_READPRIV      0x02000000UL
>> -#define NETLINK_AUDIT_SOCKET__NLMSG_TTY_AUDIT     0x04000000UL
>> -#define NETLINK_IP6FW_SOCKET__IOCTL               0x00000001UL
>> -#define NETLINK_IP6FW_SOCKET__READ                0x00000002UL
>> -#define NETLINK_IP6FW_SOCKET__WRITE               0x00000004UL
>> -#define NETLINK_IP6FW_SOCKET__CREATE              0x00000008UL
>> -#define NETLINK_IP6FW_SOCKET__GETATTR             0x00000010UL
>> -#define NETLINK_IP6FW_SOCKET__SETATTR             0x00000020UL
>> -#define NETLINK_IP6FW_SOCKET__LOCK                0x00000040UL
>> -#define NETLINK_IP6FW_SOCKET__RELABELFROM         0x00000080UL
>> -#define NETLINK_IP6FW_SOCKET__RELABELTO           0x00000100UL
>> -#define NETLINK_IP6FW_SOCKET__APPEND              0x00000200UL
>> -#define NETLINK_IP6FW_SOCKET__BIND                0x00000400UL
>> -#define NETLINK_IP6FW_SOCKET__CONNECT             0x00000800UL
>> -#define NETLINK_IP6FW_SOCKET__LISTEN              0x00001000UL
>> -#define NETLINK_IP6FW_SOCKET__ACCEPT              0x00002000UL
>> -#define NETLINK_IP6FW_SOCKET__GETOPT              0x00004000UL
>> -#define NETLINK_IP6FW_SOCKET__SETOPT              0x00008000UL
>> -#define NETLINK_IP6FW_SOCKET__SHUTDOWN            0x00010000UL
>> -#define NETLINK_IP6FW_SOCKET__RECVFROM            0x00020000UL
>> -#define NETLINK_IP6FW_SOCKET__SENDTO              0x00040000UL
>> -#define NETLINK_IP6FW_SOCKET__RECV_MSG            0x00080000UL
>> -#define NETLINK_IP6FW_SOCKET__SEND_MSG            0x00100000UL
>> -#define NETLINK_IP6FW_SOCKET__NAME_BIND           0x00200000UL
>> -#define NETLINK_IP6FW_SOCKET__NLMSG_READ          0x00400000UL
>> -#define NETLINK_IP6FW_SOCKET__NLMSG_WRITE         0x00800000UL
>> -#define NETLINK_DNRT_SOCKET__IOCTL                0x00000001UL
>> -#define NETLINK_DNRT_SOCKET__READ                 0x00000002UL
>> -#define NETLINK_DNRT_SOCKET__WRITE                0x00000004UL
>> -#define NETLINK_DNRT_SOCKET__CREATE               0x00000008UL
>> -#define NETLINK_DNRT_SOCKET__GETATTR              0x00000010UL
>> -#define NETLINK_DNRT_SOCKET__SETATTR              0x00000020UL
>> -#define NETLINK_DNRT_SOCKET__LOCK                 0x00000040UL
>> -#define NETLINK_DNRT_SOCKET__RELABELFROM          0x00000080UL
>> -#define NETLINK_DNRT_SOCKET__RELABELTO            0x00000100UL
>> -#define NETLINK_DNRT_SOCKET__APPEND               0x00000200UL
>> -#define NETLINK_DNRT_SOCKET__BIND                 0x00000400UL
>> -#define NETLINK_DNRT_SOCKET__CONNECT              0x00000800UL
>> -#define NETLINK_DNRT_SOCKET__LISTEN               0x00001000UL
>> -#define NETLINK_DNRT_SOCKET__ACCEPT               0x00002000UL
>> -#define NETLINK_DNRT_SOCKET__GETOPT               0x00004000UL
>> -#define NETLINK_DNRT_SOCKET__SETOPT               0x00008000UL
>> -#define NETLINK_DNRT_SOCKET__SHUTDOWN             0x00010000UL
>> -#define NETLINK_DNRT_SOCKET__RECVFROM             0x00020000UL
>> -#define NETLINK_DNRT_SOCKET__SENDTO               0x00040000UL
>> -#define NETLINK_DNRT_SOCKET__RECV_MSG             0x00080000UL
>> -#define NETLINK_DNRT_SOCKET__SEND_MSG             0x00100000UL
>> -#define NETLINK_DNRT_SOCKET__NAME_BIND            0x00200000UL
>> -#define DBUS__ACQUIRE_SVC                         0x00000001UL
>> -#define DBUS__SEND_MSG                            0x00000002UL
>> -#define NSCD__GETPWD                              0x00000001UL
>> -#define NSCD__GETGRP                              0x00000002UL
>> -#define NSCD__GETHOST                             0x00000004UL
>> -#define NSCD__GETSTAT                             0x00000008UL
>> -#define NSCD__ADMIN                               0x00000010UL
>> -#define NSCD__SHMEMPWD                            0x00000020UL
>> -#define NSCD__SHMEMGRP                            0x00000040UL
>> -#define NSCD__SHMEMHOST                           0x00000080UL
>> -#define NSCD__GETSERV                             0x00000100UL
>> -#define NSCD__SHMEMSERV                           0x00000200UL
>> -#define ASSOCIATION__SENDTO                       0x00000001UL
>> -#define ASSOCIATION__RECVFROM                     0x00000002UL
>> -#define ASSOCIATION__SETCONTEXT                   0x00000004UL
>> -#define ASSOCIATION__POLMATCH                     0x00000008UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__IOCTL      0x00000001UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__READ       0x00000002UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__WRITE      0x00000004UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__CREATE     0x00000008UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__GETATTR    0x00000010UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__SETATTR    0x00000020UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__LOCK       0x00000040UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__RELABELFROM 0x00000080UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__RELABELTO  0x00000100UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__APPEND     0x00000200UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__BIND       0x00000400UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__CONNECT    0x00000800UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__LISTEN     0x00001000UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__ACCEPT     0x00002000UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__GETOPT     0x00004000UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__SETOPT     0x00008000UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__SHUTDOWN   0x00010000UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__RECVFROM   0x00020000UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__SENDTO     0x00040000UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__RECV_MSG   0x00080000UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__SEND_MSG   0x00100000UL
>> -#define NETLINK_KOBJECT_UEVENT_SOCKET__NAME_BIND  0x00200000UL
>> -#define APPLETALK_SOCKET__IOCTL                   0x00000001UL
>> -#define APPLETALK_SOCKET__READ                    0x00000002UL
>> -#define APPLETALK_SOCKET__WRITE                   0x00000004UL
>> -#define APPLETALK_SOCKET__CREATE                  0x00000008UL
>> -#define APPLETALK_SOCKET__GETATTR                 0x00000010UL
>> -#define APPLETALK_SOCKET__SETATTR                 0x00000020UL
>> -#define APPLETALK_SOCKET__LOCK                    0x00000040UL
>> -#define APPLETALK_SOCKET__RELABELFROM             0x00000080UL
>> -#define APPLETALK_SOCKET__RELABELTO               0x00000100UL
>> -#define APPLETALK_SOCKET__APPEND                  0x00000200UL
>> -#define APPLETALK_SOCKET__BIND                    0x00000400UL
>> -#define APPLETALK_SOCKET__CONNECT                 0x00000800UL
>> -#define APPLETALK_SOCKET__LISTEN                  0x00001000UL
>> -#define APPLETALK_SOCKET__ACCEPT                  0x00002000UL
>> -#define APPLETALK_SOCKET__GETOPT                  0x00004000UL
>> -#define APPLETALK_SOCKET__SETOPT                  0x00008000UL
>> -#define APPLETALK_SOCKET__SHUTDOWN                0x00010000UL
>> -#define APPLETALK_SOCKET__RECVFROM                0x00020000UL
>> -#define APPLETALK_SOCKET__SENDTO                  0x00040000UL
>> -#define APPLETALK_SOCKET__RECV_MSG                0x00080000UL
>> -#define APPLETALK_SOCKET__SEND_MSG                0x00100000UL
>> -#define APPLETALK_SOCKET__NAME_BIND               0x00200000UL
>> -#define PACKET__SEND                              0x00000001UL
>> -#define PACKET__RECV                              0x00000002UL
>> -#define PACKET__RELABELTO                         0x00000004UL
>> -#define PACKET__FLOW_IN                           0x00000008UL
>> -#define PACKET__FLOW_OUT                          0x00000010UL
>> -#define PACKET__FORWARD_IN                        0x00000020UL
>> -#define PACKET__FORWARD_OUT                       0x00000040UL
>> -#define KEY__VIEW                                 0x00000001UL
>> -#define KEY__READ                                 0x00000002UL
>> -#define KEY__WRITE                                0x00000004UL
>> -#define KEY__SEARCH                               0x00000008UL
>> -#define KEY__LINK                                 0x00000010UL
>> -#define KEY__SETATTR                              0x00000020UL
>> -#define KEY__CREATE                               0x00000040UL
>> -#define CONTEXT__TRANSLATE                        0x00000001UL
>> -#define CONTEXT__CONTAINS                         0x00000002UL
>> -#define DCCP_SOCKET__IOCTL                        0x00000001UL
>> -#define DCCP_SOCKET__READ                         0x00000002UL
>> -#define DCCP_SOCKET__WRITE                        0x00000004UL
>> -#define DCCP_SOCKET__CREATE                       0x00000008UL
>> -#define DCCP_SOCKET__GETATTR                      0x00000010UL
>> -#define DCCP_SOCKET__SETATTR                      0x00000020UL
>> -#define DCCP_SOCKET__LOCK                         0x00000040UL
>> -#define DCCP_SOCKET__RELABELFROM                  0x00000080UL
>> -#define DCCP_SOCKET__RELABELTO                    0x00000100UL
>> -#define DCCP_SOCKET__APPEND                       0x00000200UL
>> -#define DCCP_SOCKET__BIND                         0x00000400UL
>> -#define DCCP_SOCKET__CONNECT                      0x00000800UL
>> -#define DCCP_SOCKET__LISTEN                       0x00001000UL
>> -#define DCCP_SOCKET__ACCEPT                       0x00002000UL
>> -#define DCCP_SOCKET__GETOPT                       0x00004000UL
>> -#define DCCP_SOCKET__SETOPT                       0x00008000UL
>> -#define DCCP_SOCKET__SHUTDOWN                     0x00010000UL
>> -#define DCCP_SOCKET__RECVFROM                     0x00020000UL
>> -#define DCCP_SOCKET__SENDTO                       0x00040000UL
>> -#define DCCP_SOCKET__RECV_MSG                     0x00080000UL
>> -#define DCCP_SOCKET__SEND_MSG                     0x00100000UL
>> -#define DCCP_SOCKET__NAME_BIND                    0x00200000UL
>> -#define DCCP_SOCKET__NODE_BIND                    0x00400000UL
>> -#define DCCP_SOCKET__NAME_CONNECT                 0x00800000UL
>> -#define MEMPROTECT__MMAP_ZERO                     0x00000001UL
>> -#define DB_DATABASE__CREATE                       0x00000001UL
>> -#define DB_DATABASE__DROP                         0x00000002UL
>> -#define DB_DATABASE__GETATTR                      0x00000004UL
>> -#define DB_DATABASE__SETATTR                      0x00000008UL
>> -#define DB_DATABASE__RELABELFROM                  0x00000010UL
>> -#define DB_DATABASE__RELABELTO                    0x00000020UL
>> -#define DB_DATABASE__ACCESS                       0x00000040UL
>> -#define DB_DATABASE__INSTALL_MODULE               0x00000080UL
>> -#define DB_DATABASE__LOAD_MODULE                  0x00000100UL
>> -#define DB_DATABASE__GET_PARAM                    0x00000200UL
>> -#define DB_DATABASE__SET_PARAM                    0x00000400UL
>> -#define DB_TABLE__CREATE                          0x00000001UL
>> -#define DB_TABLE__DROP                            0x00000002UL
>> -#define DB_TABLE__GETATTR                         0x00000004UL
>> -#define DB_TABLE__SETATTR                         0x00000008UL
>> -#define DB_TABLE__RELABELFROM                     0x00000010UL
>> -#define DB_TABLE__RELABELTO                       0x00000020UL
>> -#define DB_TABLE__USE                             0x00000040UL
>> -#define DB_TABLE__SELECT                          0x00000080UL
>> -#define DB_TABLE__UPDATE                          0x00000100UL
>> -#define DB_TABLE__INSERT                          0x00000200UL
>> -#define DB_TABLE__DELETE                          0x00000400UL
>> -#define DB_TABLE__LOCK                            0x00000800UL
>> -#define DB_PROCEDURE__CREATE                      0x00000001UL
>> -#define DB_PROCEDURE__DROP                        0x00000002UL
>> -#define DB_PROCEDURE__GETATTR                     0x00000004UL
>> -#define DB_PROCEDURE__SETATTR                     0x00000008UL
>> -#define DB_PROCEDURE__RELABELFROM                 0x00000010UL
>> -#define DB_PROCEDURE__RELABELTO                   0x00000020UL
>> -#define DB_PROCEDURE__EXECUTE                     0x00000040UL
>> -#define DB_PROCEDURE__ENTRYPOINT                  0x00000080UL
>> -#define DB_COLUMN__CREATE                         0x00000001UL
>> -#define DB_COLUMN__DROP                           0x00000002UL
>> -#define DB_COLUMN__GETATTR                        0x00000004UL
>> -#define DB_COLUMN__SETATTR                        0x00000008UL
>> -#define DB_COLUMN__RELABELFROM                    0x00000010UL
>> -#define DB_COLUMN__RELABELTO                      0x00000020UL
>> -#define DB_COLUMN__USE                            0x00000040UL
>> -#define DB_COLUMN__SELECT                         0x00000080UL
>> -#define DB_COLUMN__UPDATE                         0x00000100UL
>> -#define DB_COLUMN__INSERT                         0x00000200UL
>> -#define DB_TUPLE__RELABELFROM                     0x00000001UL
>> -#define DB_TUPLE__RELABELTO                       0x00000002UL
>> -#define DB_TUPLE__USE                             0x00000004UL
>> -#define DB_TUPLE__SELECT                          0x00000008UL
>> -#define DB_TUPLE__UPDATE                          0x00000010UL
>> -#define DB_TUPLE__INSERT                          0x00000020UL
>> -#define DB_TUPLE__DELETE                          0x00000040UL
>> -#define DB_BLOB__CREATE                           0x00000001UL
>> -#define DB_BLOB__DROP                             0x00000002UL
>> -#define DB_BLOB__GETATTR                          0x00000004UL
>> -#define DB_BLOB__SETATTR                          0x00000008UL
>> -#define DB_BLOB__RELABELFROM                      0x00000010UL
>> -#define DB_BLOB__RELABELTO                        0x00000020UL
>> -#define DB_BLOB__READ                             0x00000040UL
>> -#define DB_BLOB__WRITE                            0x00000080UL
>> -#define DB_BLOB__IMPORT                           0x00000100UL
>> -#define DB_BLOB__EXPORT                           0x00000200UL
>> -#define PEER__RECV                                0x00000001UL
>> -#define X_APPLICATION_DATA__PASTE                 0x00000001UL
>> -#define X_APPLICATION_DATA__PASTE_AFTER_CONFIRM   0x00000002UL
>> -#define X_APPLICATION_DATA__COPY                  0x00000004UL
>> diff --git a/libselinux/include/selinux/flask.h b/libselinux/include/selinux/flask.h
>> deleted file mode 100644
>> index 812822373b0e..000000000000
>> --- a/libselinux/include/selinux/flask.h
>> +++ /dev/null
>> @@ -1,118 +0,0 @@
>> -/* This file is automatically generated.  Do not edit. */
>> -#ifndef _SELINUX_FLASK_H_
>> -#define _SELINUX_FLASK_H_
>> -
>> -#warning "Please remove any #include's of this header in your source code."
>> -#warning "Instead, use string_to_security_class() to map the class name to a value."
>> -
>> -/*
>> - * Security object class definitions
>> - */
>> -#define SECCLASS_SECURITY                                1
>> -#define SECCLASS_PROCESS                                 2
>> -#define SECCLASS_SYSTEM                                  3
>> -#define SECCLASS_CAPABILITY                              4
>> -#define SECCLASS_FILESYSTEM                              5
>> -#define SECCLASS_FILE                                    6
>> -#define SECCLASS_DIR                                     7
>> -#define SECCLASS_FD                                      8
>> -#define SECCLASS_LNK_FILE                                9
>> -#define SECCLASS_CHR_FILE                                10
>> -#define SECCLASS_BLK_FILE                                11
>> -#define SECCLASS_SOCK_FILE                               12
>> -#define SECCLASS_FIFO_FILE                               13
>> -#define SECCLASS_SOCKET                                  14
>> -#define SECCLASS_TCP_SOCKET                              15
>> -#define SECCLASS_UDP_SOCKET                              16
>> -#define SECCLASS_RAWIP_SOCKET                            17
>> -#define SECCLASS_NODE                                    18
>> -#define SECCLASS_NETIF                                   19
>> -#define SECCLASS_NETLINK_SOCKET                          20
>> -#define SECCLASS_PACKET_SOCKET                           21
>> -#define SECCLASS_KEY_SOCKET                              22
>> -#define SECCLASS_UNIX_STREAM_SOCKET                      23
>> -#define SECCLASS_UNIX_DGRAM_SOCKET                       24
>> -#define SECCLASS_SEM                                     25
>> -#define SECCLASS_MSG                                     26
>> -#define SECCLASS_MSGQ                                    27
>> -#define SECCLASS_SHM                                     28
>> -#define SECCLASS_IPC                                     29
>> -#define SECCLASS_PASSWD                                  30
>> -#define SECCLASS_X_DRAWABLE                              31
>> -#define SECCLASS_X_SCREEN                                32
>> -#define SECCLASS_X_GC                                    33
>> -#define SECCLASS_X_FONT                                  34
>> -#define SECCLASS_X_COLORMAP                              35
>> -#define SECCLASS_X_PROPERTY                              36
>> -#define SECCLASS_X_SELECTION                             37
>> -#define SECCLASS_X_CURSOR                                38
>> -#define SECCLASS_X_CLIENT                                39
>> -#define SECCLASS_X_DEVICE                                40
>> -#define SECCLASS_X_SERVER                                41
>> -#define SECCLASS_X_EXTENSION                             42
>> -#define SECCLASS_NETLINK_ROUTE_SOCKET                    43
>> -#define SECCLASS_NETLINK_FIREWALL_SOCKET                 44
>> -#define SECCLASS_NETLINK_TCPDIAG_SOCKET                  45
>> -#define SECCLASS_NETLINK_NFLOG_SOCKET                    46
>> -#define SECCLASS_NETLINK_XFRM_SOCKET                     47
>> -#define SECCLASS_NETLINK_SELINUX_SOCKET                  48
>> -#define SECCLASS_NETLINK_AUDIT_SOCKET                    49
>> -#define SECCLASS_NETLINK_IP6FW_SOCKET                    50
>> -#define SECCLASS_NETLINK_DNRT_SOCKET                     51
>> -#define SECCLASS_DBUS                                    52
>> -#define SECCLASS_NSCD                                    53
>> -#define SECCLASS_ASSOCIATION                             54
>> -#define SECCLASS_NETLINK_KOBJECT_UEVENT_SOCKET           55
>> -#define SECCLASS_APPLETALK_SOCKET                        56
>> -#define SECCLASS_PACKET                                  57
>> -#define SECCLASS_KEY                                     58
>> -#define SECCLASS_CONTEXT                                 59
>> -#define SECCLASS_DCCP_SOCKET                             60
>> -#define SECCLASS_MEMPROTECT                              61
>> -#define SECCLASS_DB_DATABASE                             62
>> -#define SECCLASS_DB_TABLE                                63
>> -#define SECCLASS_DB_PROCEDURE                            64
>> -#define SECCLASS_DB_COLUMN                               65
>> -#define SECCLASS_DB_TUPLE                                66
>> -#define SECCLASS_DB_BLOB                                 67
>> -#define SECCLASS_PEER                                    68
>> -#define SECCLASS_CAPABILITY2                             69
>> -#define SECCLASS_X_RESOURCE                              70
>> -#define SECCLASS_X_EVENT                                 71
>> -#define SECCLASS_X_SYNTHETIC_EVENT                       72
>> -#define SECCLASS_X_APPLICATION_DATA                      73
>> -
>> -/*
>> - * Security identifier indices for initial entities
>> - */
>> -#define SECINITSID_KERNEL                               1
>> -#define SECINITSID_SECURITY                             2
>> -#define SECINITSID_UNLABELED                            3
>> -#define SECINITSID_FS                                   4
>> -#define SECINITSID_FILE                                 5
>> -#define SECINITSID_FILE_LABELS                          6
>> -#define SECINITSID_INIT                                 7
>> -#define SECINITSID_ANY_SOCKET                           8
>> -#define SECINITSID_PORT                                 9
>> -#define SECINITSID_NETIF                                10
>> -#define SECINITSID_NETMSG                               11
>> -#define SECINITSID_NODE                                 12
>> -#define SECINITSID_IGMP_PACKET                          13
>> -#define SECINITSID_ICMP_SOCKET                          14
>> -#define SECINITSID_TCP_SOCKET                           15
>> -#define SECINITSID_SYSCTL_MODPROBE                      16
>> -#define SECINITSID_SYSCTL                               17
>> -#define SECINITSID_SYSCTL_FS                            18
>> -#define SECINITSID_SYSCTL_KERNEL                        19
>> -#define SECINITSID_SYSCTL_NET                           20
>> -#define SECINITSID_SYSCTL_NET_UNIX                      21
>> -#define SECINITSID_SYSCTL_VM                            22
>> -#define SECINITSID_SYSCTL_DEV                           23
>> -#define SECINITSID_KMOD                                 24
>> -#define SECINITSID_POLICY                               25
>> -#define SECINITSID_SCMP_PACKET                          26
>> -#define SECINITSID_DEVNULL                              27
>> -
>> -#define SECINITSID_NUM                                  27
>> -
>> -#endif


-- 
()  ascii ribbon campaign - against html e-mail 
/\  www.asciiribbon.org   - against proprietary attachments

