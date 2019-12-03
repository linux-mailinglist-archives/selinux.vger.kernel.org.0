Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D65910F4BF
	for <lists+selinux@lfdr.de>; Tue,  3 Dec 2019 03:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfLCCAg (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 2 Dec 2019 21:00:36 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31254 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725941AbfLCCAg (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 2 Dec 2019 21:00:36 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xB31xnEm005273
        for <selinux@vger.kernel.org>; Mon, 2 Dec 2019 21:00:35 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6cy75uy-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <selinux@vger.kernel.org>; Mon, 02 Dec 2019 21:00:35 -0500
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <selinux@vger.kernel.org> from <zohar@linux.ibm.com>;
        Tue, 3 Dec 2019 02:00:32 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 3 Dec 2019 02:00:30 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xB320TCk63045710
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 3 Dec 2019 02:00:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EC0A652063;
        Tue,  3 Dec 2019 02:00:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.147.107])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4A5E15204E;
        Tue,  3 Dec 2019 02:00:28 +0000 (GMT)
Subject: Re: [GIT PULL] SELinux patches for v5.5
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     Paul Moore <paul@paul-moore.com>
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        Roberto Sassu <roberto.sassu@huawei.com>,
        initramfs <initramfs@vger.kernel.org>
Date:   Mon, 02 Dec 2019 21:00:27 -0500
In-Reply-To: <CAHC9VhRkosCVR+4qyf=GPKQuQoJzwjZZJ_z7rhE-qiL-TNbtPw@mail.gmail.com>
References: <CAHC9VhRj-vx8AnP5tKcq9joNqWSHRv1bk+3e7DGU9mxjN+fVFg@mail.gmail.com>
         <1575302310.4793.379.camel@linux.ibm.com>
         <CAHC9VhRkosCVR+4qyf=GPKQuQoJzwjZZJ_z7rhE-qiL-TNbtPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120302-0020-0000-0000-00000392C1A5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120302-0021-0000-0000-000021E9DFB5
Message-Id: <1575338427.4793.486.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-02_06:2019-11-29,2019-12-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912030016
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, 2019-12-02 at 15:04 -0500, Paul Moore wrote:
> On Mon, Dec 2, 2019 at 10:58 AM Mimi Zohar <zohar@linux.ibm.com> wrote:
> > [Truncated Cc list, adding Roberto and the initramfs mailing list]
> >
> > Hi Paul,
> >
> > On Tue, 2019-11-26 at 16:24 -0500, Paul Moore wrote:
> >
> > > - Allow file labeling before the policy is loaded.  This should ease
> > > some of the burden when the policy is initially loaded (no need to
> > > relabel files), but it should also help enable some new system
> > > concepts which dynamically create the root filesystem in the initrd.
> >
> > Any chance you're planning on using Roberto's patches for including
> > security xattrs in the initramfs?[1]
> > [1] https://www.spinics.net/lists/linux-initramfs/msg04771.html
> 
> I'm assuming you're not asking about me personally? ;)

No, of course not.  I was wondering if "help enable some new system
concepts which dynamically create the root filesystem in the initrd"
adds SELinux labels on the root filesystem.

Mimi

