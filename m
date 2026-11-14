Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794656026;
	b=WCH+eeW8pi+bLwkgx1kxSwXx1apFyIVL9/ceCKP6iczresQeQ/9ugJOlXdEPpwXkTGj4
	 ia8cozIlYMVFdx9c/h8q7yBVlSBvIl7PhZx2AN5ORU5Mt3seWPTZDM2Kz3zKZI4ufQXHH
	 HLjqwScPSgZjFoUhvbMZZ8UJCynk5Fvb2LxWDgv9FBdu4kxDV9klvKi5BXqJXmUbSPn6i
	 Z8trEKkZanzSoQHsM9/s+6Xe5D6+bZ+cvjlupz/HDm7Y50eiDO63kmKjsSahItFwjJa67
	 S8AySrpaA6B8UfV1J/6ilSHm/kAnZgt2X9bVXKdMpIPG7X8An9SnhXM9s3M7KxWIHMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794656026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oEfA8gRWLRRIMFKx9bwTG7AarFQoMaM1TYcn8ru1TlM=;
	b=YRVx71UaHeNox05Ghkr3DOPKF9lM05zUyRQYbJSQ3Cr9d1DJqGv+z6BtsZi/yIRr4jrC
	 fdsog8byNTwMkxuUcyRD6+ISUvXLFpMicoSroLXpem7y2arN9iwb3bFzYrTSNlML7zBEb
	 ayKORC/hmDwDPJWbtiVZK+sDjCcWdtfKBss8/DQ4WGSEzjwYKozPYe6N8pufwt6PZAdGK
	 7E3//dsKfr8ygEOa9gSG8V18cLxwNJbhFGGqMLblVtL0ouLchg8KIl1kLzY4wRKTQfWDg
	 Fz+CauOCpcllCwY4WpSfZKQy8G5Sr4+VaLiqaVQFusOsbKP4lRhTjzBeQajPVKTwYPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dlGROvAc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3dnthEq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3014606A327
	for <spacemit@lists.linux.dev>; Sat, 14 Nov 2026 11:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3014606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dlGROvAc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3dnthEq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wXK01750559
	for <spacemit@lists.linux.dev>; Sat, 14 Nov 2026 11:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEfA8gRWLRRIMFKx9bwTG7AarFQoMaM1TYcn8ru1TlM=; b=dlGROvAcsPVce7rB
	7jYMcmpMP5EC7n6vqtae59gEYYfiazxVySMuuNPHGrMjSQq9gTt6ETbaSLGoxNaj
	6jOcBI5CV6fOuutnW16tj8iSGO6rvmF64l+JacIBdSB00LPDbcXDY3Fg/fhTMAdJ
	KFt8pyuCCXOGz+hFbtpXGhCU6906mvDJ5LyfoiERzRN42yKzt9e8B2kh1OyuLJYG
	UJqi1zUYrQ82qGjwmWJ2G665UuHEGinAFyG4UwA6mRksm7UhpnktbZmjAugCgvM2
	455gZ7uBXnFG1wi8/9bOybFZsbG4sKImEQVnC/+p95oGmHdgxmrNeN6N+5NsIlK8
	+ql11w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj40n4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Sat, 14 Nov 2026 11:33:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea71803effso16474495ad.3
        for <spacemit@lists.linux.dev>; Sat, 14 Nov 2026 03:33:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794656023; cv=none;
        d=google.com; s=arc-20260327;
        b=Nj5FMClZBAteH5S4HACIYFvo1YzC6Sp+IrSgTw1SMxYt+qbdX/bFF/sCrTkgEvsE0h
         P/K/hbB4Uzf8h8ISsYA85jaHMFLjXUA3K/TIlnjuiI+JOOGtPv7fHkylyZfPgV0KHTcd
         bqR+6aLiFbpR7dDv3GUjtj2k3RSg2NjXj0dJPEOBEiK8pAWqSb1kWW/6zA254bV9EFJp
         d1zDA8B52iUeecTw5wqhBJ1StbGjLX+z3ygXDsvkpOzgVt3dzNkJ9p8LkCH1E/JKOzms
         BRH5BIShEtN2peD8yPJGtms11aa/1LlY5gbGdnPDESVmhuDguRRAasGO/UjvEIWk1TUS
         gMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oEfA8gRWLRRIMFKx9bwTG7AarFQoMaM1TYcn8ru1TlM=;
        fh=NX2xYXUgmDrVgqD/DBtk6Rla/uZ1v88rLxBISnjN8vg=;
        b=dQNUdngofAFwHtRHvI6pGyowvAL968HWmdvQ7tJig9DyLJnK9u+iYlodiSg3eACn+R
         WvW515JOikgLFDW3Qz75pOcuQ4pclMJOlqDkzQoA4kMiS0SthhhONLHcTiSS1jn5VIq0
         vwbgIkMBCdoS3B/Xuv6WAV4W7qsvFt07thtnpPJ8ZfMv66KRBcr71mDJVRZtEi+1zp/9
         i5yskKIbWuBNC9jyOWbAfCr1OfRU5Xylyly8Ax6TKcllzgq/WGSvMJVWwe7ka5L1AxDT
         mO68XKr5IoczPklk7rdIosB5Up6x7x6q22J78/JAywO46RDjQzcdvIwt4NW6PM4mJtO5
         logA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794656023; x=1795260823; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oEfA8gRWLRRIMFKx9bwTG7AarFQoMaM1TYcn8ru1TlM=;
        b=A3dnthEqLO2JN0wgpphkm9dX4NpOApp7GL4mGEI/wZRYrbX2KgxHUxLDT1BrSrrKmz
         EV+maqxlJPAYCDyfEXM6qrBtYntW+rXHjJqq8iUv0koqKknHq2lHJIpYh98+F/H+j2Jo
         vNvfDIQmvyWuu/LQe6opZkb9M9qLxdqNqo3eoMrPutF77mXULU/nn9ohQzKopewSVH0t
         w50J4U4OhbEvQKwrL8fW7yvqETs8ADWN9LfNO6wUInL8oSy1PY1C+yBXVyx6Ccwaotcw
         nN1i3W9kREAw46trPt31mAenTE8Uob/aH+N4qS5D2SjYKOcmUIhWQ9IlV0UUAyKZwUO6
         65Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794656023; x=1795260823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEfA8gRWLRRIMFKx9bwTG7AarFQoMaM1TYcn8ru1TlM=;
        b=i1vDHMtqxSafHJBrJ/+L9klWPbDVMP24hJ1mcirZv9AUzXwbltOVn9w160GMpgbD8G
         vQo82ptoLjl0wtnzFMzGjT/Ok/CNcRovXpCQFkR4u9miX406m57PL6EKB5NhBsQ7oSp5
         ueWJpYlxmp/qNv6Q4NqaI6cC6pXh9jhp/F2VKPT5SiTjO83qk8FI7lIydA9TW3M+q6b8
         hr3y5zBBumBJwUiL5pqNHPT3bUE50wv9LjdCw0Yy0lrGvnj3RfbWoEc16hVIkYWQo9r8
         PjcO7j2NCLxqnj835sAlx8Pbq0vLB17lEm/oW2HdsqD7/PaSfQIevt0s1abA3pWeNNbs
         Zsyw==
X-Forwarded-Encrypted: i=1; AL+hErGee9BpgiP68bjjbzcvtSE2NOTxy7e4QhAo6yQKFTwq8k2GkkoyjuGVl7FGhtMLaE3YNaRmJvI3Kg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8JIZ2qopaOXGJB1mT3F2wsTWDUZVUEYeneWmlmuJ1NvktbJvR4
	aGKPFfpuqRGr40Ix7mpVeKqHmRxZTs45q2jNEi52ZDuXwp/YX/LlPeBt4hycqsWB0LAE9DD8Zaj
	2rMjgYEYL3fixD2SwcFJr23CAjOpp5P9JNJQLqe7JxQ48zF4cvOzbZdjlfO309nPMZjhAVn1LXA
	+tBkCbvQOixNpIJFhd6QE+fCW8U1UmPS2s5oDLekeJSuMtBxs=
X-Gm-Gg: AYBFou31AKw+5KxBNE8MW03RBSRqPk7RcUhmiRg5As8c3cqkEyd7gwYtZwtAjs1HmFO
	dT5hEeEQhROJUR2YtaQO0F3nmHWemKNNeZSA3YxNltAYfqjJqE4n9x3NIR1IvEVgus47Bf/72jS
	9QQbME/muafqG5B8XR0f+lbNW2fqVjHIGbMRIEciFJsS11RDOffbuyhXKKbA==
X-Received: by 2002:a17:90b:5910:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3b1b0a1fe6emr4265345a91.26.1794656023355;
        Sat, 14 Nov 2026 03:33:43 -0800 (PST)
X-Received: by 2002:a17:90b:5910:b0:3a0:516d:9f88 with SMTP id
 98e67ed59e1d1-3b1b0a1fe6emr4265318a91.26.1794656022663; Sat, 14 Nov 2026
 03:33:42 -0800 (PST)
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
In-Reply-To: <20261112-01-pm-device-link-v1-1-8932e0862378@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:33:31 +0100
X-Gm-Features: AclHuK_taegd5bAzuybJmQPC1z-fZC_MIChsvwsEmWXiwFzgCH5zCy6riPEsdLY
Message-ID: <CAPx+jO-37Km71oSW+zOO7BBWLj86SNCn=U=EGmBXdC5SfX4nbA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: connect consumer with supplier via device link
To: Yixun Lan <dlan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Icenowy Zheng <uwu@icenowy.me>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXyfbz+JApcDg4
 2JpqO5bpNH1+8LNxK0rRsKPjZVep71U4gkqfUXpaYPcfbDlIQ0iDPyte/a7hChwFxbgPTHKfSMB
 5e804mQsAMvO8zkno2Y9NaXhMfyXfQ424mV3i42+b2WP88o4s2IWRJ2ET39sMoYRW3xr6+uWwhj
 m0HI7F13AFdGzJBMoFD2VHo7CELxLWGp/BF8E+h3Fm9Hro5euqRn/ZjzDOrRFGKj1DEnoYTtIKV
 jYnAYGIpWA/jKp5vT6pstKy2CGvJ5OGeQFR9y8CDiUgG8NIwJGESwOFhwis5Ll8vGman/P70AlI
 t5BIL3Jutd9xLWQK1vXV6RHx+ufbVQgja27RNKqdsvGOrg7/6P870InQ1YcDZGfy48wn6ykReX9
 m2ybIqJsR2CMsUD2EUk7rflapw8r9zbyblx6u+hnR//YY5eGGvqPA5RXQ6c5fy6cTLMdkcM/uGm
 fMJ6ZAeJmrCqj2SGQmQ==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af84718 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8
 a=7_BkkAeRn8r4wxPsRKMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: ySzUd28me6FlvZAnH0DY_nzXVjt2HxVQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX/lBLVNWSNVKh
 nLdkPmXtIw3ursJtHMxQ9piyImLy0o8hyB2J5yXuP4TR3bdiTGaN/dZAsZvKZi4iaqTlkcjSl4q
 MwrrDgsqOOoPgp18EDxTihQsUUuNgq0=
X-Proofpoint-ORIG-GUID: ySzUd28me6FlvZAnH0DY_nzXVjt2HxVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

On Thu, Nov 12, 2026 at 8:45=E2=80=AFAM Yixun Lan <dlan@kernel.org> wrote:
>
> Connect downstream Power Domain consumer with the supplier through
> the device link API, So when the pmdomain driver is unloaded or unbinded,
> the consumer can be automatically notified and purged gracefully.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Can you check if the below commit that sits on my fixes branch solves
this problem for you?

e279833a5362 pmdomain: core: Wait for device link removals before
dropping genpd->dev

Kind regards
Uffe

> ---
> The power domain drivers under pmdomain subystem suffer fom
> the problem that unable to notify the downstream consumer with
> module unload or unlink event, left with stale sysfs interface.
>  Curently, the solution is a) use builtin_platform_driver() API
> to disable the module unloading b) adding suppress_bind_attrs flag
> to disable the unlink interface, which prevent it from being
> triggered from user space.
>
> Take spacemit K3 platform [1] for example, without this patch,
> Removing spacemit_pm_domains module will trigger a failure to
> remove power domain, access pm_genpd_summary will result an
> kernel oops, See detail log below
>
> domain                          status          children        performan=
ce
>     /device                         runtime status                  manag=
ed by
> -------------------------------------------------------------------------=
-----
> lcd1                            on                              0
>     cac88000.dp                     unsupported                 0        =
   SW
> lcd0                            off-0                           0
> audio                           on                              0
> gpu                             on                              0
>     cac00000.gpu                    active                      0        =
   SW
> vpu                             off-0                           0
>
> gpu  lcd1  pm_genpd_summary
>
> (gpu and lcd1 isn't clean up)
>
> [  181.353671] spacemit_pm_domains spacemit_ccu.k3-apmu-pmdomain.3: faile=
d to remove domain gpu: -16 - state may be inconsistent
> [  181.353889] PM: genpd_remove: unable to remove lcd1
> [  181.353896] spacemit_pm_domains spacemit_ccu.k3-apmu-pmdomain.3: faile=
d to remove domain lcd1: -16 - state may be inconsistent
>
> [  206.228045] CPU: 5 UID: 0 PID: 2560 Comm: cat Not tainted 7.3.0-rc12 #=
81 PREEMPTLAZY
> [  206.238002] Hardware name: SpacemiT K3 Pico-ITX (DT)
> [  206.243027] epc : summary_show+0xaa/0x308
> [  206.247081]  ra : summary_show+0x264/0x308
> [  206.251224] epc : ffffffff809f50fa ra : ffffffff809f52b4 sp : ffffffc6=
01273a80
> [  206.258542]  gp : ffffffff82333b98 tp : ffffffd601d5ec80 t0 : ffffffff=
80026b38
> [  206.265859]  t1 : ffffffd6092d3cb0 t2 : ffffffff81601810 s0 : ffffffc6=
01273b10
> [  206.273177]  s1 : ffffffd601b92470 a0 : ffffffd601b92588 a1 : 00000000=
0000000a
> [  206.280494]  a2 : ffffffd609ae8000 a3 : 0000000000000000 a4 : ffffffd6=
01d5ec80
> [  206.287811]  a5 : 0000000000000000 a6 : ffffffffffffe000 a7 : 00000000=
00000000
> [  206.295128]  s2 : ffffffd6092d3cb0 s3 : ffffffd601b92470 s4 : ffffffd6=
01b94040
> [  206.302447]  s5 : 0000000000000000 s6 : 0000000000000003 s7 : ffffffff=
8221e3a8
> [  206.309764]  s8 : 0000000000000001 s9 : ffffffff8172b8c8 s10: 00000000=
00000004
> [  206.317082]  s11: 0000000000000000 t3 : 000000000000017a t4 : 00000000=
00000002
> [  206.324399]  t5 : 0000000000000000 t6 : ffffffd609ae7178 ssp : 0000000=
000000000
> [  206.331804] status: 0000000200000120 badaddr: 0000000000000010 cause: =
000000000000000d
> [  206.339829] [<ffffffff809f50fa>] summary_show+0xaa/0x308
> [  206.345206] [<ffffffff804b67f8>] seq_read_iter+0xe0/0x390
> [  206.350671] [<ffffffff804b6b86>] seq_read+0xde/0x158
> [  206.355697] [<ffffffff8063dee4>] full_proxy_read+0x54/0x88
> [  206.361250] [<ffffffff8047a03e>] vfs_read+0xae/0x380
> [  206.366275] [<ffffffff8047adc2>] ksys_read+0x6a/0xf0
> [  206.371301] [<ffffffff8047ae68>] __riscv_sys_read+0x20/0x30
> [  206.376944] [<ffffffff8101fa6a>] do_trap_ecall_u+0x19a/0x518
> [  206.382674] [<ffffffff81033acc>] handle_exception+0x16c/0x178
> [  206.388503] Code: 0a13 c00a 4c05 4b0d 3783 540a 3823 f804 3423 f804 (6=
b9c) 8552
> [  206.396050] ---[ end trace 0000000000000000 ]---
> Segmentation fault         cat /sys/kernel/debug/pm_genpd/pm_genpd_summar=
y
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> With this patch applied, either unload the module or trigger an
> unbind operation, the downstream gpu, lcd1 will exit gracefully
>
> or
>
> domain                          status          children        performan=
ce
>     /device                         runtime status                  manag=
ed by
> -------------------------------------------------------------------------=
-----
>
> Link: https://patch.msgid.link/20261108-04-k3-pm-support-v3-0-b9dc0857039=
b@kernel.org [1]
> ---
>  drivers/pmdomain/core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 964e44c2f78f..870fc8083bca 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3543,6 +3543,8 @@ static int __genpd_dev_pm_attach(struct device *dev=
, struct device *base_dev,
>                 return -EPROBE_DEFER;
>         }
>
> +       device_link_add(dev, &pd->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
> +
>         return 1;
>
>  err:
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261112-01-pm-device-link-9fdd0fe59a49
>
> Best regards,
> --
> Yixun Lan <dlan@kernel.org>
>
