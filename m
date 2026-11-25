Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620286;
	b=E1eJRoZ04TKeo4pZWpWY9ZnUosDdw7ylgC/pKvCP8EqpLOTFnPZuHLEHZE0oeMzEEcPc
	 iPUT6H/GIjzJW/UA2DDBiJgAdyrOyKQIxCOrP5El/jjAfsB0Gt3OwaYSduMcN8kw53E/J
	 Fc6V/Aip/1Pi4UMM5CpYT39XDHzJxxlQFAkTp9Ooa3l9ieZSYGANNE3Mykp4KPMNGJWmr
	 F1RlT5IREKzL7+s8q6LD3N+94EnFy1BwVlCg40rhK+BvTGDwx3NhmdG+iOrAuQCFgVt7B
	 DrpzAGjm12AUL23F0VEtRhP8FLHudry57w4G18NjFfCjUXMSuJP540vy3qlVWN96FPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620286;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QIYZYd3o/tNv9e79fiRmovS4XRBJcwrqybTUeeJB7F4=;
	b=AmXfZWGcbtWog1LwlmJzCSpt0rTYME0vm/TC/oSBhxcTTIb/n3mAWZYcbqQOS1gBNhLG
	 nWjNtk+1WqETDAIEmxC/8dIWNNkj/8TNSgbufqtJJXChreraAZgPOGMAbnD37YhJvY7qm
	 OhjyBbrY4POt7zjLFzOaGYKTSJZ5fyVRePPlsYUkRmVhGc4nlYnY0TnmJhA2vhNuQpGSA
	 t5JHEkhygCsgQblX0LvSB7dv3ZcQExUSWramZxcd57kTVU/JYKvOq8RKEJ/i0iNAUC2n1
	 Vuqf1jJFo6sf6f/DufhPl5kjKe4c1pa53BUQyZg2hzJ0TDG3OQOJ+f7PCoemCXbA2fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MveGXrNU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LNelTxC8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020E4606A33B
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 15:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 020E4606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MveGXrNU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LNelTxC8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMQgm441502
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 15:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIYZYd3o/tNv9e79fiRmovS4XRBJcwrqybTUeeJB7F4=; b=MveGXrNU9rvAmn6V
	xyXMLjH+LeWkmnYw5sO0/5LIzFGhJKO6bnj+DlEI27vePJbVd0hXi74Bktgvxg/7
	qTXu93gmDfo1mniLpECQMDNfQAraAs2gSciu6wtyvKkg5MYR5NR1xIuon3fFcysa
	vweMynCEphOviJ2FslE5q5pFdHKX8Vs7EQnRWvJuSHd11zkB/LMkPjB7+cJb0Jub
	X0GKLuGzzobTNolJ/29eZLg5253HUI1rBQHw6o8FEoIQO4X6XyRIjozhWIYI+OOA
	IDrSIbUznKwH2Byn5AsoGh7SuEsRWGvb4b832YXkS3/gvvFl3idyej/aVE7siMXh
	XdEvLA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbke85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 15:24:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f08196b148so35034665ad.1
        for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 07:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620285; cv=none;
        d=google.com; s=arc-20260327;
        b=B0jBRYWrntQZK3wBd+GvRKtZjwKzpZasPK09TneBjnAf/4eD2Qjk0VmCpMTtFcAUDG
         4aDfDUgFc1WNJGel4Tj1Wtu8pRF4FeWCtlN6AIjNxdW4n88kE/GUgI57EvzZM/wfKiLQ
         +CCO1cr7cbCp3jjkK6qVBGGmX1rMjwRXouVtmItDdKUAx/9SGSdPX95KxjXrMWp6xjtK
         UXQCetm5pb7tHZEucwm8LjmMnQVfk2DBxZgmOlrW4Md01yxaai+XmIidm+7mk4RdEv5J
         Ya95gdLWEG5sVlTolLdMJTcH1DfjNoL+QGxOqwL2AT75I09u1rx4IvK4+PLFPxSF0iS2
         LYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QIYZYd3o/tNv9e79fiRmovS4XRBJcwrqybTUeeJB7F4=;
        fh=0lMs+yF9hWc0wqSTcQ26t2Vi37GToJvxRlZoCSFORl4=;
        b=JJSsXL7rBHoyo+ynvhILXIY9E1Nu2WO8czaF+JbGUBzjbMXSuSjxPChVSRklEW3gzR
         h8mn+oXmmlz6yfJWvAS3YGYNKYoOqFWaASaxmYVxNTubQdOtWaLGlq1TH0ZhpQddowvZ
         BOCtLzW9YtN2en9bz0RByM6A7+rtOABuRt90VGwXd1BRCTXpwDBKXKtxUdd4QiGFaAIy
         ITGr9cBAzZxBC0E1KN/G6Lg3WwwRuXj4FlLrjk7p/UMq23q0f44oTxRXIIHnr/Ir+ep1
         4QyvGSmGog8UyyRXCIoUbaFgnjNjGtt+X+d0ydr/3/EOjv6txtz4CfHUEDZ0t5ypACdw
         3bVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620285; x=1796225085; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QIYZYd3o/tNv9e79fiRmovS4XRBJcwrqybTUeeJB7F4=;
        b=LNelTxC80kuJGgWd94JRjwbFfqFCUpZrPLU/Phz89lQGMPrUeFStBvdp4yHKIxQAuv
         G3iQhyU51czPxVYUJkQzTqTHmWomcukSPVQGNSjH5Io0J9YWrGHllR8nriuUjbZfZl7v
         sVtKtU09iwbOSqYeCh2HLVM6Gqjj4eNbJOrr1RKQ7tbqbTzZP65qDFeqDKF/d6MKqcx0
         XG+52ZxofV6kCoVPmRmh6cDX0+eM/QJL7l120nDRhxGLeNBtSzEwF6uX4HiQ/eEqUGeP
         Z1P5FKZD1qtYen2zohFN/7hh1T9O/hXzjca+0sMCy+Lydi9BtgrVUNW9A8CFo6mTw1Oy
         nrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620285; x=1796225085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIYZYd3o/tNv9e79fiRmovS4XRBJcwrqybTUeeJB7F4=;
        b=AQZNbUte0YK6G6iaEp3Vu/L31AIqvh1/MZIQJLYhNCrgPtqdAfGuPAd85jJYnpXRRv
         Pq2wQPYEM5bMl4kbaYbBfd6hGkB9CPoHjuvDap7XeIv6kGP2Tfyg2FQzKWQx1iLGNu1M
         bPQWDW+1y95d5Rw7yzYliK9zyALP3wlbLp2TFV99QoYIdLrRl164gp0lpyeUt6LWINEb
         z9/65yd8/JQawxQjHsvUAv2qe7fdDxJ6TRNjbpHCbB3DoEcSOUUdFuDJLNVVX0FNzj24
         IR0k0PHYpAx1xxA6K0r443ac0LKmogVGZif3dwtZno30K0p70UnIWiwObon/PYErYbiT
         Dtvg==
X-Forwarded-Encrypted: i=1; AL+hErE1+XjSnrVcj/Wcx4TtriTTfp79lKWmikBrzTj4q1jNCaxfaW/rEI+twrhGft6nrPULfD18G37wgg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+j9zGViEvbQoC1AUwXia958bSFXvTR0gkRci/mqCdePfL3zMUu
	QUtsDspXzFGFhR/o2Jekl+E/ch4qAyrjiTWx6YlMe7fIPBh/YDdoc6FGpiIE1qYSYGKt6eXgNF0
	mKnHFDLbPpkTEBjpaYeYEtb6TNC/nw/ImA28BghNkAz1v+qJEeM1hsqlU1H2g3V1dcMJ1Ylfqdw
	HoutSdv7T2j0aDYYm6v5asiELleQEkUYSG9Eft
X-Gm-Gg: AZFdTZeOdemj8d5oqN+Vlx8Dh5T/nFy5N8uQdXDSYT3V+l2e/KjKi07kxXRuX8bSTAM
	0KFIuBiHq2r7i9awcFpacNtkHwkhZos1Rh1+nCqX1hbW9sdvSrHHXp1hdc7pXfF1LPk9+W34dsN
	3B4bzg62eoapCH2mLzPG/Ew4hWBYIUWeNJda19U7plE+6K7pDe6Gjj4GUe4w==
X-Received: by 2002:a17:903:4b07:b0:2ef:de9a:e59 with SMTP id d9443c01a7336-2f03f1a1767mr166368825ad.23.1795620284594;
        Wed, 25 Nov 2026 07:24:44 -0800 (PST)
X-Received: by 2002:a17:903:4b07:b0:2ef:de9a:e59 with SMTP id
 d9443c01a7336-2f03f1a1767mr166368535ad.23.1795620283988; Wed, 25 Nov 2026
 07:24:43 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118-04-k3-pm-support-v5-0-42394acdf3e3@kernel.org>
In-Reply-To: <20261118-04-k3-pm-support-v5-0-42394acdf3e3@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:32 +0100
X-Gm-Features: Aa3M54olEAoYIpHYojNK94sf0JF_SRHhMMcIhjtuJGmTJ5tnlyfF1zWJRLUcNAA
Message-ID: <CAPx+jO-TqhmF=vwSveSQk0ayUKf9M9fSDBYygTx3uTdQ5QHSHw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PM: spacemit: Add power domain support
To: Yixun Lan <dlan@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Icenowy Zheng <uwu@icenowy.me>,
        Iker Pedrosa <ikerpedrosam@gmail.com>, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX/jJ6BPG+wzD+
 3aSpAsVzn2fF3xIES/3f3RkxUnrIqpxftPZXHLIYPr2wZaoQu7ksk1lIZrjV5wHmyhB1/AXKUkb
 iqfHVEkM542+9GeXnbnsa3YEjB12eq8=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06fdbd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8
 a=CDiEhUVfAZlwq9Ebo7kA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfXxH9oPzGiAG6r
 5TgPItguv6cgzAedr5xh6+zWcVIiAF2h7Q5cU7+jA7vIsmClqL8EMKEuEffkZC94GQoV8JIrScC
 x20gqtVbmrQWfOMyV43hlu32dAEV+z0RqQndaV5dynhw4ifP/2kDDEmnuwXW6a9y8ZkJSYAH3Gp
 ozREe3LdNHOfzQZ7ky2HD4u1Ikm8NVDptMxEN2ibr3M7OHT2xvJxM/ycvFiC5WC//sqRgGovlpU
 pYOAqO+eV7Elim0S5/dyFNay/gp8FeXe3pT4JygskN6d4CGOQ+ult6HaD/1wF40ci9rrPLDIMjr
 99zNoXfPx3ZWwZ1TNSd8CrJW9n9lSdYEAskd+jQnT/GTJoInGBvVdFKqXgjLn4NKCVZsMybWzwf
 FWna/jR0pjmhcb++9Gf7sJrgSe+OqGmucex+Z+74vDXmyIlh3CCnXP3wAH9Psn+EGxMGG1pdc0A
 Lh+JSDLgg4J9zPFfhtw==
X-Proofpoint-ORIG-GUID: dtn3O4SGErqnNb1aeY7lgQrrvAM_SWyU
X-Proofpoint-GUID: dtn3O4SGErqnNb1aeY7lgQrrvAM_SWyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250061

On Thu, Nov 19, 2026 at 12:13=E2=80=AFAM Yixun Lan <dlan@kernel.org> wrote:
>
> In this series, we try to add a Power Domain driver support for SpacemiT
> K1/K3 SoCs, the driver implement the power-switch functionaly which suppo=
rt
> power on/off, and it's based on Linux Generic PM Domain framework and
> similiar to vendor K1's implementation, but unlike the K3's vendor
> version which is more complicated.
>
>   The DT documentation for Power Domain already exist in below file,
> and APMU already has #power-domain-cells property.
> Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>
>   The previous DTS patch is obsolete, so I dropped it. For devices requir=
ed
> PM feature, it need to add a "power-domains" property, and should send in
> a separate patch.
>
>   In order to test this series, a prerequisite CCU patches are needed,
> which can be found here [1].
>
> Hi Ulf,
>  Would you be ok to take this version? only minor change updated.
> I think the sudden removal of pmdomain supplier is kind of an
> independent common issue (exist in other platfroms too), I do not
> want to addresse it in this series, see a possible solution in separate
> patch here [2], or Icenowy's preference in comment[3], or whatever
> way to take. Just let me know what you think..

I made a comment on that as well, but I am fine with this as is.
Please make a fix for the unbind/remove problem on top.

The v5 series applied for next, thanks!

Kind
Uffe


>
> Link: https://lore.kernel.org/spacemit/20261008-04-k3-clk-pm-aux-v1-0-837=
2d7307694@kernel.org/ [1]
> Link: https://lore.kernel.org/spacemit/20261112-01-pm-device-link-v1-1-89=
32e0862378@kernel.org/ [2]
> Link: https://lore.kernel.org/spacemit/b7d7ac2eee0e64aa7c267def5c2a8a022c=
7da425.camel@icenowy.me [3]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Changes in v5:
> - drop pm_index
> - fix dev_err() to return error code
> - Link to v4: https://patch.msgid.link/20261112-04-k3-pm-support-v4-0-de3=
931aa5153@kernel.org
>
> Changes in v4:
> - adjust Kconfig help message
> - drop unused include header
> - propagate regmap_read_x() error code
> - simplify spacemit_pm_is_off_state()
> - Link to v3: https://patch.msgid.link/20261108-04-k3-pm-support-v3-0-b9d=
c0857039b@kernel.org
>
> Changes in v3:
> - collect tags
> - rename spacemit_pm_is_off_state()
> - implement a remove() function
> - use proper type in struct spacemit_pm_domain_param
> - refactor struct spacemit_pmu
> - Link to v2: https://patch.msgid.link/20261008-04-k3-pm-support-v2-0-6f7=
78a53dd2d@kernel.org
>
> Changes in v2:
> - convert to auxilary driver
> - no need dt-binding doc, drop it
> - drop dts patch
> - support to build as module
> - set always on for K3 audio pm
> - no global variable for struct spacemit_pmu
> - no force to do power-off in spacemit_pd_power_on()
> - check return value of pm_genpd_init()
> - adjust license header format
> - Link to v1: https://patch.msgid.link/20260918-04-k3-pm-support-v1-0-0ac=
d2b36b96f@kernel.org
>
> ---
> Yixun Lan (2):
>       dt-bindings: power: spacemit: Add power domain controller IDs
>       pmdomain: spacemit: Add power domain driver
>
>  drivers/pmdomain/Kconfig                        |   1 +
>  drivers/pmdomain/Makefile                       |   1 +
>  drivers/pmdomain/spacemit/Kconfig               |  21 ++
>  drivers/pmdomain/spacemit/Makefile              |   1 +
>  drivers/pmdomain/spacemit/spacemit-pm-domains.c | 422 ++++++++++++++++++=
++++++
>  include/dt-bindings/power/spacemit,k1-power.h   |  14 +
>  include/dt-bindings/power/spacemit,k3-power.h   |  12 +
>  7 files changed, 472 insertions(+)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20260909-04-k3-pm-support-0bef40e87fd7
>
> Best regards,
> --
> Yixun Lan <dlan@kernel.org>
>
