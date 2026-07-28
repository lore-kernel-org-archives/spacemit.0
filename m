Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA263B19A9
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244769; cv=pass; b=NDcNHTPj/9EYiZy+7jyPw9LpgJhR/KN3I8U6dEGasex0Q1s+ghw5utO1xWKU9sgQmjfb3bPC9Czj3RzXq0fZtyG8HGziNjPLoAX1mE+nSk25dNbAA0Obb3iefIdCklJ1HJ/u2MuOKWED0vW/OJtDIJFSZVkn3bn3QJqCWS3V2Ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244769; c=relaxed/simple;
	bh=QBhObxMUgFixpqNh0VhKAcgY45hi1UoSYqoBvNbFV34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLSmypxZN4AsL5qpEAOg6i6z2HvMsKw95DQCmJGOce069tF+QDfMm1oxkhSzf6/iAyWSaQCiLPIBI0jBqLREjcvJSBUtNrBMl969mCCG87mBJpZM1Ji7wP6QfajQ0klTaNvzL4KmkG+8MWBMFt/60KF8zAckira/bsdle4Tbp9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NvUXdXZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNCgH9D9; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NvUXdXZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNCgH9D9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBH4QW2776878
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 13:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=nnctF54TPwZcGfOLut/LOPU4PbG6XXe/8IY6GCcEFK4=; b=Nv
	UXdXZd9+hB42Fk1exzHMahtIrXNLTWhyNOcrlmRhvPbtCpm3ALUp7tJx+iHwTAm3
	Me19xmPpfwHjXiVHKjbhPg4yY26O0pkGHWYYw/B0LMYmVIhCwVh/wMPByBdqpIu5
	IkZiNEm5ddg++0lomRQvfJ9dh3XtDlj1amSlH8D91oeEoEhoxfk5XH2fgrlQeHcr
	R2eFVQy0PCgAOnxBJ3aVDCL/qSLEkS6nw1TBcH2zImElIT1kes72yrF8MlTVRECj
	VjyqtuLmdj4F4YhZ3mD9fp0SaH0u1ySuIJNgxaXDhTn3rDci6GK1p3zHoKejr3NM
	1NIyuZ+XdTc/Bu0QwH8Q==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptatgspn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 13:19:24 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66899c73361so9479458d50.0
        for <spacemit@lists.linux.dev>; Tue, 28 Jul 2026 06:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785244764; cv=none;
        d=google.com; s=arc-20260327;
        b=qkYV0qr+YZhLuyuuT2yVLHtNwLMbJaLsQyVpPAnBlUO2ygLT4J60PgZwlf/5xEZ6CO
         aoQKG4VKdQXekis/vcrhfBnNXZVOXvePkdRip7Lp6bSOHUccxpqY4FXyPHQNwcxr/RkR
         1uB50LuKBya57WzVEFyMLKKnGz59co9F0DZ6O7pVyPEE24xEzA3IBDRRaHs4qw0u0xmJ
         LMpHWgKlmYfHKZ+ovp6XAlLLZMjvrrjgX2UmcopX2v7hZV/l4H6Ckg38geyYLUgLKWja
         w7ehmxF25tdOsD9sCNfmlGVYvdGYj4uXvuyChtiDAwe27zgb7a60ry1O4IE2jYSMXkhd
         21GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=nnctF54TPwZcGfOLut/LOPU4PbG6XXe/8IY6GCcEFK4=;
        fh=7nsFK7o0Kxvz6JRnoFQSIp3f3/o4h2z9SrL50oqr7mA=;
        b=FDAY89LOQtuF1KyCBYU4uv+CzYAmdMR7D1t3Ds6Mh/Xr7SdpxgItEC29RHbZhpuiJb
         rtThI8d473FR0LsVGVSBlWbk6RhtdoDt24Vc/RmUKrpuVy2U5YG1Ii6rSvAp4w/acZ4g
         9/u4p4alxQkUaXHOwGMUM9oMK8gobTWhBIGNkEfPeV/qvenRCZBfxvPAfpv65gH+tMhg
         YMThFENJzie79BNj//LndjYkubK27pZ85BjvFn0lH0opKg1NcR5lf41lhGalK9kFo3nl
         9wHrruIipxxlBKR4YoDCrOnXtt6mQ0dOEpTiyZchcTueu3SVhjbaJtHTTPRhSOi+lcar
         L+mQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785244764; x=1785849564; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nnctF54TPwZcGfOLut/LOPU4PbG6XXe/8IY6GCcEFK4=;
        b=iNCgH9D9Ao18ZFsvR2KxkF/EMNzbStKFkxty9Nv4uFX5VEXMiVIIm/l9dQZbNIpvAh
         UM4E9Z5CmEnOKWzIQGu6/EYH4MSzzD7hZPyNkbHWGpVFU32d0zaRox5f2EP+HWViMCmT
         9qaFkoxxT8aqknnJuQTD11Xbti1aiYFDVT6cX085zL2AWNgfzVQBAJa0hy+vsWSSPSFN
         oTtzNvWRCgBp+Nm/lUgunddwtTxOoi6KMSzUWcuPNuLcBDjwQTAtLtkX9JCf86s84bmq
         YG7/DRoi3iR0O4rQN0l3ZEEVgYgdVdmXKzBTb39lDDSkyTcn7hKcBHco82f6HHdc4fnO
         HGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244764; x=1785849564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnctF54TPwZcGfOLut/LOPU4PbG6XXe/8IY6GCcEFK4=;
        b=aMYudIDWGfvuF0IBRfeWvX0+hs7gndaQ66bhyJSF72NkjXFGuAhg2/EU5c98E+o02p
         OQGdFAl3O/IzPFT3sMMvlBa0jXPoDAtMlyITQZ3pLSyt8gNizaiX4SlJmhMtzHSbai9w
         XIMl79tGCz9r+r/GwfLqSMz+P277mzpiTCuajEi9JzoIKI+k5lUAYQ8RJHoefdv5ElRM
         Xm8eGcox7E42RrtIaAwuyY7+GrUn68ArWKWip71l2pKLNlAh/YaJuHZxgldFZWwrorhh
         oG17rnoUMxOYR7AZSAV+wiU2d1WxHzLxAwqGbLdAjt2k3SCR4qh44Dtm73PMXGk+mm8d
         Tyyw==
X-Forwarded-Encrypted: i=1; AHgh+RpzYTFh1qN47AcZUzDInAnBqLBV10LjXckARI67GN/YzNvmYRKIgw9X1p9+qCOTWUERNZA4zsroLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7Uo93j4e0o/nixFQqy2y0NCehpa/UXcE01uD7wDOACWSsZqhC
	cVvC1MLDk0ZhvBsWqop/njunB6Yan8mRDVlw1g4FjGztmRBa7cR9KZo1SPrYVYuLsYzkjYZbuM+
	0OctZ5Abwaymuz8295ikCM7rIWV/+AJ0c5+KgkoaEnWVWiw+N4ZIyBJlLZFYvteyNzmBCEHjLop
	6HRBQvxa7X6FFrnvnJtITUfEm9WjnNJypTFvn/
X-Gm-Gg: AR+sD10NhvQrEaGjjqxNZEYUEkfAw1ARbeVXvJnrWDPoySuRIHUMhMbK323VZHZDsDE
	Vz8M1Nf0XnwqZwL8nqJMxK/8HTZlUST3f8tyQBp7NVL2B6yJGh2yacGgkf7ZYOsFSNOQM6bPUV9
	qprm2NMnjiWL9K9MvpTdOMoNo3I+9VMg7fE+NqcRDsPIOqIUB3ZgLvPB3SCA==
X-Received: by 2002:a05:690e:4849:b0:668:81d:342f with SMTP id 956f58d0204a3-66905809df9mr477886d50.73.1785244763903;
        Tue, 28 Jul 2026 06:19:23 -0700 (PDT)
X-Received: by 2002:a05:690e:4849:b0:668:81d:342f with SMTP id
 956f58d0204a3-66905809df9mr477865d50.73.1785244763406; Tue, 28 Jul 2026
 06:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728-riscv-acpi-lpi-timer-v2-1-5a30e0021ec9@linux.spacemit.com>
 <CAB19ukH1Srbw+Yko_-21DiV7Wc0ysJX9cmE7xDTwtrmUm_5rMw@mail.gmail.com>
In-Reply-To: <CAB19ukH1Srbw+Yko_-21DiV7Wc0ysJX9cmE7xDTwtrmUm_5rMw@mail.gmail.com>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:49:11 +0530
X-Gm-Features: AUfX_mzeOeCPWWFFch2ozJZGQHNRh9Ub0Dz-7Jpvn5Ws_eaBKb5S0K8D3nqJKts
Message-ID: <CAB19ukHpFS-=nK6Tfjk-nY_Jz7Pi82pE4-YQkfQqoBXekOLtuw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: acpi: Handle LPI architectural context loss flags
To: Peixin Xie <peixin.xie@linux.spacemit.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Yixun Lan <dlan@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
        Oza Pawandeep <quic_poza@quicinc.com>, Will Deacon <will@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDExOCBTYWx0ZWRfX17ckKCqekDZ/
 NxEbfZztLlxph4hpEURqF1/Up/HUvh6FP8SVDIUZhPA27CVeMh32YhQKp6whQOV1ayXD3CPo6fi
 ayEuZOVAONNcXRvN+OJfME+HnNasfRM=
X-Proofpoint-ORIG-GUID: 3NM_k0mTzInqBGVWW-iyfTRcl6XSniMC
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a68ac5c cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8 a=lv0vYI88AAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=yZKCaVM-5Wx_WF_-bDkA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=FO4_E8m0qiDe52t0p3_H:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: 3NM_k0mTzInqBGVWW-iyfTRcl6XSniMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDExOCBTYWx0ZWRfX8ddHZVAzI0fe
 I1VTF2a1N/w50tnLKURtQYcCqb5aDuFIgvJ8n3rBG4X6xHOYMqa+2+FxSAFSbo2/9JM/npIbEJo
 PRNqDZAe34ohK6LZ5sY6WexU/MTFkLiSFG9OUDnlQ1O6sEicW+a6+66j3Tm6oJy+5r8mEtVmQmT
 LSPEikP1r9YXfVt2yzzuSifsoLrUKRmv5xQksC2Af0Z3PNn2XNzx/FP0LkD4n65ONrSQJp9JgPN
 kwEsfsVyxyCWpTposQYkUbCvMoN6K6hnByNai4C1w8XJEuZGMHtPU64vhp/ZTdToB3lVRDOXeAd
 GIjW7RSFFyirBeIg45RcAZyPZVPHw8K6/qL2XA3t2VRcWZgOmRyouRhIZmmgB/H2rPaEwXsLQ4P
 xC2zftDb6WLjmNJ3zFuXqVlmduI75TNc6d7LMTd4Vtv7bzO0amJA7J1/83eVhavRBFInswnU8CJ
 g/P4TjfTBmDHaDjuJsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280118

On Tue, Jul 28, 2026 at 6:24=E2=80=AFPM Sunil V L <sunilvl@oss.qualcomm.com=
> wrote:
>
> On Tue, Jul 28, 2026 at 5:24=E2=80=AFPM Peixin Xie
> <peixin.xie@linux.spacemit.com> wrote:
> >
> > Commit 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for
> > broadcast timer") replaced the generic nonzero check for LPI
> > architectural context loss flags with arch_get_idle_state_flags().
> > RISC-V does not implement the helper, so it falls back to the stub
> > that returns 0. Consequently, CPUIDLE_FLAG_TIMER_STOP is not set when
> > an LPI state loses the hart timer context, preventing cpuidle from
> > using a broadcast timer for that state.
> >
> > Implement the RISC-V helper and map the hart timer context loss flag
> > to CPUIDLE_FLAG_TIMER_STOP.
> >
> > Fixes: 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for broadc=
ast timer")
> > Cc: stable@vger.kernel.org
> > Acked-by: Sudeep Holla <sudeep.holla@kernel.org>
> > Reviewed-by: Yixun Lan <dlan@kernel.org>
> > Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
> > ---
> > Changes in v2:
> > - Correct the FFH specification reference to Chapter 2.1.1.2,
> >   Table 3, as suggested by Yixun.
> > - Link to v1: https://patch.msgid.link/20260728-riscv-acpi-lpi-timer-v1=
-1-c722bce01e48@linux.spacemit.com
> > ---
> >  arch/riscv/include/asm/acpi.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acp=
i.h
> > index 26ab37c171bc..2643e28fc08c 100644
> > --- a/arch/riscv/include/asm/acpi.h
> > +++ b/arch/riscv/include/asm/acpi.h
> > @@ -12,6 +12,8 @@
> >  #ifndef _ASM_ACPI_H
> >  #define _ASM_ACPI_H
> >
> > +#include <linux/cpuidle.h>
> > +
> >  /* Basic configuration for ACPI */
> >  #ifdef CONFIG_ACPI
> >
> > @@ -67,6 +69,23 @@ int acpi_get_riscv_isa(struct acpi_table_header *tab=
le,
> >
> >  void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbo=
m_size,
> >                              u32 *cboz_size, u32 *cbop_size);
> > +
> > +/*
> > + * RISC-V Functional Fixed Hardware Specification Version v1.0.1,
> > + * Chapter 2.1.1.2. Arch. Context Lost Flags, Table 3
> >
> Isn't it Chapter 3.1.2, Table 4?
>
It appears there is an issue with the HTML version regarding the
chapter numbering. I have reported this to the documentation team. In
the meantime, I recommend using the PDF version as the reference for
any citations.

Thanks,
Sunil
