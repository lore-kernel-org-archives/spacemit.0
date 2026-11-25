Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602864;
	b=vV6JTbTIsPpjePSjHLBQNiZCuLulrPbGuWG92gKNiJDuvTrGeEAWsBwJpjPr4YMaf4RE
	 i0HOVMj0UuMK0WhmmVfL3FQWqdZSUHJckAWyKf+Igs/8B/Q6OJO0i22W3EycTz4I5QMfy
	 hzJYmR0k6u8/0TDsqZBEnnpFxhjZCAu6PazcQxRt4/ooaQoZBUIx58pxyUyAfmUnFbMbi
	 uaaUHPjbj5OWafR2g5L0jorKEW/Os1D1oGVtT1hLqrSvpe/S22xeIChqvfk6i2wNcMERU
	 pyQWnChyNMVzWgcTfpLn18GtOv0EbO5m8WIe9Kyy5znQP9Qiu/L145G6DhQMRTrHSqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=;
	b=ZWUkAUDZlTIxsofP0XNsCwRpYVEaOL+ukWMh2woSDz4/FZCT9haYHv6bzthNxegRFLa/
	 F1XnEVZrpRT06XtYuzndLrMceFdcqrUCHfKtPfzsFtoYwkOyPAiuS8avv+cW0byPDaMTA
	 EcGjXjRdRMMJ6V2YXRO74zN2C6MPydH72uYkzcDb1MkgOFSBfd/9w+LZtsSPNiTfFTKM5
	 A1xfrb8rMCbxuH4PlaNtj7/znmWBXPxC/qFrGtWHnMKrt1K6WhVB7PiOidjFx5dbo53Hw
	 KWXr3aN/IYJDtpDh+YMr/zG9uZFD8YAQ4dVGHqHlf4d4oIncViovKNP/9uE449/31Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MTlNwwTQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHzweUl7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D85D60A260E
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 10:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D85D60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MTlNwwTQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHzweUl7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mOhh115429
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=; b=MTlNwwTQXga43xmW
	iM7da30bnloXibrktMFcBqpiXRmX+ABlAZ6LWDcXrCAu0NK0regToQLoMG4X1IXy
	G7tQwe8D89/7GJnRKRlEyOM4FK4yU/t5GDBFMcCZ9zrfTttxMThIoCkVE8yBJV47
	VNirkCtgmLSpMEBLeQa0468ZGW7teO2Cj1gccoqV62Hs1VUwiqyGtwctvF2INn28
	UDR+w28YC9fOR4dapuOlrgxA1VUKl9kwwYJA8zPF6gEKUxe92PZn5cz5Tq/3UmkH
	iLj6bhcMtxKNs2MSEsjmLBLLEPtQ+CuCaAGf7Z/c2vlRF6sd/6D7EHg4pxZkIP9l
	iWGLsQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkccp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 10:34:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso3671096a91.0
        for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 02:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795602862; cv=none;
        d=google.com; s=arc-20260327;
        b=lAWukaHQ9m3e//ps3QoNLWOc0Exerxk9jFc3RWumOFTHZrhWcAzx/CYKXJqouldJ9W
         s2ofRrvVjYFTDxig7FGj1WKVF3vePDZyfSUt9sNs1ufNFZiFbP2xfZgeecEIXPach9wq
         3Zc4d7x50r8vhEbDrCFyHpNhWUKEE06V4pe1ZRcMfqIuqZSWRzI2XWu55V87ZOoIsOeJ
         2uUy0R0DBXv5QRJzQ5Dnloa16vr8vzH5+qrOEJa0K4pfdEbvAGVeJ3p2Sg7zKLb5CD4j
         bSDf9glhs9mK0sEXQzBuTqfqTshecdlzsTs5AqcLnYKpL/C//X7K291OnXfgsniiK44f
         dvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=;
        fh=h0abT2FqMRH8EhvpX2FVANA5duJEEpw4Ec3T7mqLKOI=;
        b=O/NaGfgQSyBM0HtpmyrezmKzA9I3NsCJs9nMfoUbpbo+alkTn+iGDGl7VVs181Uw0h
         HXiPrEep3H9HP/gc0erlwVIDuivLkGiqshrHtzZ8ecg46CM972ywBYmCyOWoQepDnaxx
         pEylFcva5m2AtZUChqM19QIDaBOfETie3bHVdmoXUrWaLo+R4IxdY3omWy7G2gHLVk/O
         83p+RQYrknFHGe6h3zfLkQA+MviGhjBs3Xjd36fZZoNHfFTIarIkU6fwUz82qSFAK0Kq
         KKK7yCgIm1o56YHlLzAkB2CxdWNmJAqFGtuSXsXLhMX2roCaSu/dvmee6Cw4rlvMsYV/
         r4vQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602862; x=1796207662; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=;
        b=RHzweUl77rXIIRuUqjNQ5RWWX14kkGpeiu1n+JpZt9ytPAFGEo9/rAJ+6KzsmrXOG+
         VTfjN091YMqq7/nZgW3IT3vJ6vFtjNy2Xlasbm4gjw7knc2L4rrjQ4J+9BkqLUEtUvR+
         ETbEljOfsC/n+sZH63ZGXtJE8XR2tL0IaCpuh4nYI7XhjfVcHyQrIOGWViv5MIad371E
         eJXR79NbVla5FbuSXf83NgZrmWPyhfIVTykw5yj6ElVZIEsbBqH0iAQT4Z+qhqU4UaFq
         OyewW85/hq95c0EXMO3H26TOWaz9RZaz2ZX7MbG99ESj5B1vI2F6UDdeIcSZmEYR4AYh
         NLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602862; x=1796207662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhX3qlZ46C7QHPDAi6gO1rqKUJVvN9Ln86oiJ1McZTo=;
        b=JJt/Z3rjEvvxuDCPPejtC6L8WDHLbVLPs7hpeH8oRZaUwH/zn+goBO5Vle9fa5F7kw
         U4JKIvzhsEGQbCNrvvee7Wo/DkWJ9XSoZp079o5KhDFHFldIFCEFWW79y13Qve3922P9
         HxHlHJWuLHfWtpl+wYCvW1W7Y+/ahXqI78Vy61kxAsV0zHkF4Jrzky1Qmv/gEFHabyAa
         A/OvybnMWBj36TuutDwnvAwiGHFepcQ3fb6yEtkUgavGcBhm/ID0mRwLElPjsLZsMQhF
         wmEcFNeiYUc4ZaV4cxa/hWaM+cHfZrYuGR9gf9IXsRndCijkaAlenrLTHOY8nD/T727l
         WLSg==
X-Forwarded-Encrypted: i=1; AL+hErFQpHBILS4aVAx37YX3dPlIzzAsgM1H0T2u5BKo4OOvD9q3I9af1ral8S1n2vZOspCko6l+VZ5NbA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Di/PVWFXDpvlDLhMKtvxI6kwqX5W9Sa8VqUqlb/YJOMu1kdcB
	D132DqIaAsuKPLdO9B4O5bztvZZagTTUTDoe8CeRQSu69QwAAPLIRjDj83NTEeKH1NIYvf40z7Y
	8kGoWU1Wkw2Czt33tQA8+1r5y3IJDH3QekRuLn7OBLJnAt9vQ7I2hQ8T/8bRHC0AxFNMNrxywSe
	+3kABoon42viDMrShA/r8EqJis9GN7acjSvGgP
X-Gm-Gg: AZFdTZe+ErSfrgA82vWexcZW/Bxz5BxpuCQ1uixUNwGmwgKcY2iTYSQQZcx3o+nDHPn
	+bYp6tvxF6SKbFTVF+XZMhE/909AfSF3R002AJBOUUbm0ORD7ZaeFTy4w6cQAdeIqGFVYKkNLTj
	5f8W4DC/ex9G1PwpFkp1RrIeiGQg+qmGeCRjZy3qHjEq7tttfU1UFp8LtJ7Q==
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b41c911819mr15585914a91.25.1795602862235;
        Wed, 25 Nov 2026 02:34:22 -0800 (PST)
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id
 98e67ed59e1d1-3b41c911819mr15585881a91.25.1795602861775; Wed, 25 Nov 2026
 02:34:21 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-01-pm-device-link-v1-1-8932e0862378@kernel.org>
 <CAPx+jO-37Km71oSW+zOO7BBWLj86SNCn=U=EGmBXdC5SfX4nbA@mail.gmail.com>
 <20261116072442-GKA100890@kernel.org> <b7d7ac2eee0e64aa7c267def5c2a8a022c7da425.camel@icenowy.me>
In-Reply-To: <b7d7ac2eee0e64aa7c267def5c2a8a022c7da425.camel@icenowy.me>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:34:09 +0100
X-Gm-Features: Aa3M54rH_iaUZ5ip693Y70gQCtTHGqzR_7H39x_RiS3GWAMpcjgQcywZy4Jp6MA
Message-ID: <CAPx+jO8bY7WZjeSuOjNE1=FxrBhs=M9fxEJx-r06c2S84xFr_g@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: connect consumer with supplier via device link
To: Icenowy Zheng <uwu@icenowy.me>, Yixun Lan <dlan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX0kLszKYy+Ocp
 /9sLJtG4qO7wUN0Xdya80epDRibwFfRLP3+eqCqRQVc36xWlpKUlFzweOtyy+08hX1y9GM2iNc1
 c9Ob5d+RHVdtVZAGYGcZQPWQGsAnBTsG7Ajw1ZS4sLFusURLD8nw+8dfKYrqwLPlgJih3yqwfX1
 OESCBLuF93Hu9y6+96BrdXx7X8nSoRBTmN+74d5cWTpS/bAzfrPkU5riIkFMQKmBSiTXNb5VCm6
 MGHJ1cSD5hyFq6WE12+bEJP7pEmpm1g8H6woyiWK4Qfl5UkXSPU+SnLVQLxZHSoWLbz87gHoXWy
 R+lcCJnxNOOpakQboF/78gg/cddA2EMhrYJlc+E1aVGJy8CIrtTHSeKljshBhGAd2Zd2X8jpRU0
 h1LJdqh6YCV51YFL25o5mtNoadWcvROBN3AEFQDgWhJUrtRNE8H1lSCw47z/ZYzejZV0JktChd9
 mXM6LaCdGhYH9fcDZ/A==
X-Proofpoint-GUID: JazNmb5FAjXGS9i3AJbhpXuTzs_9R6bO
X-Proofpoint-ORIG-GUID: JazNmb5FAjXGS9i3AJbhpXuTzs_9R6bO
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06b9ae cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=8NAnHuo4LRsqlWi9iDsA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfXxSqzPpRMzDsL
 T2wr9wdhVhRZZpMe9FrTr5tKlHUtxRyDSi/S+lV31qg9kUi6guyAg1YHB4fX1wVR4ie4t6BsSb9
 G4c577GJFOHQc2C4yRVJcW33ND4UW00=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On Mon, Nov 16, 2026 at 8:47=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-11-16=E4=B8=80=E7=9A=84 07:24 +0000=EF=BC=8CYixun Lan=E5=
=86=99=E9=81=93=EF=BC=9A
> > Hi Ulf,
> >
> > On 12:33 Sat 14 Nov     , Ulf Hansson wrote:
> > > On Thu, Nov 12, 2026 at 8:45=E2=80=AFAM Yixun Lan <dlan@kernel.org> w=
rote:
> > > >
> > > > Connect downstream Power Domain consumer with the supplier
> > > > through
> > > > the device link API, So when the pmdomain driver is unloaded or
> > > > unbinded,
> > > > the consumer can be automatically notified and purged gracefully.
> > > >
> > > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > >
> > > Can you check if the below commit that sits on my fixes branch
> > > solves
> > > this problem for you?
> > >
> > No, I've cherry-picked below commit and it does not solve my issue,
> >  it's a different problem.
> >
> > Problem here is the pm consumer side isn't aware pm driver is
> > removed.
> >
>
> I do think it's just better to prevent PM drivers from being removed.
>
> Thanks,
> Icenowy
>

I tend to agree.

Unless we have a real use case where we really need to unbind a power
domain provider driver. Is that the case?

Kind regards
Uffe
