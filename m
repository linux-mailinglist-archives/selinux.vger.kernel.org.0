Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9D1AEDF4
	for <lists+selinux@lfdr.de>; Tue, 10 Sep 2019 17:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387701AbfIJO77 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 10 Sep 2019 10:59:59 -0400
Received: from UPDC19PA23.eemsg.mail.mil ([214.24.27.198]:61776 "EHLO
        UPDC19PA23.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388558AbfIJO77 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 10 Sep 2019 10:59:59 -0400
X-EEMSG-check-017: 12649280|UPDC19PA23_ESA_OUT05.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.64,489,1559520000"; 
   d="scan'208";a="12649280"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
  by UPDC19PA23.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 10 Sep 2019 14:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1568127589; x=1599663589;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=IsCpeE+TQj3jIf+ro9OOUBEGcD+jyv0QvY76QmOVBuw=;
  b=Ko8Mga8tAV90CVdxW2wIlbyOn6llud8KdQID3YkvrPw3TLSB7zRvl7Kg
   DPrE+YjI2EbFJTX5iaAt+ZmGC6aaa84WU1VoH53SXL8PMnJ5WsEmLcRcz
   qbQTW20eppBOgANr7IO5W0yF79e9B9ga8jowMvpV9V+ewPjYR8GS9guQ0
   7Th/AvUnocyIR29XzeW32gA+0xTu8T9ZFzmETemYtoaq3XXvCVKl3SGzy
   VDLNQBCaz6NIMeUO9C6VmG6eraWSGdp1UY4RkHsFh7YKATZAux1RRL+L+
   EQkN/bdItfq15+8Wd8iAURb/1tMW++JpkkYxAZfuhnAXWXP577LoF8SzT
   Q==;
X-IronPort-AV: E=Sophos;i="5.64,489,1559520000"; 
   d="scan'208";a="32628456"
IronPort-PHdr: =?us-ascii?q?9a23=3ALlovuRcUY7GsAQQLIVEYLDxklGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxc26ZxeN2/xhgRfzUJnB7Loc0qyK6vumATRLvMfJ8ChbNsAVDV?=
 =?us-ascii?q?ld0YRetjdjKfbNMVf8Iv/uYn5yN+V5f3ghwUuGN1NIEt31fVzYry76xzcTHh?=
 =?us-ascii?q?LiKVg9fbytScbdgMutyu+95YDYbRlWizqhe7NyKwi9oRnMusUMjoZuN6g8xg?=
 =?us-ascii?q?HVrndUdOhbxWdlLk+Xkxrg+8u85pFu/zlOt/4768JMTaD2dLkkQLJFCzgrL3?=
 =?us-ascii?q?o779DxuxnZSguP6HocUmEInRdNHgPI8hL0UIrvvyXjruZy1zWUMsPwTbAvRD?=
 =?us-ascii?q?St9LxrRwPyiCcGLDE27mfagdFtga1BoRKhoxt/w5PIYIyQKfFzcL/Rcc8cSG?=
 =?us-ascii?q?FcRctaSTBPDZ2gYIsOF+oBPPhXr4/hp1sVsBCyARCgCP7zxjNUg3P726M10/?=
 =?us-ascii?q?4lEQrbwgIuGdwAu2nQoNnsKqsfVeW5wa/VxjvBcvxWwy/w5pXIfB4/r/GCXr?=
 =?us-ascii?q?x+fsTexkYtCwzLgU6dqZDmMj6PyugBr2aW4uhmWOmyi2AnsQZxoj23y8kxlo?=
 =?us-ascii?q?nGmJoVylDa+iV/3Y07ONi4R1R/Yd6gDpRRtzyROoxtQsw/WGFlozo6y70atp?=
 =?us-ascii?q?67eygG0pInxwXFZPCdfIiI5QzjWf+XLDxlinxlf7e/iAyz8Uim0uDzS9e70F?=
 =?us-ascii?q?hUoSpDidnDqGwC2wbV6siDUvdy41mu1i2O1w/J7OFIO0c0lbDUK5Mn37U+lY?=
 =?us-ascii?q?ITvFzeEiL5l0j6lq+belg+9uS25OnrfK/qqoKaOoRpkA/xKL4ulda6AekgNw?=
 =?us-ascii?q?gOWHWU9vqk2b34+E35XK1KjvorkqnFqJzaJdoUpqq+AwJNzoYs8Qy/Dza70N?=
 =?us-ascii?q?QDh3UHMFJEdw6Hj4juIV3OJuz3DeyjjFi2lTdrxvTGMqXgApXLMHfDjK/sca?=
 =?us-ascii?q?ty5kNT0gY+zc1T64hKBrwOPv7/QFL9uMTdDhAjMgy0x+jnCM961oMbQW+PGb?=
 =?us-ascii?q?KWMLjJvF+U5uMgP+mMZIgPtDb7MPgq/eTijXA+mV8DZaWpx4cYaGikHvR6JE?=
 =?us-ascii?q?WUeWfjgtAEEWcLuAo+TfDliF6YXT5cfXayXqw85i0gBY27E4jDSJ6igLqa3C?=
 =?us-ascii?q?ilApJafGZGClSUG3fya4qEQ+sMaD6VIsJ5ijwLT6WhS4s62BG2rgD61r5nIv?=
 =?us-ascii?q?PR+i0fspLjzsZ66/fPmhE18Dx+F96d3H2VT2FogmMIQCc73Lthrkx5y1eD17?=
 =?us-ascii?q?V4gvNDGNxN6PNGTB06OYTfz+NkEdDyXBzOftOTRFahWNWmDmJ5ctVk79gLYk?=
 =?us-ascii?q?B8ENbqoQrC0TbiV7MSkr2NBZc3tK3G3nbtD8pwxXvAz6QqyV8iFJhhL2qj05?=
 =?us-ascii?q?Vj+hDTCoiBqECQk6KnZOxIxyLW3HuSxmqJ+kdDWUh/VruTDiNXXVffsdmsvh?=
 =?us-ascii?q?CKdLSpE7lyd1IbmMM=3D?=
X-IPAS-Result: =?us-ascii?q?A2ATAAB6uXdd/wHyM5BkGwEBAQEDAQEBBwMBAQGBUwYBA?=
 =?us-ascii?q?QELAYFtKm1SATIqhCGIHIdEAQMGgTaJc48rgXsJAQEBAQEBAQEBLQcBAgEBh?=
 =?us-ascii?q?D8CgkkjNAkOAgwBAQEEAQEBAQEGAwEBbIUuDII6KQGCZwEFGgkPAQVBEAkCG?=
 =?us-ascii?q?AICJgICVwYNBgIBAYJTDD8BgXYUD4tDm2+BMoQ2AYRCgUmBDCgBi3cYeIEHg?=
 =?us-ascii?q?REngms+gkgZBBiBAUaDC4JYBIw4DwsGijiVN4IrgiyEVYUNiGMGG4I0gi6JM?=
 =?us-ascii?q?4ZVhCCPN4ZMkmQ4gVgrCAIYCCEPgycJgkUXhFODbCSFWyQDMAEJfAEBjFuCR?=
 =?us-ascii?q?QEB?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
  by emsm-gh1-uea11.NCSC.MIL with ESMTP; 10 Sep 2019 14:59:47 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id x8AExlDi027791;
        Tue, 10 Sep 2019 10:59:47 -0400
Subject: Re: [PATCH] selinux-testsuite: add tests for fsnotify
From:   Stephen Smalley <sds@tycho.nsa.gov>
To:     Dominick Grift <dominick.grift@defensec.nl>
Cc:     Aaron Goidel <acgoide@tycho.nsa.gov>, paul@paul-moore.com,
        selinux@vger.kernel.org
References: <20190710133917.1188-1-acgoide@tycho.nsa.gov>
 <20190910055926.GA963995@brutus.lan>
 <3e584347-f97f-eb00-3291-2ce666e50918@tycho.nsa.gov>
 <20190910141517.GA1058184@brutus.lan>
 <d6636549-d91c-d4d2-4478-9aa3c8e023df@tycho.nsa.gov>
 <76c7a2f2-ccc3-46bf-bf1c-ef11a039536e@tycho.nsa.gov>
Message-ID: <b9cdbda9-af04-ddc5-6e17-040c74da7518@tycho.nsa.gov>
Date:   Tue, 10 Sep 2019 10:59:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <76c7a2f2-ccc3-46bf-bf1c-ef11a039536e@tycho.nsa.gov>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 9/10/19 10:54 AM, Stephen Smalley wrote:
> On 9/10/19 10:40 AM, Stephen Smalley wrote:
>> On 9/10/19 10:15 AM, Dominick Grift wrote:
>>> On Tue, Sep 10, 2019 at 08:26:57AM -0400, Stephen Smalley wrote:
>>>> On 9/10/19 1:59 AM, Dominick Grift wrote:
>>>>> On Wed, Jul 10, 2019 at 09:39:17AM -0400, Aaron Goidel wrote:
>>>>>> Added a suite to test permissions for setting inotify and fanotify 
>>>>>> watches
>>>>>> on filesystem objects. Tests watch, watch_with_perm, and 
>>>>>> watch_reads permissions.
>>>>>
>>>>> Ive also "tested" the fsnotify patch. And my tests indicate that 
>>>>> this might cause issues:
>>>>>
>>>>> I added the access vectors to my policy, but on older systems 
>>>>> (debian 10) cron fails to start
>>>>> cron needs the "entrypoint" permission on /etc/crontab but it looks 
>>>>> like appending the "watch" access vectors to common-file disrupted 
>>>>> the ordering
>>>>> The result is that now i have to allow cron to "watch_read" 
>>>>> /etc/crontab even though the neither kernel nor selinux user space 
>>>>> are aware of the fsnotify access vectors
>>>>> It seems the cron selinux code got confused and now thinks 
>>>>> watch_read is entrypoint (its using selinux code to determine 
>>>>> whether it can manually transition to cronjob domains on crontabs)
>>>>>
>>>>> I am hoping this issue with resolve itself on systems with kernels 
>>>>> and user spaces that suppose fsnotify.
>>>>> However unless i am overlooking something this is still likely to 
>>>>> disrupt compatibility
>>>>
>>>> So, IIUC, the issue is that:
>>>> a) older cron was directly using the fixed FILE__ENTRYPOINT 
>>>> definition from
>>>> libselinux in a security_compute_av() call rather than dynamically 
>>>> looking
>>>> up entrypoint permission,
>>>> b) the value of the file entrypoint permission in policy has changed 
>>>> because
>>>> you updated your policy and chose to place the watch* permissions in 
>>>> the
>>>> common file definition to match the kernel.
>>>>
>>>> Note that you could have instead sprinkled copies of the watch* 
>>>> permissions
>>>> across all of the individual file/dir/*_file classes and placed them 
>>>> at the
>>>> end of the classes if you wanted to avoid this compatibility issue.  
>>>> The
>>>> policy and kernel definitions no longer need to be identical; the 
>>>> kernel
>>>> will dynamically map between them for its own permission checks.
>>>>
>>>> Also, this should have already been broken for you when map 
>>>> permission was
>>>> added, which would have shown up as execute_no_trans being checked 
>>>> instead
>>>> of entrypoint.  This was already filed as a bug on cron in debian here:
>>>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=924716
>>>>
>>>> So, wrt compatibility, IIUC:
>>>> - the kernel change does not break compatibility for old policy + old
>>>> userspace,
>>>> - new policy can choose to add the new permissions in a 
>>>> backward-compatible
>>>> manner if desired, although refpolicy has already chosen not to do 
>>>> this for
>>>> map permission,
>>>> - the offending code in cron produces build warnings that were 
>>>> introduced in
>>>> 2014 in libselinux to update their code to use the dynamic class/perm
>>>> mapping support, which would resolve the issue.
>>>
>>> this does not work (cron[8934]: ((null)) ENTRYPOINT FAILED): 
>>> https://defensec.nl/gitweb/dssp2.git/commitdiff/914b1d5366922f92435cba780519c5d2bb9f4f7d 
>>>
>>>
>>> [kcinimod@brutus dssp2 (master=)]$ seinfo policy.31 -x --common 
>>> common_file
>>>
>>> Commons: 1
>>>     common common_file
>>> {
>>>          append
>>>          lock
>>>          mounton
>>>          unlink
>>>          read
>>>          create
>>>          quotaon
>>>          execute
>>>          setattr
>>>          map
>>>          relabelto
>>>          rename
>>>          link
>>>          ioctl
>>>          getattr
>>>          relabelfrom
>>> }
>>> [kcinimod@brutus dssp2 (master=)]$ seinfo policy.31 -xcfile
>>>
>>> Classes: 1
>>>     class file
>>> inherits common_file
>>> {
>>>          execmod
>>>          watch
>>>          write
>>>          watch_reads
>>>          execute_no_trans
>>>          watch_mount
>>>          watch_with_perm
>>>          open
>>>          watch_sb
>>>          audit_access
>>>          entrypoint
>>> }
>>
>> If you want to preserve compatibility with userspace using fixed 
>> definitions of FILE__ENTRYPOINT, then you have to insert any new file 
>> permissions after the current entrypoint permission in the class file. 
>> So watch and friends have to go after it, not before it.
>>
>> Also, since the kernel always uses FILE__WATCH* in the check code 
>> rather than distinguishing by class, the watch* permissions need to be 
>> at the same offset in all of the file classes.  The same is true of 
>> the other file permissions.  It looks like you may have other 
>> permissions out of sync across the file classes e.g. execmod, open, 
>> audit_access, that need to be aligned or the kernel could check the 
>> wrong permission.
> 
> Sorry, the last para isn't correct - it should get mapped correctly per 
> class.  But you do need to add the permissions after entrypoint in the 
> file class to avoid displacing its value.

Also, it looks like your file class permission order differs in other 
incompatible ways. If you want it to be compatible with the deprecated 
libselinux headers, the requisite order would be:
class file
inherits common_file
{
	execute_no_trans
	entrypoint
	execmod
	open
	audit_access
	map
}

> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Aaron Goidel <acgoide@tycho.nsa.gov>
>>>>>> ---
>>>>>>    policy/Makefile              |   4 ++
>>>>>>    policy/test_notify.te        |  74 ++++++++++++++++++++++++
>>>>>>    tests/Makefile               |   4 ++
>>>>>>    tests/notify/Makefile        |   5 ++
>>>>>>    tests/notify/test            | 101 
>>>>>> +++++++++++++++++++++++++++++++++
>>>>>>    tests/notify/test_fanotify.c | 105 
>>>>>> +++++++++++++++++++++++++++++++++++
>>>>>>    tests/notify/test_inotify.c  |  43 ++++++++++++++
>>>>>>    7 files changed, 336 insertions(+)
>>>>>>    create mode 100644 policy/test_notify.te
>>>>>>    create mode 100644 tests/notify/Makefile
>>>>>>    create mode 100755 tests/notify/test
>>>>>>    create mode 100644 tests/notify/test_fanotify.c
>>>>>>    create mode 100644 tests/notify/test_inotify.c
>>>>>>
>>>>>> diff --git a/policy/Makefile b/policy/Makefile
>>>>>> index 305b572..65f88c5 100644
>>>>>> --- a/policy/Makefile
>>>>>> +++ b/policy/Makefile
>>>>>> @@ -71,6 +71,10 @@ ifeq ($(shell grep -q 
>>>>>> corenet_sctp_bind_all_nodes $(POLDEV)/include/kernel/coren
>>>>>>    TARGETS += test_sctp.te
>>>>>>    endif
>>>>>> +ifeq ($(shell grep -q all_file_perms.*watch 
>>>>>> $(POLDEV)/include/support/all_perms.spt && echo true),true)
>>>>>> +TARGETS+=test_notify.te
>>>>>> +endif
>>>>>> +
>>>>>>    ifeq (x$(DISTRO),$(filter x$(DISTRO),xRHEL4 xRHEL5 xRHEL6))
>>>>>>    TARGETS:=$(filter-out test_overlayfs.te test_mqueue.te, 
>>>>>> $(TARGETS))
>>>>>>    endif
>>>>>> diff --git a/policy/test_notify.te b/policy/test_notify.te
>>>>>> new file mode 100644
>>>>>> index 0000000..8ba6f1a
>>>>>> --- /dev/null
>>>>>> +++ b/policy/test_notify.te
>>>>>> @@ -0,0 +1,74 @@
>>>>>> +####################################################
>>>>>> +# Policy for testing inoftify and fanotify watches #
>>>>>> +####################################################
>>>>>> +
>>>>>> +attribute test_notify_domain;
>>>>>> +
>>>>>> +# Type for the file on which we want to set a watch
>>>>>> +type test_notify_file_t;
>>>>>> +files_type(test_notify_file_t);
>>>>>> +
>>>>>> +# Domain for the process which CAN set a non-permission watch
>>>>>> +type test_watch_t;
>>>>>> +domain_type(test_watch_t);
>>>>>> +unconfined_runs_test(test_watch_t);
>>>>>> +
>>>>>> +typeattribute test_watch_t test_notify_domain;
>>>>>> +typeattribute test_watch_t testdomain;
>>>>>> +
>>>>>> +allow test_notify_domain self:capability sys_admin;
>>>>>> +
>>>>>> +allow test_watch_t test_notify_file_t:file { read write open 
>>>>>> watch };
>>>>>> +
>>>>>> +# Domain for the process which CAN set a NON-access watch on a file
>>>>>> +type test_perm_watch_t;
>>>>>> +domain_type(test_perm_watch_t);
>>>>>> +unconfined_runs_test(test_perm_watch_t);
>>>>>> +
>>>>>> +typeattribute test_perm_watch_t test_notify_domain;
>>>>>> +typeattribute test_perm_watch_t testdomain;
>>>>>> +
>>>>>> +allow test_perm_watch_t test_notify_file_t:file { read write open 
>>>>>> watch watch_with_perm };
>>>>>> +
>>>>>> +# Domain which CAN set a NON-perm watch which MAY read accesses
>>>>>> +type test_read_watch_t;
>>>>>> +domain_type(test_read_watch_t);
>>>>>> +unconfined_runs_test(test_read_watch_t);
>>>>>> +
>>>>>> +typeattribute test_read_watch_t test_notify_domain;
>>>>>> +typeattribute test_read_watch_t testdomain;
>>>>>> +
>>>>>> +allow test_read_watch_t test_notify_file_t:file { read write open 
>>>>>> watch watch_reads };
>>>>>> +
>>>>>> +# Domain which CAN set any watch which CAN read accesses
>>>>>> +type test_perm_read_watch_t;
>>>>>> +domain_type(test_perm_read_watch_t);
>>>>>> +unconfined_runs_test(test_perm_read_watch_t);
>>>>>> +
>>>>>> +typeattribute test_perm_read_watch_t test_notify_domain;
>>>>>> +typeattribute test_perm_read_watch_t testdomain;
>>>>>> +
>>>>>> +allow test_perm_read_watch_t test_notify_file_t:file { read write 
>>>>>> open watch watch_with_perm watch_reads };
>>>>>> +
>>>>>> +# Domain which CANNOT set any watches
>>>>>> +type test_no_watch_t;
>>>>>> +domain_type(test_no_watch_t);
>>>>>> +unconfined_runs_test(test_no_watch_t);
>>>>>> +
>>>>>> +typeattribute test_no_watch_t test_notify_domain;
>>>>>> +typeattribute test_no_watch_t testdomain;
>>>>>> +
>>>>>> +allow test_no_watch_t test_notify_file_t:file { read write open };
>>>>>> +
>>>>>> +# Domain which has no write access but can watch
>>>>>> +type test_rdonly_t;
>>>>>> +domain_type(test_rdonly_t);
>>>>>> +unconfined_runs_test(test_rdonly_t);
>>>>>> +
>>>>>> +typeattribute test_rdonly_t test_notify_domain;
>>>>>> +typeattribute test_rdonly_t testdomain;
>>>>>> +
>>>>>> +allow test_rdonly_t test_notify_file_t:file { read open watch };
>>>>>> +
>>>>>> +miscfiles_domain_entry_test_files(test_notify_domain);
>>>>>> +userdom_sysadm_entry_spec_domtrans_to(test_notify_domain);
>>>>>> diff --git a/tests/Makefile b/tests/Makefile
>>>>>> index 63aa325..b99c96e 100644
>>>>>> --- a/tests/Makefile
>>>>>> +++ b/tests/Makefile
>>>>>> @@ -50,6 +50,10 @@ ifeq ($(shell grep 
>>>>>> "^SELINUX_INFINIBAND_PKEY_TEST=" infiniband_pkey/ibpkey_test.
>>>>>>    SUBDIRS += infiniband_pkey
>>>>>>    endif
>>>>>> +ifeq ($(shell grep -q all_file_perms.*watch 
>>>>>> $(POLDEV)/include/support/all_perms.spt && echo true),true)
>>>>>> +SUBDIRS+=notify
>>>>>> +endif
>>>>>> +
>>>>>>    ifeq ($(DISTRO),RHEL4)
>>>>>>        SUBDIRS:=$(filter-out bounds dyntrace dyntrans inet_socket 
>>>>>> mmap nnp_nosuid overlay unix_socket, $(SUBDIRS))
>>>>>>    endif
>>>>>> diff --git a/tests/notify/Makefile b/tests/notify/Makefile
>>>>>> new file mode 100644
>>>>>> index 0000000..78c4b3b
>>>>>> --- /dev/null
>>>>>> +++ b/tests/notify/Makefile
>>>>>> @@ -0,0 +1,5 @@
>>>>>> +TARGETS=test_inotify test_fanotify
>>>>>> +
>>>>>> +all: $(TARGETS)
>>>>>> +clean:
>>>>>> +    rm -f $(TARGETS)
>>>>>> diff --git a/tests/notify/test b/tests/notify/test
>>>>>> new file mode 100755
>>>>>> index 0000000..21f03de
>>>>>> --- /dev/null
>>>>>> +++ b/tests/notify/test
>>>>>> @@ -0,0 +1,101 @@
>>>>>> +#!/usr/bin/perl
>>>>>> +
>>>>>> +use Test;
>>>>>> +BEGIN { plan tests => 14 }    # number of tests to run
>>>>>> +
>>>>>> +# help the test script locate itself
>>>>>> +$basedir = $0;
>>>>>> +$basedir =~ s|(.*)/[^/]*|$1|;
>>>>>> +
>>>>>> +# Get rid of a testfile from last run if it's there (just in case)
>>>>>> +system("rm -f $basedir/watch_me");
>>>>>> +
>>>>>> +# Create a new test file
>>>>>> +system("touch $basedir/watch_me");
>>>>>> +system("chcon -t test_notify_file_t $basedir/watch_me");
>>>>>> +
>>>>>> +## TESTS
>>>>>> +
>>>>>> +## TEST BASIC WATCH PERMISSION
>>>>>> +# Should be able to set inotify watch
>>>>>> +$exit_val =
>>>>>> +  system("runcon -t test_watch_t $basedir/test_inotify 
>>>>>> $basedir/watch_me 2>&1");
>>>>>> +ok( $exit_val, 0 );
>>>>>> +
>>>>>> +# Should be able to set non-permissions based fanotify watch
>>>>>> +$exit_val = system(
>>>>>> +    "runcon -t test_watch_t $basedir/test_fanotify 
>>>>>> $basedir/watch_me 2>&1");
>>>>>> +ok( $exit_val, 0 );
>>>>>> +
>>>>>> +# Should NOT be able to set permission based fanotify watch
>>>>>> +$exit_val = system(
>>>>>> +    "runcon -t test_watch_t $basedir/test_fanotify -p 
>>>>>> $basedir/watch_me 2>&1");
>>>>>> +ok($exit_val);    # this should fail
>>>>>> +
>>>>>> +# Should NOT be able to set read based fanotify watch
>>>>>> +$exit_val = system(
>>>>>> +    "runcon -t test_watch_t $basedir/test_fanotify -r 
>>>>>> $basedir/watch_me 2>&1");
>>>>>> +ok($exit_val);    # this should fail
>>>>>> +
>>>>>> +# Should NOT be able to set read based inotify watch
>>>>>> +$exit_val = system(
>>>>>> +    "runcon -t test_watch_t $basedir/test_inotify -r 
>>>>>> $basedir/watch_me 2>&1");
>>>>>> +ok($exit_val);    # this should fail
>>>>>> +
>>>>>> +## TEST PERM WATCH
>>>>>> +# Should be able to set permission based fanotify watch
>>>>>> +$exit_val = system(
>>>>>> +"runcon -t test_perm_watch_t $basedir/test_fanotify -p 
>>>>>> $basedir/watch_me 2>&1"
>>>>>> +);
>>>>>> +ok( $exit_val, 0 );
>>>>>> +
>>>>>> +# Should NOT be able to set watch of accesses
>>>>>> +$exit_val = system(
>>>>>> +"runcon -t test_perm_watch_t $basedir/test_fanotify -r 
>>>>>> $basedir/watch_me 2>&1"
>>>>>> +);
>>>>>> +ok($exit_val);    # this should fail
>>>>>> +
>>>>>> +## TEST READ NO PERM WATCH PERMSISSIONS
>>>>>> +# Should NOT be able to set read and perm watch
>>>>>> +$exit_val = system(
>>>>>> +"runcon -t test_read_watch_t $basedir/test_fanotify -p -r 
>>>>>> $basedir/watch_me 2>&1"
>>>>>> +);
>>>>>> +ok($exit_val);    # should fail
>>>>>> +
>>>>>> +# Should be able to set read inotify watch
>>>>>> +$exit_val = system(
>>>>>> +"runcon -t test_read_watch_t $basedir/test_inotify -r 
>>>>>> $basedir/watch_me 2>&1"
>>>>>> +);
>>>>>> +ok( $exit_val, 0 );
>>>>>> +
>>>>>> +## TEST READ WITH PERM WATCH PERMSISSIONS
>>>>>> +# Should be able to set read and perm watch
>>>>>> +$exit_val = system(
>>>>>> +"runcon -t test_perm_read_watch_t $basedir/test_fanotify -p -r 
>>>>>> $basedir/watch_me 2>&1"
>>>>>> +);
>>>>>> +ok( $exit_val, 0 );
>>>>>> +
>>>>>> +## TEST NO WATCH PERMSISSIONS
>>>>>> +# Should NOT be able to set inotify watch
>>>>>> +$exit_val = system(
>>>>>> +    "runcon -t test_no_watch_t $basedir/test_inotify 
>>>>>> $basedir/watch_me 2>&1");
>>>>>> +ok($exit_val);    # this should fail
>>>>>> +
>>>>>> +# Should NOT be able to set any fanotify watch
>>>>>> +$exit_val = system(
>>>>>> +    "runcon -t test_no_watch_t $basedir/test_fanotify 
>>>>>> $basedir/watch_me 2>&1");
>>>>>> +ok($exit_val);    # this should fail
>>>>>> +
>>>>>> +## TEST READ ONLY
>>>>>> +# Should NOT be able to get read-write descriptor
>>>>>> +$exit_val = system(
>>>>>> +    "runcon -t test_rdonly_t $basedir/test_fanotify -l 
>>>>>> $basedir/watch_me 2>&1");
>>>>>> +ok($exit_val);    # this should fail
>>>>>> +
>>>>>> +# Should be able to get read-write descriptor
>>>>>> +$exit_val = system(
>>>>>> +    "runcon -t test_watch_t $basedir/test_fanotify -l 
>>>>>> $basedir/watch_me 2>&1");
>>>>>> +ok( $exit_val, 0 );
>>>>>> +
>>>>>> +# Clean up test file
>>>>>> +system("rm -f $basedir/watch_me");
>>>>>> diff --git a/tests/notify/test_fanotify.c 
>>>>>> b/tests/notify/test_fanotify.c
>>>>>> new file mode 100644
>>>>>> index 0000000..fff773f
>>>>>> --- /dev/null
>>>>>> +++ b/tests/notify/test_fanotify.c
>>>>>> @@ -0,0 +1,105 @@
>>>>>> +#define _GNU_SOURCE 1
>>>>>> +
>>>>>> +#include <stdio.h>
>>>>>> +#include <stdlib.h>
>>>>>> +
>>>>>> +#include <getopt.h>
>>>>>> +
>>>>>> +#include <fcntl.h>
>>>>>> +#include <poll.h>
>>>>>> +#include <sys/fanotify.h>
>>>>>> +#include <unistd.h>
>>>>>> +
>>>>>> +void printUsage()
>>>>>> +{
>>>>>> +    fprintf(stderr, "Usage: test_fanotify [-p] [-r] [-l] 
>>>>>> file_name\n");
>>>>>> +    exit(1);
>>>>>> +}
>>>>>> +
>>>>>> +int main(int argc, char *argv[])
>>>>>> +{
>>>>>> +    if (argc < 2) {
>>>>>> +        printUsage();
>>>>>> +    }
>>>>>> +
>>>>>> +    int fd, ret, arg;
>>>>>> +    int mask = FAN_OPEN;  // default mask
>>>>>> +    int listening = 0;
>>>>>> +
>>>>>> +    // the -p flag will test for watch_with_perm
>>>>>> +    // the mask used at mark will contain FAN_OPEN_PERM
>>>>>> +    //
>>>>>> +    // the -r flag will test for watching accesses to files for 
>>>>>> reads
>>>>>> +    // the mask will contain FAN_ACCESS
>>>>>> +    while ((arg = getopt(argc, argv, "prl")) != -1) {
>>>>>> +        switch (arg) {
>>>>>> +        case 'p':
>>>>>> +            mask |= FAN_OPEN_PERM;
>>>>>> +            break;
>>>>>> +        case 'r':
>>>>>> +            mask |= FAN_ACCESS;
>>>>>> +            break;
>>>>>> +        case 'l':
>>>>>> +            listening = 1;
>>>>>> +            break;
>>>>>> +        default:
>>>>>> +            printUsage();
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    // get file descriptor for new fanotify event queue
>>>>>> +    fd = fanotify_init(FAN_CLASS_CONTENT, O_RDWR);
>>>>>> +    if (fd < 0) {
>>>>>> +        perror("fanotify_init:bad file descriptor");
>>>>>> +        exit(1);
>>>>>> +    }
>>>>>> +
>>>>>> +    // mark a filesystem object and add mark to event queue
>>>>>> +    // get notifications on file opens, accesses, and closes
>>>>>> +    // use current working directory as base dir
>>>>>> +    ret = fanotify_mark(fd, FAN_MARK_ADD, mask, AT_FDCWD, 
>>>>>> argv[optind]);
>>>>>> +
>>>>>> +    if (ret < 0) {
>>>>>> +        perror("test_fanotify:watch denied");
>>>>>> +        exit(1);
>>>>>> +    }
>>>>>> +
>>>>>> +    // logic to actually listen for an event if the -l flag is 
>>>>>> passed
>>>>>> +    // this is used to test if an app with read-only access can 
>>>>>> get a read/write
>>>>>> +    // handle to the watched file
>>>>>> +    if (listening) {
>>>>>> +        if (fork() == 0) {  // fork a child process to cause an 
>>>>>> event on the file
>>>>>> +            FILE *f;
>>>>>> +
>>>>>> +            f = fopen(argv[optind], "r");  // open file for reading
>>>>>> +            fgetc(f);                      // read char from file
>>>>>> +
>>>>>> +            fclose(f);
>>>>>> +        } else {  // logic to watch for events and try to access 
>>>>>> file read/write
>>>>>> +            struct pollfd fds;
>>>>>> +            fds.fd = fd;
>>>>>> +            fds.events = POLLIN;
>>>>>> +
>>>>>> +            while (listening) {
>>>>>> +                int polled = poll(&fds, 1, 1);
>>>>>> +                if (polled > 0) {
>>>>>> +                    if (fds.revents & POLLIN) {
>>>>>> +                        struct fanotify_event_metadata buff[200];
>>>>>> +
>>>>>> +                        size_t len = read(fd, (void *)&buff, 
>>>>>> sizeof(buff));
>>>>>> +                        if (len == -1) {
>>>>>> +                            perror("test_fanotify:can't open file");
>>>>>> +                            exit(1);
>>>>>> +                        } else {
>>>>>> +                            listening = 0;
>>>>>> +                            break;
>>>>>> +                        }
>>>>>> +                    }
>>>>>> +                } else if (polled == -1) {
>>>>>> +                    listening = 0;
>>>>>> +                }
>>>>>> +            }
>>>>>> +        }
>>>>>> +    }
>>>>>> +    exit(0);
>>>>>> +}
>>>>>> diff --git a/tests/notify/test_inotify.c 
>>>>>> b/tests/notify/test_inotify.c
>>>>>> new file mode 100644
>>>>>> index 0000000..17c3565
>>>>>> --- /dev/null
>>>>>> +++ b/tests/notify/test_inotify.c
>>>>>> @@ -0,0 +1,43 @@
>>>>>> +#include <stdio.h>
>>>>>> +#include <stdlib.h>
>>>>>> +#include <sys/inotify.h>
>>>>>> +#include <getopt.h>
>>>>>> +
>>>>>> +int main(int argc, char *argv[])
>>>>>> +{
>>>>>> +    if (argc < 2) {
>>>>>> +        fprintf(stderr, "Usage: test_inotify [-r] file_name\n");
>>>>>> +        exit(1);
>>>>>> +    }
>>>>>> +
>>>>>> +    int fd, wd, arg;
>>>>>> +    int mask = IN_MODIFY;
>>>>>> +
>>>>>> +    while ((arg = getopt(argc, argv, "pr")) != -1) {
>>>>>> +        switch (arg) {
>>>>>> +        case 'r':
>>>>>> +            mask |= IN_ACCESS;
>>>>>> +            break;
>>>>>> +        default:
>>>>>> +            fprintf(stderr, "Usage: test_inotify [-r] file_name\n");
>>>>>> +            exit(1);
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    // get new file descriptor for inotify access
>>>>>> +    fd = inotify_init();
>>>>>> +    if (fd < 0) {
>>>>>> +        perror("inotify_init:bad file descriptor");
>>>>>> +        exit(1);
>>>>>> +    }
>>>>>> +
>>>>>> +    // set watch on file and get watch descriptor for accessing 
>>>>>> events on it
>>>>>> +    wd = inotify_add_watch(fd, argv[optind], mask);
>>>>>> +
>>>>>> +    if (wd < 0) {
>>>>>> +        perror("test_inotify:watch denied");
>>>>>> +        exit(1);
>>>>>> +    }
>>>>>> +
>>>>>> +    exit(0);
>>>>>> +}
>>>>>> -- 
>>>>>> 2.21.0
>>>>>>
>>>>>
>>>>
>>>
>>
> 

